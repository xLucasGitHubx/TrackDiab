import 'dart:math';
import '../models/glucose_model.dart';

/// Simule un accès aux données (API, base locale, etc.)
class GlucoseRepository {
  /// Récupère une valeur de glycémie simulée
  Future<GlucoseModel> fetchCurrentGlucose() async {
    // On simule un temps de chargement
    await Future.delayed(const Duration(seconds: 2));

    // Génère une valeur entre 80 et 180 mg/dL
    final randomValue = 80 + Random().nextInt(100);

    // Retourne un "GlucoseModel" simulé
    return GlucoseModel(
      glucoseLevel: randomValue.toDouble(),
      timestamp: DateTime.now(),
    );
  }
}
