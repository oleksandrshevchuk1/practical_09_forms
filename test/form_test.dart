import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:practical_09/main.dart';

void main() {
  testWidgets('Форми перевіряють обов’язкові поля, email та 7 символів', (
    tester,
  ) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key('submit')));
    await tester.pumpAndSettle();
    expect(find.text('Обов’язкове поле'), findsNWidgets(2));
    await tester.enterText(find.byKey(const Key('email')), 'wrong');
    await tester.enterText(find.byKey(const Key('password')), '123456');
    await tester.tap(find.byKey(const Key('submit')));
    await tester.pumpAndSettle();
    expect(find.text('Введіть коректний email'), findsOneWidget);
    expect(find.text('Пароль має містити не менше 7 символів'), findsOneWidget);
    await tester.enterText(
      find.byKey(const Key('email')),
      'student@example.com',
    );
    await tester.enterText(find.byKey(const Key('password')), '1234567');
    await tester.tap(find.byKey(const Key('submit')));
    await tester.pumpAndSettle();
    expect(find.text('Демонстрація: форму входу заповнено.'), findsOneWidget);
  });
  testWidgets(
    'Реєстрація має ім’я, reset має тільки email; працює повернення',
    (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.tap(find.text('Sign up'));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('name')), findsOneWidget);
      await tester.tap(find.byKey(const Key('submit')));
      await tester.pumpAndSettle();
      expect(find.text('Обов’язкове поле'), findsNWidgets(3));
      await tester.tap(find.text('Back to login'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('Reset password'));
      await tester.pumpAndSettle();
      expect(find.byKey(const Key('password')), findsNothing);
      expect(find.byKey(const Key('name')), findsNothing);
      await tester.tap(find.byKey(const Key('submit')));
      await tester.pumpAndSettle();
      expect(find.text('Обов’язкове поле'), findsOneWidget);
    },
  );
}
