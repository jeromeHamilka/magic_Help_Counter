import 'package:flutter/material.dart';
import 'package:magic_help_counter/counter_player.dart';
import 'package:magic_help_counter/models/card_model.dart';
import 'package:magic_help_counter/providers/card_list_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/form_card_name_autocomplete.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final CardListProvider cardListProvider = CardListProvider();

  @override
  Widget build(BuildContext context) {
    List<dynamic> cardListView =
        Provider.of<CardListProvider>(context, listen: true).cardList;
    List<String> listUriImageCardView =
        Provider.of<CardListProvider>(context, listen: true).listUriImageCard;
    String tcgplayer_id =
        Provider.of<CardListProvider>(context, listen: true).tcgplayer_id;
    String powerCard =
        Provider.of<CardListProvider>(context, listen: true).powerCard;
    List<MagicCard> magicCard =
        Provider.of<CardListProvider>(context, listen: true).magicCard;

    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(fontSize: 20),
        title: const Text("Magic The Gathering Counter"),
      ),
      body: Center(
        child: Column(
          children: [
            const CounterPlayer(),
            ElevatedButton(
              child: const Text('Add card'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormCardName()),
                );
              },
            ),
            // ElevatedButton(
            //   child: const Text('Add card Form'),
            //   onPressed: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //           builder: (context) =>
            //               const FormQueryCardNameAutocomplete()),
            //     );
            //   },
            // ),
            ElevatedButton(
              child: const Text('Add uri'),
              onPressed: () {
                print(cardListView);
                print(listUriImageCardView);
                print(tcgplayer_id);
                //print(powerCard);
              },
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(20),
                itemCount: cardListView.length,
                itemBuilder: (_, i) {
                  var cardName = cardListView[i];
                  var listUriImageCardViewIndex = listUriImageCardView[i];
                  magicCard.add(
                    MagicCard(
                      name: cardName,
                      urlImage: listUriImageCardViewIndex,
                      att: 0,
                      def: 0,
                    ),
                  );
                  return Dismissible(
                    key: Key('item $i$cardName'),

                    background: Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(Icons.delete, color: Colors.white),
                            Text('Move to trash', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),
                    secondaryBackground: Container(
                      color: Colors.red,
                      child: const Padding(
                        padding: EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Icon(Icons.delete, color: Colors.white),
                            Text('Move to trash', style: TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ),

                    onDismissed: (DismissDirection direction) {
                      // if (direction == DismissDirection.startToEnd) {
                      //   print("Add to favorite");
                      // } else {
                      //   print('Remove item');
                      // }
                      setState(() {
                        cardListView.removeAt(i);
                        listUriImageCardView.removeAt(i);
                        magicCard.removeAt(i);
                      });
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Card(
                            color: Colors.indigoAccent,
                            elevation: 10,
                            shape: const RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(12),
                              ),
                            ),
                            margin: const EdgeInsets.all(5),
                            child: SingleChildScrollView(
                              padding: const EdgeInsets.all(5),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.network(
                                    listUriImageCardViewIndex,
                                    //'https://cards.scryfall.io/png/front/4/a/4a2e428c-dd25-484c-bbc8-2d6ce10ef42c.png?1559591808',
                                    width: 80,
                                  ),
                                  Container(
                                    height: 140,
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          cardName,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.amberAccent),
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              'Att: ',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '${magicCard[i].att}',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                IconButton(
                                                  iconSize: 20,
                                                  color: Colors.green,
                                                  onPressed: () => {
                                                    setState(() {
                                                      magicCard[i].att =
                                                          magicCard[i].att! + 1;
                                                    }),
                                                  },
                                                  icon: const Icon(
                                                      Icons.add_circle),
                                                ),
                                                IconButton(
                                                  iconSize: 20,
                                                  color: Colors.red,
                                                  onPressed: () => {
                                                    setState(() {
                                                      magicCard[i].att =
                                                          magicCard[i].att! - 1;
                                                    }),
                                                  },
                                                  icon: const Icon(
                                                      Icons.remove_circle),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            const Text(
                                              ' def: ',
                                              style: TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            Text(
                                              '${magicCard[i].def}',
                                              style: const TextStyle(
                                                fontSize: 20,
                                                color: Colors.deepOrangeAccent,
                                              ),
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                IconButton(
                                                  iconSize: 20,
                                                  color: Colors.green,
                                                  onPressed: () => {
                                                    setState(() {
                                                      magicCard[i].def =
                                                          magicCard[i].def! + 1;
                                                    }),
                                                  },
                                                  icon: const Icon(
                                                      Icons.add_circle),
                                                ),
                                                IconButton(
                                                  iconSize: 20,
                                                  color: Colors.red,
                                                  onPressed: () => {
                                                    setState(() {
                                                      magicCard[i].def =
                                                          magicCard[i].def! - 1;
                                                    }),
                                                  },
                                                  icon: const Icon(
                                                      Icons.remove_circle),
                                                ),
                                              ],
                                            ),
                                            // Text(
                                            //   ' def: ${magicCard[i].def}',
                                            //   style:
                                            //       const TextStyle(fontSize: 20),
                                            // ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: -5,
                          right: 0,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                cardListView.removeAt(i);
                                listUriImageCardView.removeAt(i);
                                magicCard.removeAt(i);
                              });
                              print(cardListView);
                              print(listUriImageCardView);
                            },
                            icon: const Icon(
                              Icons.clear,
                            ),
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
