import 'package:flutter/material.dart';

class AgricultureOfficerDashboard extends StatefulWidget {
  const AgricultureOfficerDashboard({super.key});

  @override
  State<AgricultureOfficerDashboard> createState() =>
      _AgricultureOfficerDashboardState();
}

class _AgricultureOfficerDashboardState
    extends State<AgricultureOfficerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Agriculture Officer Dashboard'),
      ),
    );
  }
}
