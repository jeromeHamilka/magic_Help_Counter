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
  final TextEditingController _controllerSearchInput = TextEditingController();
  List<dynamic> _cardName = [];

  String val = "162145";
  String _uriImageCard = "";
  List<String> _listUriImageCard = [];
  final CardListProvider cardListProvider = CardListProvider();

  Timer? _debounce;

  Future<void> _searchCardName(String value) async {
    try {
      if (_debounce?.isActive == true) _debounce?.cancel();
      _debounce = Timer(const Duration(seconds: 1), () async {
        print(value);
        if (value.isNotEmpty) {
          _cardName = await cardListProvider.getAutoCompleteSuggestion(value);
          if (_cardName.length == 1) {
            _uriImageCard = await cardListProvider.getNamedCardUri(value);
          }
          setState(() {});
        }
      });
    } catch (e) {
      rethrow;
    }
  }

  // Future<void> _searchCardImageUri(String value) async {
  //   try {
  //     _uriImageCard = await cardListProvider.getNamedCardUri(value);
  //     //cardListProvider.listUriImageCard.add(_uriImageCard);
  //     setState(() {});
  //     //print(_uriImageCard);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  @override
  void dispose() {
    _controllerSearchInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> cardList = Provider.of<CardListProvider>(context).cardList;
    List<String> listUriImageCardView =
        Provider.of<CardListProvider>(context).listUriImageCard;

    return Scaffold(
      appBar: AppBar(
        title: const Text("search new card,"),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 10,
          ),
          Stack(
            children: [
              TextField(
                controller: _controllerSearchInput,
                decoration: const InputDecoration(
                  labelText: 'Search card',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: _searchCardName,
                //onChanged: (value) => {_searchCardName(value),_searchCardImageUri(value)},
              ),
              Positioned(
                top: 5,
                right: 3,
                child: IconButton(
                  onPressed: () => {
                    _controllerSearchInput.text = "",
                    //Navigator.pop(context, null),
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
                  var urlImage = _uriImageCard;
                  return ListTile(
                    leading: _cardName.length != 1
                        ? Image.network(
                            'https://cards.scryfall.io/png/front/4/a/4a2e428c-dd25-484c-bbc8-2d6ce10ef42c.png?1559591808',
                            width: 30,
                          )
                        : Image.network(
                            urlImage,
                            width: 100,
                            //fit: BoxFit.cover,
                          ),
                    title: Text(cardName),
                    onTap: () => {
                      setState(() {
                        _controllerSearchInput.text = cardName;
                      }),
                      _searchCardName(cardName),
                      if (_cardName.length == 1)
                        {
                          print(cardName),
                          cardList.add(cardName),
                          print(cardList),
                          listUriImageCardView.add(urlImage),
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Home()),
                          ),
                        }
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
