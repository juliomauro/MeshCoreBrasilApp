// This is a basic Flutter widget test.
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:meshcorebrasilapp/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: McAppBr()));
    // Just verify the app builds and renders without crashing.
    expect(find.byType(McAppBr), findsOneWidget);
  });
}
