import 'package:get/get.dart';
import '../../data/models/entry_model.dart';
import '../../data/repositories/entries_repository.dart';

class EntriesController extends GetxController {
  /// Liste des entrées de glycémie
  var entries = <EntryModel>[].obs;

  /// Indique si on est en chargement
  var isLoading = false.obs;

  final EntriesRepository repository;

  EntriesController({required this.repository});

  @override
  void onInit() {
    super.onInit();
    fetchAllEntries();
  }

  /// Récupère toutes les entrées depuis l'API
  Future<void> fetchAllEntries() async {
    try {
      isLoading.value = true;
      final result = await repository.fetchEntries();
      entries.value = result;

      // ✅ Ajout des logs pour vérifier les données chargées
      print("📊 Nombre d'entrées chargées : ${entries.length}");
      for (var entry in entries) {
        print("📌 SGV : ${entry.sgv}, Date : ${entry.date}");
      }
    } catch (e) {
      print("❌ Erreur lors de la récupération des données : $e");
    } finally {
      isLoading.value = false;
    }
  }
}
