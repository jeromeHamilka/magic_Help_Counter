class MagicCard {
  late String name;
  late String urlImage;
  late int? att;
  late int? def;

  MagicCard({
    required this.name,
    required this.urlImage,
    required this.att,
    required this.def,
  });
}

class CardName {
  final List<String> data;
  const CardName({
    required this.data,
  });

  factory CardName.fromJson(Map<String, dynamic> json) {
    var dataFromJson = json['data'];
    List<String> dataList = dataFromJson.cast<String>();

    return CardName(
      data: dataList,
    );
  }
}

class CardNameList {
  late List<String> cardlistname;

  CardNameList({required this.cardlistname});
}

class CardAutocomplete {
  CardAutocomplete({
    required this.object,
    required this.totalValues,
    required this.data,
  });
  late final String object;
  late final int totalValues;
  late final List<String> data;

  CardAutocomplete.fromJson(Map<String, dynamic> json){
    object = json['object'];
    totalValues = json['total_values'];
    data = List.castFrom<dynamic, String>(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['object'] = object;
    _data['total_values'] = totalValues;
    _data['data'] = data;
    return _data;
  }
}