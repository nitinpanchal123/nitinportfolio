import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nitin_portfolio/main.dart';

void main() {
  testWidgets('desktop home golden', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const NitinPortfolioApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    await expectLater(
      find.byType(NitinPortfolioApp),
      matchesGoldenFile('goldens/home_desktop.png'),
    );
  });

  testWidgets('mobile home golden', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const NitinPortfolioApp());
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 300));

    await expectLater(
      find.byType(NitinPortfolioApp),
      matchesGoldenFile('goldens/home_mobile.png'),
    );
  });
}
