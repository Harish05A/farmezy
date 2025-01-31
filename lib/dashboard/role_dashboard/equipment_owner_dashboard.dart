import 'package:flutter/material.dart';

class EquipmentOwnerDashboard extends StatefulWidget {
  const EquipmentOwnerDashboard({super.key});

  @override
  State<EquipmentOwnerDashboard> createState() =>
      _EquipmentOwnerDashboardState();
}

class _EquipmentOwnerDashboardState extends State<EquipmentOwnerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Equipment Owner Dashboard'),
      ),
    );
  }
}
