import 'package:flutter/material.dart';
import 'package:magic_help_counter/providers/card_list_provider.dart';
import 'package:provider/provider.dart';

class AddCreature extends StatefulWidget {
  const AddCreature({Key? key}) : super(key: key);

  @override
  State<AddCreature> createState() => _AddCreatureState();
}

class _AddCreatureState extends State<AddCreature> {

  @override
  Widget build(BuildContext context) {
    List nom = Provider.of<CardListProvider>(context).cardList;
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Column(
            children: [
              Text(nom[0]),
              const SizedBox(
                height: 10,
              ),
              Image.network(
                'https://cards.scryfall.io/png/front/4/a/4a2e428c-dd25-484c-bbc8-2d6ce10ef42c.png?1559591808',
                width: 160,
              ),
              const SizedBox(
                height: 10,
              ),
              const Row(
                children: [
                  Text(
                    "Att:     ",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Def:",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
