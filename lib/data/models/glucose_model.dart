/// Représente une mesure de glycémie
class GlucoseModel {
  final double glucoseLevel;
  final DateTime timestamp;

  GlucoseModel({
    required this.glucoseLevel,
    required this.timestamp,
  });

  @override
  String toString() {
    return 'GlucoseModel(glucoseLevel: $glucoseLevel, timestamp: $timestamp)';
  }
}
