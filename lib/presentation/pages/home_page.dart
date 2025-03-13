import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'history_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TrackDiab"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("Voir Historique"),
          onPressed: () {
            Get.to(() => const HistoryPage());
          },
        ),
      ),
    );
  }
}
