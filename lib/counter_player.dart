import 'package:flutter/material.dart';

class CounterPlayer extends StatefulWidget {
  const CounterPlayer({Key? key}) : super(key: key);

  @override
  State<CounterPlayer> createState() => _CounterPlayerState();
}

class _CounterPlayerState extends State<CounterPlayer> {
  int _counterMe = 20;
  int _counterAdversaire = 20;

  void _incrementCounterMe() {
    setState(() {
      _counterMe++;
    });
  }

  void _decrementCounterMe() {
    setState(() {
      _counterMe--;
    });
  }

  void _incrementCounterAdversaire() {
    setState(() {
      _counterAdversaire++;
    });
  }

  void _decrementCounterAdversaire() {
    setState(() {
      _counterAdversaire--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.all(15),
          color: Colors.white,
          elevation: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Moi",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              Text(
                "Vie: $_counterMe",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    iconSize: 50,
                    color: Colors.green,
                    onPressed: _incrementCounterMe,
                    icon: const Icon(Icons.add_circle),
                  ),
                  IconButton(
                    iconSize: 50,
                    color: Colors.red,
                    onPressed: _decrementCounterMe,
                    icon: const Icon(Icons.remove_circle),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          margin: const EdgeInsets.all(15),
          color: Colors.white,
          elevation: 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Adversaire",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.blue,
                ),
              ),
              Text(
                "Vie: $_counterAdversaire",
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    iconSize: 50,
                    color: Colors.green,
                    onPressed: _incrementCounterAdversaire,
                    icon: const Icon(Icons.add_circle),
                  ),
                  IconButton(
                    iconSize: 50,
                    color: Colors.red,
                    onPressed: _decrementCounterAdversaire,
                    icon: const Icon(Icons.remove_circle),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
