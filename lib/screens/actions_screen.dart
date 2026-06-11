import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/action_list_tile.dart';

class ActionsScreen extends StatelessWidget {
  const ActionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = context.watch<DashboardProvider>().upcomingActions;
    return Scaffold(
      appBar: AppBar(title: const Text('Actions')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Column(
              children: actions.map((a) => ActionListTile(action: a)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
