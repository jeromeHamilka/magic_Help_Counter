import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class CardListProvider extends ChangeNotifier {
  List<dynamic> cardList = ['Black'];

  Uri _queryAutocompleteBuilder(String query) {
    return Uri.parse('https://api.scryfall.com/cards/autocomplete?q=$query');
  }

  Future<List<dynamic>> getAutoCompleteSuggestion(String query) async {
    try {
      var response = await http.get(_queryAutocompleteBuilder(query));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        print(body['data']);
        cardList = body['data'];
        notifyListeners();
        return cardList;
      } else {
        return [];
      }
    } catch (e) {
      rethrow;
    }
  }
}