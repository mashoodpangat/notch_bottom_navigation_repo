import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:notch_bottom_navigation/notch_bottom_navigation.dart';

void main() {
  testWidgets('renders icons and switches pages on tap', (tester) async {
    // Build a minimal app using your widget
    await tester.pumpWidget(
      MaterialApp(
        home: CustomNotchBottomNavigation(
          pages: const [
            Scaffold(body: Center(child: Text('Home'))),
            Scaffold(body: Center(child: Text('Search'))),
            Scaffold(body: Center(child: Text('Alerts'))),
            Scaffold(body: Center(child: Text('Settings'))),
          ],
          icons: const [Icons.home, Icons.search, Icons.notifications, Icons.settings],
          fabIcon: Icons.add,
        ),
      ),
    );

    // Initial page should show 'Home'
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Search'), findsNothing);

    // All icons should render
    expect(find.byIcon(Icons.home), findsOneWidget);
    expect(find.byIcon(Icons.search), findsOneWidget);
    expect(find.byIcon(Icons.notifications), findsOneWidget);
    expect(find.byIcon(Icons.settings), findsOneWidget);

    // Tap the Search icon and verify page switched
    await tester.tap(find.byIcon(Icons.search));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsNothing);
    expect(find.text('Search'), findsOneWidget);
  });

  testWidgets('FAB is present and tappable', (tester) async {
    var tapped = false;

    await tester.pumpWidget(
      MaterialApp(
        home: CustomNotchBottomNavigation(
          pages: const [
            Scaffold(body: Center(child: Text('Home'))),
            Scaffold(body: Center(child: Text('Search'))),
            Scaffold(body: Center(child: Text('Alerts'))),
            Scaffold(body: Center(child: Text('Settings'))),
          ],
          icons: const [Icons.home, Icons.search, Icons.notifications, Icons.settings],
          fabIcon: Icons.add,
          onFabTap: () => tapped = true,
        ),
      ),
    );

    // FAB icon is visible
    expect(find.byIcon(Icons.add), findsOneWidget);

    // Tap FAB
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    expect(tapped, isTrue);
  });
}
