import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';

class ConfettiWidget extends StatelessWidget {
  final ConfettiController confettiController;

  const ConfettiWidget({
    Key? key,
    required this.confettiController,
    required this.blastDirectionality,
    required this.maxBlastForce,
    required this.emissionFrequency,
    required this.minBlastForce,
    required this.numberOfParticles,
    required this.gravity,
  }) : super(key: key);

  final BlastDirectionality blastDirectionality;
  final int maxBlastForce;
  final double emissionFrequency;
  final int minBlastForce;
  final int numberOfParticles;
  final double gravity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ConfettiWidget(
          confettiController: confettiController,
          blastDirectionality: BlastDirectionality.explosive,
          maxBlastForce: 20,
          minBlastForce: 10,
          emissionFrequency: 0.05,
          numberOfParticles: 50,
          gravity: 0.05,
        ),
      ],
    );
  }
}
