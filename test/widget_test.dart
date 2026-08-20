import 'package:flutter_test/flutter_test.dart';
import 'package:nitin_portfolio/main.dart';

void main() {
  testWidgets('portfolio home shows identity and work', (WidgetTester tester) async {
    await tester.pumpWidget(const NitinPortfolioApp());
    await tester.pump();

    expect(find.textContaining('Nitin'), findsWidgets);
    expect(find.textContaining('Mistry'), findsWidgets);
    expect(find.text('SELECTED WORK'), findsOneWidget);
    expect(find.text('RESUME'), findsOneWidget);
    expect(find.text('WRITE TO ME'), findsOneWidget);
  });
}
