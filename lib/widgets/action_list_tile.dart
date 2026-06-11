import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/incident_model.dart';
import '../theme/app_theme.dart';

class ActionListTile extends StatelessWidget {
  final PendingAction action;

  const ActionListTile({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    final isOverdue = action.isOverdue;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 40,
                decoration: BoxDecoration(
                  color: isOverdue
                      ? AppTheme.dangerColor
                      : AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      action.description,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '${action.responsible} · Due ${DateFormat('d MMM').format(action.dueDate)}',
                      style: TextStyle(
                          color: isOverdue
                              ? AppTheme.dangerColor.withOpacity(0.8)
                              : Colors.white38,
                          fontSize: 11),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              _statusBadge(action.status, isOverdue),
            ],
          ),
        ),
        Divider(height: 1, color: Colors.white.withOpacity(0.05)),
      ],
    );
  }

  Widget _statusBadge(String status, bool isOverdue) {
    final color = isOverdue ? AppTheme.dangerColor : AppTheme.primaryColor;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        isOverdue ? 'OVERDUE' : status,
        style: TextStyle(
            color: color, fontSize: 9, fontWeight: FontWeight.w700),
      ),
    );
  }
}
