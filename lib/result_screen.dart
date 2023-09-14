import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswer});
  final List<String> chosenAnswer;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('You answered X out of Y questions correctly!'),
          const SizedBox(
            height: 20,
          ),
          const Text('List of answers '),
          const SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Restart Quiz'),
          ),
        ],
      ),
    );
  }
}
