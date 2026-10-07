import 'dart:convert';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final aiServiceProvider = Provider<AiService>((ref) {
  // TODO: Replace with real API key from environment or secure storage
  const apiKey = 'YOUR_GEMINI_API_KEY';
  return AiService(apiKey);
});

class AiService {
  final String _apiKey;
  late final GenerativeModel _model;

  AiService(this._apiKey) {
    _model = GenerativeModel(
      model: 'gemini-1.5-flash',
      apiKey: _apiKey,
      generationConfig: GenerationConfig(
        responseMimeType: 'application/json',
      ),
    );
  }

  Future<Map<String, dynamic>> prioritizeComplaint({
    required String title,
    required String description,
    required String category,
  }) async {
    final prompt = '''
Analyze this civic complaint for the Melaka Neighbourhood council and return a structured JSON response.
Priority scoring rules:
- Score from 1 to 10.
- Higher priority for safety risks, accessibility hazards, and highly visible public issues.
- Uneven walkways and trip hazards should generally rank high (8-10).
- Cosmetic vandalism should rank lower (2-4) unless it affects safety.
- Potholes and road damage are high (7-9).

Complaint Title: $title
Description: $description
Category: $category

Return format:
{
  "score": number,
  "priority": "low" | "medium" | "high",
  "reason": "Short explanation for the score",
  "category": "Validated or corrected category",
  "department": "Suggested council department (e.g., Public Works, Waste Management, Lighting)"
}
''';

    try {
      final content = [Content.text(prompt)];
      final response = await _model.generateContent(content);
      
      if (response.text == null) throw Exception('Empty response from AI');
      
      return jsonDecode(response.text!);
    } catch (e) {
      print('Error prioritizing complaint with AI: $e');
      // Fallback response
      return {
        "score": 5,
        "priority": "medium",
        "reason": "AI analysis unavailable. Defaulting to medium priority.",
        "category": category,
        "department": "General Services"
      };
    }
  }
}
