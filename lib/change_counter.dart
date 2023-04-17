import 'package:flutter/material.dart';

class ChangeCounter extends StatefulWidget {
  const ChangeCounter({Key? key}) : super(key: key);

  @override
  State<ChangeCounter> createState() => _ChangeCounterState();
}

class _ChangeCounterState extends State<ChangeCounter> {
  int _counter = 0;

  void incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '$_counter',
          style: const TextStyle(
            fontSize: 30,
            color: Colors.blue
          ),
        ),
        IconButton(
          iconSize: 50,
          color: Colors.green,
          onPressed: incrementCounter,
          icon: const Icon(Icons.add_circle),
        ),
        IconButton(
          iconSize: 50,
          color: Colors.red,
          onPressed: _decrementCounter,
          icon: const Icon(Icons.remove_circle),
        ),
      ],
    );
  }
}
