import 'package:flutter/material.dart';
import 'package:magic_help_counter/providers/card_list_provider.dart';
import 'package:provider/provider.dart';
import 'widgets/form_card_name_autocomplete.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    List<dynamic> cardListView = Provider.of<CardListProvider>(context).cardList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Magic The Gathering Help counter"),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              child: const Text('Add card'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FormCardName()),
                );
              },
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: cardListView.length,
                  itemBuilder: (_, i) {
                    var cardName = cardListView[i];
                    return ListTile(
                      leading: const Icon(Icons.content_paste_sharp),
                      title: Text(cardName),
                      onTap: () => {
                        print(cardListView[i])
                      },
                    );
                  }),
            ),
          ],
        ),

      ),
    );
  }
}
