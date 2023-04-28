import 'package:flutter/material.dart';
import 'package:magic_help_counter/providers/counter_life_provider.dart';
import 'package:provider/provider.dart';

class CounterPlayer extends StatefulWidget {
  const CounterPlayer({Key? key}) : super(key: key);

  @override
  State<CounterPlayer> createState() => _CounterPlayerState();
}

class _CounterPlayerState extends State<CounterPlayer> {
  @override
  Widget build(BuildContext context) {
    int counterPlayer1 =
        Provider.of<CounterLifeProvider>(context).counterPlayer1;
    int counterPlayer2 =
        Provider.of<CounterLifeProvider>(context).counterPlayer2;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          margin: const EdgeInsets.all(15),
          color: Colors.white,
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Player 1",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              Text(
                "Life: $counterPlayer1",
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
                    onPressed: () => {
                      Provider.of<CounterLifeProvider>(context, listen: false)
                          .incrementCounterPlayer1(),
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                  IconButton(
                    iconSize: 50,
                    color: Colors.red,
                    onPressed: () => {
                      Provider.of<CounterLifeProvider>(context, listen: false)
                          .decrementCounterPlayer1(),
                    },
                    icon: const Icon(Icons.remove_circle),
                  ),
                ],
              ),
            ],
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.black,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
          margin: const EdgeInsets.all(15),
          color: Colors.white,
          elevation: 20,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                "Player 2",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              Text(
                "Life: $counterPlayer2",
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
                    onPressed: () => {
                      Provider.of<CounterLifeProvider>(context, listen: false)
                          .incrementCounterPlayer2(),
                    },
                    icon: const Icon(Icons.add_circle),
                  ),
                  IconButton(
                    iconSize: 50,
                    color: Colors.red,
                    onPressed: () => {
                      Provider.of<CounterLifeProvider>(context, listen: false)
                          .decrementCounterPlayer2(),
                    },
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
