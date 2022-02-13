import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fm_music/injector.dart';
import 'package:fm_music/presentation/track_list/views/keys.dart';

import 'package:fm_music/main.dart';

void main() {
  initDependencies();
  testWidgets('Test search page initial state widgets visibility',
      (WidgetTester tester) async {
    await tester.pumpWidget(const FmMusic());

    expect(find.byKey(const Key(TracksKeys.searchAppBarKey)), findsOneWidget);
    expect(find.byKey(const Key(TracksKeys.initialScreenKey)), findsOneWidget);
  });

  testWidgets('Test type into search input field', (WidgetTester tester) async {
    await tester.pumpWidget(const FmMusic());

    await tester.enterText(
        find.byKey(const Key(TracksKeys.searchTextInputKey)), 'Eminem');
    await tester.pump(const Duration(milliseconds: 100));
    await tester.press(find.byKey(const Key(TracksKeys.clearSearchInputKey)));
  });
}
