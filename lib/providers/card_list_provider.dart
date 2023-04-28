import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:magic_help_counter/models/card_model.dart';

class CardListProvider extends ChangeNotifier {
  List<dynamic> cardList = [];
  List<CardName> cardList2 = [];
  String uriImageCard = "";
  String powerCard = "";
  String tcgplayer_id = "";
  List<String> listUriImageCard = [];
  List<String> listIdCard = [];
  List<MagicCard> magicCard = [];

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

  Future<CardAutocomplete> getAutoCompleteSuggestion2(String query) async {
    try {
      http.Response response = await http.get(_queryAutocompleteBuilder(query));
      if (response.statusCode == 200) {
        return CardAutocomplete.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load CardAutocomplete');
      }
    } catch (e) {
      rethrow;
    }
  }

  Uri _queryNamedCardUriBuilder(String query) {
    return Uri.parse('https://api.scryfall.com/cards/named?fuzzy=$query');
  }

  Future<String> getNamedCardUri(String query) async {
    try {
      var response = await http.get(_queryNamedCardUriBuilder(query));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        //print(body['image_uris']['small']);
        uriImageCard = body['image_uris']['small'];
        tcgplayer_id = body['tcgplayer_id'].toString();
        print("uriImageCard: $uriImageCard");
        print("tcgplayer_id: $tcgplayer_id");
        powerCard = await getIdCardInfo(tcgplayer_id);
        notifyListeners();
        return uriImageCard;
      } else {
        return "";
      }
    } catch (e) {
      rethrow;
    }
  }

  Uri _queryGetIdCardInfo(String id) {
    return Uri.parse('https://api.scryfall.com/cards/tcgplayer/$id');
  }
  Future<String> getIdCardInfo(String id) async {
    try {
      var response = await http.get(_queryGetIdCardInfo(id));
      if (response.statusCode == 200) {
        var body = json.decode(response.body);
        powerCard = body['power'].toString();
        print("powerCard: $powerCard");
        notifyListeners();
        return powerCard;
      } else {
        print("no data getIdCardInfo");
        return "";
      }
    } catch (e) {
      rethrow;
    }
  }

  addUritoListImage(String uri) {
    listUriImageCard.add(uri);
    notifyListeners();
    return listUriImageCard;
  }

}
