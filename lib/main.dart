import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'presentation/pages/home_page.dart';
import 'presentation/controllers/entries_controller.dart';
import 'data/repositories/entries_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  // Récupération des variables d’environnement
  final String apiUrl = dotenv.env['API_BASE_URL'] ?? '';
  final String apiKey = dotenv.env['API_KEY'] ?? '';

  // Vérifier que l'API_KEY est bien fournie
  if (apiUrl.isEmpty) {
    throw Exception("❌ L'URL de l'API est manquante dans .env");
  }
  if (apiKey.isEmpty) {
    throw Exception("❌ la clé API est manquante dans .env");
  }

  Get.put(
    EntriesController(
        repository: EntriesRepository(apiUrl: apiUrl, apiKey: apiKey)),
    permanent: true,
  );

  runApp(const TrackDiabApp());
}

class TrackDiabApp extends StatelessWidget {
  const TrackDiabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'TrackDiab',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
