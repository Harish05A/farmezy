import 'package:flutter/material.dart';

class CorporateBuyerDashboard extends StatefulWidget {
  const CorporateBuyerDashboard({super.key});

  @override
  State<CorporateBuyerDashboard> createState() =>
      _CorporateBuyerDashboardState();
}

class _CorporateBuyerDashboardState extends State<CorporateBuyerDashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Corporate Buyer Dashboard'),
      ),
    );
  }
}
