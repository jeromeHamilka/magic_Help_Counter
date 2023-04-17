import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

class CardProvider extends ChangeNotifier {
  final String apiUrl = 'https://api.scryfall.com';
  final String urlTest = 'api.scryfall.com/cards/autocomplete?q=Ancestral Recall';
  final _authority = 'api.scryfall.com';
  final _path = '/cards/autocomplete';
  final Map<String, String> _params = {'q': 'Ancestral Recall'};
  late String result = "Black Lotus";
  final List cardList = [
    {
      "nom": "Black Lotus",
      "url": "url",
    }
  ];

  Future<void> fetchDataAutocomplete() async {
    try {
      http.Response response =
      await http.get(Uri.https(_authority, _path, {'q': 'Ancestral'}));
      if (response.statusCode == 200) {
        print(json.decode(response.body));
      }
    } catch (e) {
      rethrow;
    }
  }
}
