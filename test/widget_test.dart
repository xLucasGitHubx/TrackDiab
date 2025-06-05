// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:trackdiab/main.dart';

void main() {
  testWidgets('Navigate to history page when button tapped', (WidgetTester tester) async {
    // Build the application.
    await tester.pumpWidget(const TrackDiabApp());

    // Ensure the "Voir Historique" button is present on the home page.
    final Finder historyButton = find.text('Voir Historique');
    expect(historyButton, findsOneWidget);

    // Tap the button and trigger navigation.
    await tester.tap(historyButton);
    await tester.pumpAndSettle();

    // After navigation, the history page should be displayed.
    expect(find.text('Historique Glycémie'), findsOneWidget);
  });
}
