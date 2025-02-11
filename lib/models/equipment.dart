// equipment.dart
import 'package:cloud_firestore/cloud_firestore.dart';

class Equipment {
  final String id;
  final String name;
  final String description;
  final double price;
  final String ownerName;
  final String ownerPhone;
  final String ownerAddress;
  final String equipmentCondition;

  Equipment({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.ownerName,
    required this.ownerPhone,
    required this.ownerAddress,
    required this.equipmentCondition,
  });

  factory Equipment.fromDocument(DocumentSnapshot documentSnapshot) {
    return Equipment(
      id: documentSnapshot.id,
      name: documentSnapshot['name'],
      description: documentSnapshot['description'],
      price: documentSnapshot['price'],
      ownerName: documentSnapshot['ownerName'],
      ownerPhone: documentSnapshot['ownerPhone'],
      ownerAddress: documentSnapshot['ownerAddress'],
      equipmentCondition: documentSnapshot['equipmentCondition'],
    );
  }
}
