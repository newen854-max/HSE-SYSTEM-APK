import 'package:flutter/material.dart';
import '../models/incident_model.dart';

class DashboardProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  final KpiData kpiData = KpiData(
    totalIncidents: 47,
    openInvestigations: 8,
    closedInvestigations: 39,
    pendingActions: 15,
    overdueActions: 4,
  );

  final List<MonthlyTrend> monthlyTrends = [
    MonthlyTrend(month: 'Jan', count: 5),
    MonthlyTrend(month: 'Feb', count: 8),
    MonthlyTrend(month: 'Mar', count: 3),
    MonthlyTrend(month: 'Apr', count: 12),
    MonthlyTrend(month: 'May', count: 7),
    MonthlyTrend(month: 'Jun', count: 4),
    MonthlyTrend(month: 'Jul', count: 9),
    MonthlyTrend(month: 'Aug', count: 6),
  ];

  final List<Incident> recentIncidents = [
    Incident(
      id: 'INC-2024-047',
      title: 'Chemical Spill - Storage Area B',
      location: 'Warehouse B',
      date: DateTime(2024, 8, 10),
      severity: 'High',
      status: 'Open',
    ),
    Incident(
      id: 'INC-2024-046',
      title: 'Slip & Fall - Corridor 3',
      location: 'Main Building',
      date: DateTime(2024, 8, 9),
      severity: 'Medium',
      status: 'Investigating',
    ),
    Incident(
      id: 'INC-2024-045',
      title: 'Near Miss - Forklift Zone',
      location: 'Loading Bay',
      date: DateTime(2024, 8, 8),
      severity: 'Low',
      status: 'Closed',
    ),
    Incident(
      id: 'INC-2024-044',
      title: 'Equipment Malfunction',
      location: 'Production Floor',
      date: DateTime(2024, 8, 7),
      severity: 'Medium',
      status: 'Closed',
    ),
    Incident(
      id: 'INC-2024-043',
      title: 'Fire Alarm Activation',
      location: 'Office Block A',
      date: DateTime(2024, 8, 6),
      severity: 'High',
      status: 'Closed',
    ),
  ];

  final List<PendingAction> upcomingActions = [
    PendingAction(
      id: 'ACT-001',
      description: 'Fire extinguisher inspection — all floors',
      responsible: 'John Smith',
      dueDate: DateTime(2024, 8, 5),
      status: 'Overdue',
    ),
    PendingAction(
      id: 'ACT-002',
      description: 'Update emergency evacuation plan',
      responsible: 'Sarah Lee',
      dueDate: DateTime(2024, 8, 15),
      status: 'In Progress',
    ),
    PendingAction(
      id: 'ACT-003',
      description: 'PPE audit — warehouse staff',
      responsible: 'Mike Johnson',
      dueDate: DateTime(2024, 8, 3),
      status: 'Overdue',
    ),
    PendingAction(
      id: 'ACT-004',
      description: 'Conduct safety induction for new hires',
      responsible: 'Emily Davis',
      dueDate: DateTime(2024, 8, 20),
      status: 'Pending',
    ),
    PendingAction(
      id: 'ACT-005',
      description: 'Chemical storage labelling review',
      responsible: 'John Smith',
      dueDate: DateTime(2024, 8, 25),
      status: 'Pending',
    ),
  ];
}
