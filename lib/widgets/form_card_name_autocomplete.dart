import 'dart:async';

import 'package:flutter/material.dart';
import 'package:magic_help_counter/home.dart';
import 'package:magic_help_counter/providers/card_list_provider.dart';
import 'package:provider/provider.dart';

class FormCardName extends StatefulWidget {
  static const String routename = '/form_card_name';

  const FormCardName({Key? key}) : super(key: key);

  @override
  State<FormCardName> createState() => _FormCardNameState();
}

class _FormCardNameState extends State<FormCardName> {
  List<dynamic> _cardName = [];
  final CardListProvider cardListProvider = CardListProvider();

  Timer? _debounce;

  Future<void> _searchCardName(String value) async {
    try {
      if (_debounce?.isActive == true) _debounce?.cancel();
      _debounce = Timer(const Duration(seconds: 2), () async {
        print(value);
        if (value.isNotEmpty) {
          _cardName = await cardListProvider.getAutoCompleteSuggestion(value);
          setState(() {});
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> cardListView = Provider.of<CardListProvider>(context).cardList;
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Stack(
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: 'Search card',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _searchCardName,
              ),
              Positioned(
                top: 5,
                right: 3,
                child: IconButton(
                  onPressed: () => {
                    Navigator.pop(context, null),
                  },
                  icon: const Icon(Icons.clear),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: _cardName.length,
                itemBuilder: (_, i) {
                  var cardName = _cardName[i];
                  return ListTile(
                    leading: const Icon(Icons.content_paste_sharp),
                    title: Text(cardName),
                    onTap: () => {
                      print(cardName),
                      cardListView.add(cardName),
                      print('valeur de cardProvider.cardList: '),
                      print(cardListProvider.cardList),
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                      ),
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
