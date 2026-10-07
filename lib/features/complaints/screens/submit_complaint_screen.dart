import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';
import 'dart:io';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/services/ai_service.dart';
import '../../../core/services/complaint_service.dart';
import '../../../core/services/auth_service.dart';
import '../../../core/services/location_service.dart';
import '../../../models/complaint.dart';

class SubmitComplaintScreen extends ConsumerStatefulWidget {
  const SubmitComplaintScreen({super.key});

  @override
  ConsumerState<SubmitComplaintScreen> createState() => _SubmitComplaintScreenState();
}

class _SubmitComplaintScreenState extends ConsumerState<SubmitComplaintScreen> {
  int _currentStep = 0;
  String? _selectedCategory;
  final _descriptionController = TextEditingController();
  XFile? _image;
  bool _isSubmitting = false;
  
  final List<String> _categories = [
    'Uneven walkway',
    'Vandalized infrastructure',
    'Pothole',
    'Streetlight issue',
    'Drainage issue',
    'Litter / dumping',
    'Road damage',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: const Text('Submit Report'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              _buildProgressIndicator(),
              Expanded(
                child: _buildStepContent(),
              ),
              _buildBottomActions(),
            ],
          ),
          if (_isSubmitting)
            Container(
              color: Colors.black26,
              child: const Center(
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(height: 16),
                        Text('AI is prioritizing your report...'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ... (keeping progress indicator and step content methods similar but integrated)
  Widget _buildProgressIndicator() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: List.generate(4, (index) {
          return Expanded(
            child: Container(
              height: 4,
              margin: const EdgeInsets.symmetric(horizontal: 2),
              decoration: BoxDecoration(
                color: index <= _currentStep ? AppColors.secondary : AppColors.surfaceVariant,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 0: return _buildCategoryStep();
      case 1: return _buildPhotoStep();
      case 2: return _buildDescriptionStep();
      case 3: return _buildLocationStep();
      default: return const SizedBox();
    }
  }

  Widget _buildCategoryStep() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('What is the issue?', style: AppTextStyles.headlineMedium),
          const SizedBox(height: 24),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: _categories.map((cat) {
              final isSelected = _selectedCategory == cat;
              return ChoiceChip(
                label: Text(cat),
                selected: isSelected,
                onSelected: (val) => setState(() => _selectedCategory = val ? cat : null),
                selectedColor: AppColors.secondaryContainer,
                labelStyle: AppTextStyles.labelLarge.copyWith(
                  color: isSelected ? AppColors.onSecondaryContainer : AppColors.onSurface,
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoStep() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Snap a photo', style: AppTextStyles.headlineMedium),
          const SizedBox(height: 32),
          Expanded(
            child: GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.outlineVariant),
                ),
                child: _image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(24),
                        child: Image.file(File(_image!.path), fit: BoxFit.cover),
                      )
                    : const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_a_photo_outlined, size: 48, color: AppColors.outline),
                          SizedBox(height: 16),
                          Text('Tap to take a photo'),
                        ],
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final img = await ImagePicker().pickImage(source: ImageSource.camera);
    if (img != null) setState(() => _image = img);
  }

  Widget _buildDescriptionStep() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add details', style: AppTextStyles.headlineMedium),
          const SizedBox(height: 32),
          TextField(
            controller: _descriptionController,
            maxLines: 5,
            decoration: const InputDecoration(hintText: 'Describe the problem...'),
          ),
        ],
      ),
    );
  }

  Widget _buildLocationStep() {
    return const Center(child: Text('Location fetched automatically.'));
  }

  Widget _buildBottomActions() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          if (_currentStep > 0) ...[
            OutlinedButton(onPressed: () => setState(() => _currentStep--), child: const Text('Back')),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: FilledButton(
              onPressed: _isStepValid() ? (_currentStep == 3 ? _handleSubmit : () => setState(() => _currentStep++)) : null,
              child: Text(_currentStep == 3 ? 'Submit Report' : 'Continue'),
            ),
          ),
        ],
      ),
    );
  }

  bool _isStepValid() {
    if (_currentStep == 0) return _selectedCategory != null;
    if (_currentStep == 1) return _image != null;
    if (_currentStep == 2) return _descriptionController.text.isNotEmpty;
    return true;
  }

  Future<void> _handleSubmit() async {
    setState(() => _isSubmitting = true);

    try {
      final aiService = ref.read(aiServiceProvider);
      final complaintService = ref.read(complaintServiceProvider);
      final authService = ref.read(authServiceProvider);
      final locationService = ref.read(locationServiceProvider);

      // 1. Get AI Prioritization
      final aiResult = await aiService.prioritizeComplaint(
        title: _selectedCategory!,
        description: _descriptionController.text,
        category: _selectedCategory!,
      );

      // 2. Get Location
      final pos = await locationService.getCurrentLocation();
      
      // 3. Create Complaint
      final complaint = Complaint(
        id: const Uuid().v4(),
        userId: authService.currentUser?.uid ?? 'anonymous',
        title: _selectedCategory!,
        description: _descriptionController.text,
        category: aiResult['category'] ?? _selectedCategory!,
        imageUrl: '', // TODO: Upload to Storage
        latitude: pos?.latitude ?? 2.22,
        longitude: pos?.longitude ?? 102.27,
        priorityScore: (aiResult['score'] as num?)?.toDouble() ?? 5.0,
        aiPriority: aiResult['priority'] ?? 'medium',
        aiAnalysis: aiResult['reason'] ?? '',
        suggestedDepartment: aiResult['department'] ?? 'General',
        createdAt: DateTime.now(),
      );

      // 4. Submit to Firestore
      await complaintService.submitComplaint(complaint);

      if (mounted) {
        setState(() => _isSubmitting = false);
        _showSuccessDialog(aiResult);
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSubmitting = false);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    }
  }

  void _showSuccessDialog(Map<String, dynamic> aiResult) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => Container(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.check_circle, size: 64, color: AppColors.secondary),
            const SizedBox(height: 16),
            const Text('Report Submitted!', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(
              'AI analysis: ${aiResult['reason']}',
              textAlign: TextAlign.center,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 24),
            FilledButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
