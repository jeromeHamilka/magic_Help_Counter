import 'package:flutter/material.dart';
import 'package:magic_help_counter/models/card_model.dart';
import 'package:magic_help_counter/providers/card_list_provider.dart';

class FormQueryCardNameAutocomplete extends StatefulWidget {
  const FormQueryCardNameAutocomplete({Key? key}) : super(key: key);

  @override
  State<FormQueryCardNameAutocomplete> createState() =>
      _FormQueryCardNameAutocompleteState();
}

class _FormQueryCardNameAutocompleteState
    extends State<FormQueryCardNameAutocomplete> {
  Future<CardAutocomplete>? futureCardAutocomplete;
  final CardListProvider cardListProvider = CardListProvider();
  final TextEditingController _controllerSearchInput = TextEditingController();

  List<String> _resultAutocomplete = [];

  @override
  void initState() {
    futureCardAutocomplete = cardListProvider.getAutoCompleteSuggestion2("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: const TextStyle(fontSize: 20),
        title: const Text("Magic The Gathering Counter"),
      ),
      body: Column(
        children: [
          const SizedBox(
            width: double.infinity,
            height: 50,
          ),
          Stack(
            children: [
              TextField(
                controller: _controllerSearchInput,
                decoration: const InputDecoration(
                  labelText: 'Search card',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) =>  {
                  print("_controllerSearchInput.text: $_controllerSearchInput.text"),
                  print("_controllerSearchInput.value: $_controllerSearchInput.value"),
                },
                //onChanged: _searchCardName,
                //onChanged: (value) => {_searchCardName(value),_searchCardImageUri(value)},
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
            child: FutureBuilder<CardAutocomplete>(
              future: cardListProvider.getAutoCompleteSuggestion2("time"),
              builder: (context, snapshot) {
                print("snapshot: $snapshot");
                if (snapshot.hasData) {
                  return Text(snapshot.data!.data[0]);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
