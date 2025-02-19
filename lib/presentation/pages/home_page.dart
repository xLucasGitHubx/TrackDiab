import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/constants/app_styles.dart';
import '../../core/widgets/custom_button.dart';
import '../controllers/glucose_controller.dart';
import '../widgets/glucose_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Instancie (ou récupère) le contrôleur GetX
    final GlucoseController controller = Get.put(GlucoseController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("TrackDiab", style: AppStyles.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          // Affiche un indicateur si on charge
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }

          // Sinon, si la valeur de glycémie est disponible, on l’affiche
          if (controller.currentGlucose.value != null) {
            final model = controller.currentGlucose.value!;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Widget dédié à l'affichage de la glycémie
                GlucoseInfo(glucose: model),
                const SizedBox(height: 20),
                CustomButton(
                  text: "Rafraîchir",
                  onPressed: () => controller.fetchGlucoseLevel(),
                ),
              ],
            );
          } else {
            // Si pas de valeur, on propose de recharger
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Aucune donnée de glycémie disponible."),
                  const SizedBox(height: 20),
                  CustomButton(
                    text: "Charger",
                    onPressed: () => controller.fetchGlucoseLevel(),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
