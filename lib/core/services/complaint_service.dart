import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../models/complaint.dart';

final complaintServiceProvider = Provider<ComplaintService>((ref) {
  return ComplaintService(FirebaseFirestore.instance);
});

class ComplaintService {
  final FirebaseFirestore _db;

  ComplaintService(this._db);

  CollectionReference<Map<String, dynamic>> get _complaints => _db.collection('complaints');

  Future<void> submitComplaint(Complaint complaint) async {
    await _complaints.doc(complaint.id).set(complaint.toJson());
  }

  Stream<List<Complaint>> getComplaintsStream() {
    return _complaints
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Complaint.fromJson(doc.data()))
            .toList());
  }

  Stream<List<Complaint>> getUserComplaintsStream(String userId) {
    return _complaints
        .where('userId', isEqualTo: userId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Complaint.fromJson(doc.data()))
            .toList());
  }

  Future<void> updateComplaintStatus(String complaintId, ComplaintStatus status, {String? adminNote}) async {
    final data = {
      'status': status.name,
      'updatedAt': FieldValue.serverTimestamp(),
    };
    if (adminNote != null) {
      data['adminNote'] = adminNote;
    }
    await _complaints.doc(complaintId).update(data);
  }

  Future<void> upvoteComplaint(String complaintId) async {
    await _complaints.doc(complaintId).update({
      'upvotes': FieldValue.increment(1),
    });
  }
}
