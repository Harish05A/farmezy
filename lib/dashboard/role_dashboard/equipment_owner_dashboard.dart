import 'package:farmezy/dashboard/role_dashboard/add_equipment_screen.dart';
import 'package:farmezy/dashboard/role_dashboard/earnings_screen.dart';
import 'package:farmezy/dashboard/role_dashboard/equipment_listing_screen.dart';
import 'package:farmezy/dashboard/role_dashboard/rental_requests_screen.dart';
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
      appBar: AppBar(
        title: const Text('Equipment Owner Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Equipment Listings',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to equipment listing screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EquipmentListingScreen()),
                        );
                      },
                      child: const Text('View Listings'),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to add equipment screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddEquipmentScreen()),
                        );
                      },
                      child: const Text('Add Equipment'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Rental Requests',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to rental requests screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RentalRequestsScreen()),
                        );
                      },
                      child: const Text('View Requests'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Earnings',
                      style: TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to earnings screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EarningsScreen()),
                        );
                      },
                      child: const Text('View Earnings'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
