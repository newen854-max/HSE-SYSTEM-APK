import 'package:flutter/foundation.dart';

class DashboardProvider extends ChangeNotifier {
  // Dashboard data
  int _incidentsCount = 0;
  int _nearMissesCount = 0;
  int _inspectionsCount = 0;
  double _safetyScore = 95.5;
  String _currentStatus = 'Safe';

  // Getters
  int get incidentsCount => _incidentsCount;
  int get nearMissesCount => _nearMissesCount;
  int get inspectionsCount => _inspectionsCount;
  double get safetyScore => _safetyScore;
  String get currentStatus => _currentStatus;

  DashboardProvider() {
    _initializeDashboard();
  }

  void _initializeDashboard() {
    // Initialize with sample data
    _incidentsCount = 2;
    _nearMissesCount = 5;
    _inspectionsCount = 12;
    _safetyScore = 95.5;
    _currentStatus = 'Safe';
    notifyListeners();
  }

  void updateIncidents(int count) {
    _incidentsCount = count;
    _updateSafetyScore();
    notifyListeners();
  }

  void updateNearMisses(int count) {
    _nearMissesCount = count;
    _updateSafetyScore();
    notifyListeners();
  }

  void updateInspections(int count) {
    _inspectionsCount = count;
    notifyListeners();
  }

  void _updateSafetyScore() {
    // Calculate safety score based on incidents and near misses
    if (_incidentsCount == 0 && _nearMissesCount == 0) {
      _safetyScore = 100.0;
    } else {
      _safetyScore = (100.0 - (_incidentsCount * 5) - (_nearMissesCount * 1)).clamp(0, 100);
    }
    _currentStatus = _safetyScore >= 90 ? 'Safe' : _safetyScore >= 75 ? 'Caution' : 'Critical';
  }

  void resetDashboard() {
    _initializeDashboard();
  }
}
