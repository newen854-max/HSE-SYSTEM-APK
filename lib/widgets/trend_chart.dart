import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:provider/provider.dart';
import '../providers/dashboard_provider.dart';
import '../theme/app_theme.dart';

class TrendChart extends StatefulWidget {
  const TrendChart({super.key});

  @override
  State<TrendChart> createState() => _TrendChartState();
}

class _TrendChartState extends State<TrendChart> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    final trends = context.watch<DashboardProvider>().monthlyTrends;
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.darkCard,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.06)),
      ),
      child: BarChart(
        BarChartData(
          barTouchData: BarTouchData(
            touchCallback: (event, response) {
              setState(() {
                if (response?.spot != null &&
                    event is! FlPointerExitEvent) {
                  touchedIndex = response!.spot!.touchedBarGroupIndex;
                } else {
                  touchedIndex = null;
                }
              });
            },
            touchTooltipData: BarTouchTooltipData(
              getTooltipColor: (_) => AppTheme.darkSurface,
              getTooltipItem: (group, groupIndex, rod, rodIndex) {
                return BarTooltipItem(
                  '${trends[groupIndex].month}\n',
                  const TextStyle(color: Colors.white54, fontSize: 11),
                  children: [
                    TextSpan(
                      text: '${rod.toY.toInt()} incidents',
                      style: const TextStyle(
                          color: AppTheme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                );
              },
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            rightTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            topTitles: const AxisTitles(
              sideTitles: SideTitles(showTitles: false),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final index = value.toInt();
                  if (index < 0 || index >= trends.length) {
                    return const SizedBox.shrink();
                  }
                  return Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text(
                      trends[index].month,
                      style: const TextStyle(
                          color: Colors.white38, fontSize: 10),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          gridData: FlGridData(
            drawVerticalLine: false,
            getDrawingHorizontalLine: (_) => FlLine(
              color: Colors.white.withOpacity(0.05),
              strokeWidth: 1,
            ),
          ),
          barGroups: trends.asMap().entries.map((entry) {
            final isTouched = entry.key == touchedIndex;
            return BarChartGroupData(
              x: entry.key,
              barRods: [
                BarChartRodData(
                  toY: entry.value.count.toDouble(),
                  color: isTouched
                      ? AppTheme.secondaryColor
                      : AppTheme.primaryColor.withOpacity(0.8),
                  width: 18,
                  borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(4)),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
