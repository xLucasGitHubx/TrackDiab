import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/entries_controller.dart';
import '../widgets/glycemia_chart.dart';
import '../widgets/entry_card.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final EntriesController controller = Get.find<EntriesController>();

    return Scaffold(
      appBar: AppBar(title: const Text("Historique Glycémie")),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.entries.isEmpty) {
          return const Center(child: Text("Pas de données disponibles"));
        }

        return Column(
          children: [
            Expanded(child: GlycemiaChart(entries: controller.entries)),
            Expanded(
              child: ListView.builder(
                itemCount: controller.entries.length,
                itemBuilder: (context, index) {
                  return EntryCard(entry: controller.entries[index]);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
