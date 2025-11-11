import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({
    super.key,
    required this.total,
    required this.step,
    required this.onButtonTap,
    required this.buttonText,
  });

  final int total;
  final int step;
  final VoidCallback onButtonTap;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Total count:'),
              Text(
                '$total',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              TextButton(onPressed: onButtonTap, child: const Text(buttonText),)
            ]
        )
    );
  }
}
