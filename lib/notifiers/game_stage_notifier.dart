import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:forest_quest/config/enums.dart';

class GameState {
  GameStage stage;
  List<Forest> randomForests;
  List<Location> randomLocations;
  List<Forest> foundForest;
  List<Location> foundLocation;
  Forest? selectedForest;
  Location? selectedLocation;
  bool gameFinished;

  GameState(
      {required this.stage,
      required this.randomForests,
      required this.randomLocations,
      required this.foundForest,
      required this.foundLocation,
      this.selectedForest,
      this.selectedLocation,
      this.gameFinished = false});

  factory GameState.initial() {
    // Select an initial random 4 forests
    List<Forest> randomForestList = Forest.values.toList();
    randomForestList.shuffle();
    randomForestList = randomForestList.sublist(0, 4);

    List<Location> randomLocationList = [];
    for (var forest in randomForestList) {
      randomLocationList.add(forest.location);
    }

    return GameState(
      stage: GameStage.start,
      foundForest: [],
      foundLocation: [],
      randomForests: randomForestList.sublist(0, 4),
      randomLocations: randomLocationList..shuffle(),
    );
  }

  GameState copyWith({
    GameStage? stage,
    List<Forest>? randomForests,
    List<Location>? randomLocations,
    Forest? selectedForest,
    Location? selectedLocation,
    bool? gameFinished,
    bool clearForest = false,
    bool clearLocation = false,
    List<Forest>? foundForest,
    List<Location>? foundLocation,
  }) {
    return GameState(
      stage: stage ?? this.stage,
      randomForests: randomForests ?? this.randomForests,
      randomLocations: randomLocations ?? this.randomLocations,
      selectedForest: clearForest ? null : (selectedForest ?? this.selectedForest),
      selectedLocation: clearLocation ? null : (selectedLocation ?? this.selectedLocation),
      gameFinished: gameFinished ?? this.gameFinished,
      foundForest: foundForest ?? this.foundForest,
      foundLocation: foundLocation ?? this.foundLocation,
    );
  }
}

class GameStateNotifier extends StateNotifier<GameState> {
  GameStateNotifier() : super(GameState.initial());

  List<Forest> get randomForests => state.randomForests;
  List<Location> get randomLocations => state.randomLocations;
  Forest? get selectedForest => state.selectedForest;
  Location? get selectedLocation => state.selectedLocation;

  void setGameFinished() {
    state = state.copyWith(gameFinished: true);
  }

  void restartGame() {
    state = GameState.initial();
  }

  void onLocationSelect(Location location) {
    state = state.copyWith(selectedLocation: location);
    match();
  }

  void onForestSelect(Forest forest) {
    state = state.copyWith(selectedForest: forest);
    match();
  }

  void match() {
    if (state.selectedForest == null || state.selectedLocation == null) {
      //Do nothing. Still need to make another selection
    } else {
      if (state.selectedForest!.location == state.selectedLocation) {
        // Correct answer. Now add to found list

        List<Forest> foundForestList = state.foundForest;
        foundForestList.add(state.selectedForest!);

        List<Location> foundLocationList = state.foundLocation;
        foundLocationList.add(state.selectedLocation!);

        state = state.copyWith(clearForest: true, clearLocation: true, foundForest: foundForestList, foundLocation: foundLocationList);
      } else {
        // Wrong answer. Reset selection
        state = state.copyWith(clearForest: true, clearLocation: true);
      }
    }
  }
}
