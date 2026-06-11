import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/kpi_card.dart';
import '../widgets/trend_chart.dart';
import '../widgets/incident_list_tile.dart';
import '../widgets/action_list_tile.dart';
import '../widgets/quick_action_button.dart';
import '../widgets/header_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DashboardProvider>();
    final kpi = provider.kpiData;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(6),
              ),
              child: const Icon(Icons.shield, size: 16, color: Colors.black),
            ),
            const SizedBox(width: 10),
            const Text('HSE Management System'),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Header
          const HeaderWidget(),
          const SizedBox(height: 20),

          // KPI Section
          _sectionLabel(context, 'KEY PERFORMANCE INDICATORS'),
          const SizedBox(height: 10),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 1.4,
            children: [
              KpiCard(
                label: 'Total Incidents',
                value: '${kpi.totalIncidents}',
                icon: Icons.report_problem,
                color: AppTheme.warningColor,
              ),
              KpiCard(
                label: 'Open Investigations',
                value: '${kpi.openInvestigations}',
                icon: Icons.search,
                color: AppTheme.dangerColor,
              ),
              KpiCard(
                label: 'Closed',
                value: '${kpi.closedInvestigations}',
                icon: Icons.check_circle_outline,
                color: AppTheme.successColor,
              ),
              KpiCard(
                label: 'Pending Actions',
                value: '${kpi.pendingActions}',
                icon: Icons.pending_actions,
                color: AppTheme.primaryColor,
              ),
              KpiCard(
                label: 'Overdue Actions',
                value: '${kpi.overdueActions}',
                icon: Icons.alarm_off,
                color: AppTheme.dangerColor,
                highlight: true,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Trend Chart
          _sectionLabel(context, 'MONTHLY INCIDENT TREND'),
          const SizedBox(height: 10),
          const TrendChart(),
          const SizedBox(height: 24),

          // Quick Actions
          _sectionLabel(context, 'QUICK ACTIONS'),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  label: 'Add Incident',
                  icon: Icons.add_circle_outline,
                  color: AppTheme.dangerColor,
                  onTap: () {},
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: QuickActionButton(
                  label: 'View Incidents',
                  icon: Icons.list_alt,
                  color: AppTheme.primaryColor,
                  onTap: () => context.read<DashboardProvider>().setIndex(1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: QuickActionButton(
                  label: 'Reports',
                  icon: Icons.bar_chart,
                  color: AppTheme.secondaryColor,
                  onTap: () => context.read<DashboardProvider>().setIndex(3),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: QuickActionButton(
                  label: 'Settings',
                  icon: Icons.settings_outlined,
                  color: Colors.white38,
                  onTap: () => context.read<DashboardProvider>().setIndex(4),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Recent Incidents
          _sectionLabel(context, 'RECENT INCIDENTS'),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: provider.recentIncidents
                  .map((incident) => IncidentListTile(incident: incident))
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),

          // Upcoming Actions
          _sectionLabel(context, 'UPCOMING ACTIONS'),
          const SizedBox(height: 10),
          Card(
            child: Column(
              children: provider.upcomingActions
                  .map((action) => ActionListTile(action: action))
                  .toList(),
            ),
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _sectionLabel(BuildContext context, String text) {
    return Text(
      text,
      style: const TextStyle(
        color: AppTheme.primaryColor,
        fontSize: 11,
        fontWeight: FontWeight.w700,
        letterSpacing: 1.4,
      ),
    );
  }
}
