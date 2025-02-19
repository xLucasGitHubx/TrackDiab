import 'package:flutter/material.dart';
import '../../core/constants/app_styles.dart';
import '../../data/models/glucose_model.dart';

/// Affiche les informations de glycémie de manière personnalisée
class GlucoseInfo extends StatelessWidget {
  final GlucoseModel glucose;

  const GlucoseInfo({super.key, required this.glucose});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Glycémie actuelle :",
          style: AppStyles.body.copyWith(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Text(
          "${glucose.glucoseLevel} mg/dL",
          style: AppStyles.title,
        ),
        const SizedBox(height: 8),
        Text(
          "Mesuré le : ${glucose.timestamp}",
          style: AppStyles.body,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
