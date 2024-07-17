import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:templateapps/main.dart';

void main() {
  testWidgets('Materi Widget Test', (WidgetTester tester) async {
    // Build Widget kita dan trigger sebuah frame supaya benar-benar muncul.
    await tester.pumpWidget(
      const MaterialApp(
        home: MateriWidgetTest(),
      ),
    );

    // Verifikasi bahwa ada 1 widget menampilkan text 'Materi Widget Test'
    // Text ini berada pada AppBar kita.
    expect(find.textContaining('Materi Widget Test'), findsOneWidget);

    // Verifikasi bahwa ada 1 widget yang menampilkan text 'Menunggu Data dari Socket'.
    expect(find.textContaining('Contoh Untuk Widget Test'), findsOneWidget);

    // Verifikasi bahwa ada 1 widget yang menampilkan Icon 'icons.home'.
    expect(find.byIcon(Icons.home), findsOneWidget);

    // Verifikasi bahwa ada 1 widget button, yaitu button 'Tombol'.
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tekan Button dan trigger sebuah frame
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verifikasi bahwa text telah berubah, dan menampilkan 'Tombol ditekan'
    expect(find.textContaining('Tombol ditekan'), findsOneWidget);
  });
}
