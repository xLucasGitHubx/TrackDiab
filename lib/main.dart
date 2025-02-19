import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(const TrackDiabApp());
}

class TrackDiabApp extends StatelessWidget {
  const TrackDiabApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Utilise GetMaterialApp pour bénéficier de GetX (navigation, etc.)
    return GetMaterialApp(
      title: 'TrackDiab',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      // Page d’accueil de l’application
      home: const HomePage(),
    );
  }
}
