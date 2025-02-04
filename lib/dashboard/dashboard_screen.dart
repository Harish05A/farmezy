// dashboard_screen.dart
import 'package:flutter/material.dart';
import 'role_dashboard/farmer_dashboard.dart';
import 'role_dashboard/worker_dashboard.dart';
import 'role_dashboard/equipment_owner_dashboard.dart';
import 'role_dashboard/corporate_buyer_dashboard.dart';
import 'role_dashboard/agriculture_officer_dashboard.dart';

enum Role { farmer, worker, equipmentOwner, corporateBuyer, agricultureOfficer }

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Role _currentRole = Role.farmer;

  final Map<Role, Widget> _dashboards = {
    Role.farmer: FarmerDashboard(),
    Role.worker: WorkerDashboard(),
    Role.equipmentOwner: const EquipmentOwnerDashboard(),
    Role.corporateBuyer: const CorporateBuyerDashboard(),
    Role.agricultureOfficer: const AgricultureOfficerDashboard(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.green,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Hello, User!',
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Welcome to the dashboard!',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: _dashboards[_currentRole]!,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _getRoleIndex(_currentRole),
        onTap: (index) {
          setState(() {
            _currentRole = _getRoleFromIndex(index);
          });
        },
        items: [
          _buildNavigationBarItem(Icons.person, 'Farmer'),
          _buildNavigationBarItem(Icons.work, 'Worker'),
          _buildNavigationBarItem(Icons.delivery_dining, 'Equipment Owner'),
          _buildNavigationBarItem(Icons.shopping_cart, 'Corporate Buyer'),
          _buildNavigationBarItem(Icons.science, 'Agriculture Officer'),
        ],
      ),
    );
  }

  int _getRoleIndex(Role role) {
    return Role.values.indexOf(role);
  }

  Role _getRoleFromIndex(int index) {
    return Role.values[index];
  }

  BottomNavigationBarItem _buildNavigationBarItem(IconData icon, String label) {
    return BottomNavigationBarItem(
      icon: Icon(icon, color: Colors.green),
      label: label,
      backgroundColor: Colors.white,
    );
  }
}
