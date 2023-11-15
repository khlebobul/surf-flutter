import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('The Office "DVD"'),
        ),
        body: const InteractiveWidget(),
      ),
    );
  }
}

class InteractiveWidget extends StatefulWidget {
  const InteractiveWidget({super.key});

  @override
  _InteractiveWidgetState createState() => _InteractiveWidgetState();
}

class _InteractiveWidgetState extends State<InteractiveWidget> {
  Color boxColor = Colors.blue;
  double xOffset = 0.0;
  double yOffset = 0.0;
  double scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: xOffset + MediaQuery.of(context).size.width / 2,
          top: yOffset + MediaQuery.of(context).size.height / 2,
          child: GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                xOffset += details.delta.dx;
                yOffset += details.delta.dy;
              });
            },
            onTap: () {
              setState(() {
                boxColor = Colors.red;
              });
            },
            onDoubleTap: () {
              setState(() {
                boxColor = Colors.blue;
              });
            },
            onLongPress: () {
              setState(() {
                RotatedBox(
                  quarterTurns: 3,
                );
              });
            },
            child: Image.asset(
              'assets/dvd.png',
              color: boxColor,
              width: 200,
            ),
          ),
        ),
      ],
    );
  }
}
