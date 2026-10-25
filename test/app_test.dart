import 'package:flutter_test/flutter_test.dart';
import 'package:practical_09/main.dart' as app;

void main() {
  testWidgets('Практична 9: відкривається потрібний екран', (tester) async {
    app.main();
    await tester.pumpAndSettle();
    expect(find.text('Login'), findsWidgets);
  });
}
