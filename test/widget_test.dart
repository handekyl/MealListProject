import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Sayaç artış testi', (WidgetTester tester) async {
    // Uygulamamızı oluştur ve bir çerçeve tetikle.
    await tester.pumpWidget(const MyApp());

    // Sayacın 0'dan başladığını doğrula.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // '+' ikonuna dokun ve bir çerçeve tetikle.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Sayacın arttığını doğrula.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Sayaç Uygulaması'),
        ),
        body: const Center(
          child: Counter(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Normalde bu fonksiyon sayaç değerini artırır.
          },
          tooltip: 'Artır',
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Butona basılma sayısı:'),
        Text(
          '$_counter',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Artır',
          child: const Icon(Icons.add),
        ),
      ],
    );
  }
}
