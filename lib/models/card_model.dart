class MagicCard {
  late String name;
  late String urlImage;
  late int att;
  late int def;

  MagicCard({
    required this.name,
    required this.urlImage,
    required this.att,
    required this.def,
  });
}

class CardName {
  final String object;
  final int total_values;
  final List<String> data;

  const CardName({
    required this.object,
    required this.total_values,
    required this.data,
  });

  factory CardName.fromJson(Map<String, dynamic> json) {
    var dataFromJson = json['data'];
    List<String> dataList = dataFromJson.cast<String>();

    return CardName(
      object: json['object'],
      total_values: json['total_values'],
      data: dataList,
    );
  }
}

class CardNameList {
  late List<String> cardlistname;

  CardNameList({required this.cardlistname});
}
