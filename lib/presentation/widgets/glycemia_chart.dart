import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../data/models/entry_model.dart';

class GlycemiaChart extends StatelessWidget {
  final List<EntryModel> entries;

  const GlycemiaChart({super.key, required this.entries});

  @override
  Widget build(BuildContext context) {
    print("📈 Nombre d'entrées pour le graphique : ${entries.length}");

    final sortedEntries = List<EntryModel>.from(entries)
      ..sort((a, b) => a.date.compareTo(b.date));

    if (sortedEntries.isEmpty) {
      return const Center(child: Text("📉 Aucune donnée pour le graphique"));
    }

    final spots = sortedEntries.map((entry) {
      final xValue = entry.date.millisecondsSinceEpoch.toDouble();
      final yValue = entry.sgv.toDouble(); // Assurer que SGV est un double
      print("📌 Point ajouté au graphe : x=$xValue, y=$yValue");
      return FlSpot(xValue, yValue);
    }).toList();

    return SizedBox(
      height: 200,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}
