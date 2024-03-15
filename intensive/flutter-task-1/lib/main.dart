import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

void main() {
  runApp(const SurfApp());
}

class SurfApp extends StatelessWidget {
  const SurfApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter app v2.1',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePageStateful(title: 'Stateful page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePageStateful extends StatefulWidget {
  final String title;

  const HomePageStateful({required this.title, Key? key}) : super(key: key);

  @override
  State<HomePageStateful> createState() => _HomePageStatefulState();
}

class _HomePageStatefulState extends State<HomePageStateful> {
  late ConfettiController _confettiController;
  int _counter = 0;
  int _incrementCount = 0;
  int _decrementCount = 0;

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      _incrementCount++;
    });
  }

  void _decrementCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    }
    setState(() {
      _decrementCount++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Суперсчетчик v2.1'),
      ),
      body: Stack(
        children: [
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            maxBlastForce: 20,
            minBlastForce: 10,
            emissionFrequency: 0.05,
            numberOfParticles: 50,
            gravity: 0.05,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Значение счетчика 🧮:',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '$_counter',
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Text(
                  'Нажали на ➕: $_incrementCount',
                  style: const TextStyle(fontSize: 18),
                ),
                Text(
                  'Нажали на ➖: $_decrementCount',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              _incrementCounter();
              _confettiController.play();
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: _decrementCounter,
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }
}
