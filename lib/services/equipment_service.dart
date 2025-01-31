import 'package:cloud_firestore/cloud_firestore.dart';

class EquipmentService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> viewEquipment() async {
    try {
      QuerySnapshot snapshot = await _db.collection('equipment').get();
      for (var doc in snapshot.docs) {
        // Display each equipment item
        print(doc['name']);
      }
    } catch (e) {
      print('Error fetching equipment: $e');
    }
  }

  Future<void> addEquipment(String name, String description) async {
    try {
      await _db.collection('equipment').add({
        'name': name,
        'description': description,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('Error adding equipment: $e');
    }
  }
}
