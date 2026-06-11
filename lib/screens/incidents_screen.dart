import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/incident_list_tile.dart';

class IncidentsScreen extends StatelessWidget {
  const IncidentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final incidents = context.watch<DashboardProvider>().recentIncidents;
    return Scaffold(
      appBar: AppBar(title: const Text('Incidents')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: incidents
                  .map((i) => IncidentListTile(incident: i))
                  .toList(),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add),
        label: const Text('Add Incident'),
      ),
    );
  }
}
