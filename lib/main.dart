import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X Restaurant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.lobsterTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}

class GoogleFonts {
  static lobsterTextTheme(TextTheme textTheme) {}

  static pacifico({required TextStyle textStyle}) {}
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  get assets => null;

  @override
  Widget build(BuildContext context) {
    var mainpage;
    return Scaffold(
      appBar: AppBar(
        title: const Text('X Restaurant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 4),
                borderRadius: BorderRadius.circular(15),
              ),
              padding: const EdgeInsets.all(10),
              child: Image.asset(assets / mainpage.jpg),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                'Welcome to X Restaurant',
                style: GoogleFonts.pacifico(
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
