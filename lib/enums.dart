enum GameStage { start, play, end }

enum Forest {
  tamanNagara,
  taiga,
  amazon,
  congoRainforest,
  valdivianTemperateRainforest,
  tongassNationalForest,
  daintreeRainforest,
  borneoLowlandRainforest,
  waipoua,
}

enum Location {
  malaysia,
  russia,
  southAmerica,
  centralAfrica,
  chileArgentina,
  alaskaUSA,
  queenslandAustralia,
  indonesiaMalaysiaBrunei,
  newZealand,
}

extension ForestExtension on Forest {
  String get name {
    switch (this) {
      case Forest.tamanNagara:
        return 'Taman Nagar';
      case Forest.taiga:
        return 'Taiga';
      case Forest.amazon:
        return 'Amazon';
      case Forest.congoRainforest:
        return 'Congo Rainforest';
      case Forest.valdivianTemperateRainforest:
        return 'Valdivian Temperate Rainforest';
      case Forest.tongassNationalForest:
        return 'Tongass National Forest';
      case Forest.daintreeRainforest:
        return 'Daintree Rainforest';
      case Forest.borneoLowlandRainforest:
        return 'Borneo Lowland Rainforest';
      case Forest.waipoua:
        return 'Waipoua Forest';
    }
  }

  Location get location {
    switch (this) {
      case Forest.tamanNagara:
        return Location.malaysia;
      case Forest.taiga:
        return Location.russia;
      case Forest.amazon:
        return Location.southAmerica;
      case Forest.congoRainforest:
        return Location.centralAfrica;
      case Forest.valdivianTemperateRainforest:
        return Location.chileArgentina;
      case Forest.tongassNationalForest:
        return Location.alaskaUSA;
      case Forest.daintreeRainforest:
        return Location.queenslandAustralia;
      case Forest.borneoLowlandRainforest:
        return Location.indonesiaMalaysiaBrunei;
      case Forest.waipoua:
        return Location.newZealand;
    }
  }
}

extension LocationExtension on Location {
  String get name {
    switch (this) {
      case Location.malaysia:
        return 'Malaysia';
      case Location.russia:
        return 'Russia, Canada, Scandinavia';
      case Location.southAmerica:
        return 'South America';
      case Location.centralAfrica:
        return 'Central Africa';
      case Location.chileArgentina:
        return 'Chile, Argentina';
      case Location.alaskaUSA:
        return 'Alaska, USA';
      case Location.queenslandAustralia:
        return 'Queensland, Australia';
      case Location.indonesiaMalaysiaBrunei:
        return 'Indonesia, Malaysia, Brunei';
      case Location.newZealand:
        return 'New Zealand';
    }
  }
}
