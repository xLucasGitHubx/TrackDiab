import 'package:get/get.dart';
import '../../data/models/glucose_model.dart';
import '../../data/repositories/glucose_repository.dart';

/// Contrôleur GetX pour la gestion de la glycémie
class GlucoseController extends GetxController {
  /// Le niveau de glycémie actuel
  var currentGlucose = Rxn<GlucoseModel>();

  /// Indicateur de chargement
  var isLoading = false.obs;

  /// Instancier le repository
  final GlucoseRepository _repository = GlucoseRepository();

  @override
  void onInit() {
    super.onInit();
    fetchGlucoseLevel();
  }

  /// Récupère la valeur de glycémie auprès du repository
  void fetchGlucoseLevel() async {
    try {
      isLoading.value = true;
      final result = await _repository.fetchCurrentGlucose();
      currentGlucose.value = result;
    } catch (e) {
      // Gérer les erreurs si besoin
      print("Erreur lors de la récupération de la glycémie: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
