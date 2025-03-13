import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/entry_model.dart';

class EntriesRepository {
  final String apiUrl;
  final String apiKey;

  EntriesRepository({required this.apiUrl, required this.apiKey});

  Future<List<EntryModel>> fetchEntries() async {
    final Uri uri = Uri.parse(apiUrl);

    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Basic ${base64Encode(utf8.encode('$apiKey:'))}",
        "Content-Type": "application/json",
        "Accept": "application/json" // Ajout de ce header pour forcer JSON
      },
    );

    print("📡 Réponse brute = \"${response.body}\"");

    if (response.statusCode == 200) {
      try {
        // Vérification que la réponse est bien un JSON
        if (!response.body.trim().startsWith("[") &&
            !response.body.trim().startsWith("{")) {
          print("❌ La réponse reçue n'est pas un JSON valide.");
          throw Exception(
              "La réponse de l'API n'est pas un JSON valide. Body: ${response.body}");
        }

        // Tentative de parsing JSON
        final List<dynamic> jsonList = jsonDecode(response.body);
        print("✅ JSON décodé avec succès : $jsonList");

        return jsonList.map((e) => EntryModel.fromJson(e)).toList();
      } catch (e) {
        print("❌ Erreur lors du parsing JSON : $e");
        throw Exception("Format de données invalide : $e");
      }
    } else {
      print("❌ Erreur HTTP : ${response.statusCode}, body = ${response.body}");
      throw Exception("Impossible de récupérer les entrées");
    }
  }
}
