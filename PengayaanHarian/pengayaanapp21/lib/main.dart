import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MateriWidgetTest(),
    );
  }
}

class MateriWidgetTest extends StatefulWidget {
  const MateriWidgetTest({super.key});

  @override
  State<MateriWidgetTest> createState() => _MateriWidgetTestState();
}

class _MateriWidgetTestState extends State<MateriWidgetTest> {
  String text = "Contoh Untuk Widget Test";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Materi Widget Test",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text),
            const Icon(Icons.home),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  text = "Tombol ditekan";
                });
              },
              child: const Text('Tombol'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const MateriWidgetTest()),
          );
        },
        child: const Icon(Icons.replay_outlined),
      ),
    );
  }
}
