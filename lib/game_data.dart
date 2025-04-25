class GameData {
  final Map<String, String> forestLocationMap = {
    'Taman Nagar': 'Malaysia',
    'Taiga': 'Russia, Canada, Scandinavia',
    'Amazon': 'South America',
    'Congo Rainforest': 'Central Africa',
    'Valdivian Temperate Rainforest': '	Chile, Argentina',
    'Tongass National Forest': 'Alaska, USA',
    'Daintree Rainforest': 'Queensland, Australia',
    'Borneo Lowland Rainforest': 'Indonesia, Malaysia, Brunei',
    'Waipoua Forest': 'New Zealand',
  };

  Map<String, String> get4Random() {
    List<String> keys = forestLocationMap.keys.toList()..shuffle();
    Map<String, String> randomMap = {};
    for (int i = 0; i < 4; i++) {
      randomMap[keys[i]] = forestLocationMap[keys[i]]!;
    }
    return randomMap;
  }
}
