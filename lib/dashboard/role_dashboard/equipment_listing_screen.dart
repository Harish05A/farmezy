// equipment_listing_screen.dart
import 'package:farmezy/dashboard/role_dashboard/add_equipment_screen.dart';
import 'package:farmezy/models/equipment.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'equipment_details_screen.dart';

class EquipmentListingScreen extends StatefulWidget {
  const EquipmentListingScreen({super.key});

  @override
  State<EquipmentListingScreen> createState() => _EquipmentListingScreenState();
}

class _EquipmentListingScreenState extends State<EquipmentListingScreen> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Equipment Listings'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _firebaseFirestore.collection('equipments').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot documentSnapshot = snapshot.data!.docs[index];
              Equipment equipment = Equipment(
                id: documentSnapshot.id,
                name: documentSnapshot['name'],
                description: documentSnapshot['description'],
                price: double.parse(documentSnapshot['price'].toString()),
                ownerName: documentSnapshot['ownerName'] ?? '',
                ownerPhone: documentSnapshot['ownerPhone'] ?? '',
                ownerAddress: documentSnapshot['ownerAddress'] ?? '',
                equipmentCondition:
                    documentSnapshot['equipmentCondition'] ?? '',
              );
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        equipment.name,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        equipment.description,
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\$${equipment.price}',
                            style: TextStyle(fontSize: 16),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EquipmentDetailsScreen(
                                            equipment: equipment)),
                              );
                            },
                            child: const Text('View Details'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to add equipment screen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddEquipmentScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
