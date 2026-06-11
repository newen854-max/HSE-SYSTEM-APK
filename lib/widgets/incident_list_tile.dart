import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/incident_model.dart';
import '../theme/app_theme.dart';

class IncidentListTile extends StatelessWidget {
  final Incident incident;

  const IncidentListTile({super.key, required this.incident});

  Color _severityColor(String severity) {
    switch (severity) {
      case 'High':
        return AppTheme.dangerColor;
      case 'Medium':
        return AppTheme.warningColor;
      default:
        return AppTheme.successColor;
    }
  }

  Color _statusColor(String status) {
    switch (status) {
      case 'Open':
        return AppTheme.dangerColor;
      case 'Investigating':
        return AppTheme.warningColor;
      default:
        return AppTheme.successColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            children: [
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: _severityColor(incident.severity),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      incident.id,
                      style: const TextStyle(
                          color: Colors.white38, fontSize: 10),
                    ),
                    Text(
                      incident.title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${incident.location} · ${DateFormat('d MMM').format(incident.date)}',
                      style: const TextStyle(
                          color: Colors.white38, fontSize: 11),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _badge(incident.severity, _severityColor(incident.severity)),
                  const SizedBox(height: 4),
                  _badge(incident.status, _statusColor(incident.status)),
                ],
              ),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.white.withOpacity(0.05)),
      ],
    );
  }

  Widget _badge(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(label,
          style: TextStyle(
              color: color, fontSize: 10, fontWeight: FontWeight.w600)),
    );
  }
}
