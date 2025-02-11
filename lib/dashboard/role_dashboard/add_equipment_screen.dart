// add_equipment_screen.dart
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddEquipmentScreen extends StatefulWidget {
  const AddEquipmentScreen({super.key});

  @override
  _AddEquipmentScreenState createState() => _AddEquipmentScreenState();
}

class _AddEquipmentScreenState extends State<AddEquipmentScreen> {
  final _formKey = GlobalKey<FormState>();
  final _equipmentNameController = TextEditingController();
  final _equipmentDescriptionController = TextEditingController();
  final _equipmentPriceController = TextEditingController();
  final _ownerNameController = TextEditingController();
  final _ownerPhoneController = TextEditingController();
  final _ownerAddressController = TextEditingController();
  final _equipmentConditionController = TextEditingController();
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Equipment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text(
                'Equipment Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter equipment name';
                  }
                  return null;
                },
                controller: _equipmentNameController,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Description',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter equipment description';
                  }
                  return null;
                },
                controller: _equipmentDescriptionController,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Price',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter equipment price';
                  }
                  return null;
                },
                controller: _equipmentPriceController,
              ),
              SizedBox(height: 20),
              Text(
                'Owner Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Owner Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter owner name';
                  }
                  return null;
                },
                controller: _ownerNameController,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Owner Phone',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter owner phone';
                  }
                  return null;
                },
                controller: _ownerPhoneController,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Owner Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter owner address';
                  }
                  return null;
                },
                controller: _ownerAddressController,
              ),
              SizedBox(height: 20),
              Text(
                'Equipment Condition',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Equipment Condition',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter equipment condition';
                  }
                  return null;
                },
                controller: _equipmentConditionController,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _firebaseFirestore.collection('equipments').add({
                      'name': _equipmentNameController.text,
                      'description': _equipmentDescriptionController.text,
                      'price': double.parse(_equipmentPriceController.text),
                      'ownerName': _ownerNameController.text,
                      'ownerPhone': _ownerPhoneController.text,
                      'ownerAddress': _ownerAddressController.text,
                      'equipmentCondition': _equipmentConditionController.text,
                    });
                    Navigator.pop(context);
                  }
                },
                child: Text('Add Equipment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
