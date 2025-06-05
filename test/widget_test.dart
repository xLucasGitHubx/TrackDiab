// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:trackdiab/main.dart';

void main() {
  testWidgets('Home page contains navigation button', (WidgetTester tester) async {
    // Build the application.
    await tester.pumpWidget(const TrackDiabApp());

    // Verify that the "Voir Historique" button is present.
    expect(find.text('Voir Historique'), findsOneWidget);

    // The counter example from the Flutter template is not relevant
    // for this project, so we only check that the initial home page
    // is displayed correctly.
  });
}
