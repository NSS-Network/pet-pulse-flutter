import 'package:flutter_test/flutter_test.dart';
import 'package:pet_pulse/main.dart';

void main() {
  testWidgets('Pet Pulse โหลดได้', (WidgetTester tester) async {
    await tester.pumpWidget(const PetPulseApp());
    await tester.pump();
    expect(find.text('🐾 Pet Pulse กำลังโหลด...'), findsOneWidget);
  });
}
