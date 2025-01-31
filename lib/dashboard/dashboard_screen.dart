import 'package:flutter/material.dart';
import 'role_dashboard/farmer_dashboard.dart';
import 'role_dashboard/worker_dashboard.dart';
import 'role_dashboard/equipment_owner_dashboard.dart';
import 'role_dashboard/corporate_buyer_dashboard.dart';
import 'role_dashboard/agriculture_officer_dashboard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  final List<Widget> _dashboards = [
    FarmerDashboard(),
    WorkerDashboard(),
    const EquipmentOwnerDashboard(),
    const CorporateBuyerDashboard(),
    const AgricultureOfficerDashboard(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: _dashboards[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: Colors.green,
            ),
            label: 'Farmer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work, color: Colors.green),
            label: 'Worker',
            backgroundColor: Colors.grey,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delivery_dining, color: Colors.green),
            label: 'Equipment Owner',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.green),
            label: 'Corporate Buyer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.science, color: Colors.green),
            label: 'Agriculture Officer',
          ),
        ],
      ),
    );
  }
}
