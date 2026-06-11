import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/dashboard_card.dart';
import '../widgets/safety_score_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HSE Management System'),
        elevation: 0,
      ),
      body: Consumer<DashboardProvider>(
        builder: (context, provider, child) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Safety Score Section
                  SafetyScoreWidget(
                    score: provider.safetyScore,
                    status: provider.currentStatus,
                  ),
                  const SizedBox(height: 24),

                  // Dashboard Cards
                  const Text(
                    'Key Metrics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      DashboardCard(
                        title: 'Incidents',
                        count: provider.incidentsCount,
                        color: Colors.red,
                        icon: Icons.warning,
                      ),
                      DashboardCard(
                        title: 'Near Misses',
                        count: provider.nearMissesCount,
                        color: Colors.orange,
                        icon: Icons.error_outline,
                      ),
                      DashboardCard(
                        title: 'Inspections',
                        count: provider.inspectionsCount,
                        color: Colors.blue,
                        icon: Icons.assignment_turned_in,
                      ),
                      DashboardCard(
                        title: 'Trainings',
                        count: 8,
                        color: Colors.green,
                        icon: Icons.school,
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Action Buttons
                  const Text(
                    'Quick Actions',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Report Incident functionality coming soon'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.add_alert),
                      label: const Text('Report Incident'),
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('New Inspection functionality coming soon'),
                          ),
                        );
                      },
                      icon: const Icon(Icons.assignment),
                      label: const Text('New Inspection'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
