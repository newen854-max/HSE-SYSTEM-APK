class Incident {
  final String id;
  final String title;
  final String location;
  final DateTime date;
  final String severity;
  final String status;

  Incident({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.severity,
    required this.status,
  });
}

class PendingAction {
  final String id;
  final String description;
  final String responsible;
  final DateTime dueDate;
  final String status;

  PendingAction({
    required this.id,
    required this.description,
    required this.responsible,
    required this.dueDate,
    required this.status,
  });

  bool get isOverdue =>
      dueDate.isBefore(DateTime.now()) && status != 'Closed';
}

class KpiData {
  final int totalIncidents;
  final int openInvestigations;
  final int closedInvestigations;
  final int pendingActions;
  final int overdueActions;

  KpiData({
    required this.totalIncidents,
    required this.openInvestigations,
    required this.closedInvestigations,
    required this.pendingActions,
    required this.overdueActions,
  });
}

class MonthlyTrend {
  final String month;
  final int count;

  MonthlyTrend({required this.month, required this.count});
}
