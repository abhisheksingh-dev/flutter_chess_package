import 'package:flutter_chess/src/core/game_objects/coordinate_navigator/utils/coordinate_navigator_utils.dart';
import 'package:flutter_chess/src/models/models.dart';
import 'package:flutter_chess/src/utils/utils.dart';

/// CoordinateNavigator Object (Base Class)
abstract class CoordinateNavigator {
  /// Constructor to initialize current coordinate
  const CoordinateNavigator(this.currentCoordinate);

  /// Current Coordinate passed from subclasses
  final CoordinateModel currentCoordinate;

  /// Method to handle steps, to be implemented by subclasses
  CoordinateModel? move({required int steps});

  /// Helper method to check if a move is valid
  bool isMovePossible(CoordinateModel newCoordinate) {
    return NavigatorUtils.isThisCoordinateValid(
          currentCoordinates: newCoordinate,
        ) &&
        currentCoordinate != newCoordinate;
  }
}

/// Take Left Steps
class TakeLeft extends CoordinateNavigator {
  /// Provide current coordinate to super class
  const TakeLeft(super.currentCoordinate);

  @override
  CoordinateModel? move({required int steps}) {
    // Left
    var padLeftStringValue = currentCoordinate.stringValue;
    for (var i = 0; i < steps; i++) {
      padLeftStringValue =
          Utils.padLeftOnXAxis(stringValue: padLeftStringValue);
    }
    final newCoordinate = CoordinateModel(
      color: Utils.returnCoordinateSquareColor(
        intValue: currentCoordinate.intValue,
        stringValue: padLeftStringValue,
      ),
      intValue: currentCoordinate.intValue,
      stringValue: padLeftStringValue,
    );

    if (isMovePossible(newCoordinate)) return newCoordinate;
    return null;
  }
}

/// Take Right Steps
class TakeRight extends CoordinateNavigator {
  /// Provide current coordinate to super class
  const TakeRight(super.currentCoordinate);

  @override
  CoordinateModel? move({required int steps}) {
    // Right
    var padRightStringValue = currentCoordinate.stringValue;
    for (var i = 0; i < steps; i++) {
      padRightStringValue =
          Utils.padRightOnXAxis(stringValue: padRightStringValue);
    }
    final newCoordinate = CoordinateModel(
      color: Utils.returnCoordinateSquareColor(
        intValue: currentCoordinate.intValue,
        stringValue: padRightStringValue,
      ),
      intValue: currentCoordinate.intValue,
      stringValue: padRightStringValue,
    );

    if (isMovePossible(newCoordinate)) return newCoordinate;
    return null;
  }
}

/// Take Up Steps
class TakeUp extends CoordinateNavigator {
  /// Provide current coordinate to super class
  const TakeUp(super.currentCoordinate);

  @override
  CoordinateModel? move({required int steps}) {
    // Up
    var newIntValue = currentCoordinate.intValue;
    for (var i = 0; i < steps; i++) {
      newIntValue = newIntValue == 8 ? 8 : newIntValue + 1;
    }
    final newCoordinate = CoordinateModel(
      color: Utils.returnCoordinateSquareColor(
        intValue: newIntValue,
        stringValue: currentCoordinate.stringValue,
      ),
      intValue: newIntValue,
      stringValue: currentCoordinate.stringValue,
    );

    if (isMovePossible(newCoordinate)) return newCoordinate;
    return null;
  }
}

/// Take Down Steps
class TakeDown extends CoordinateNavigator {
  /// Provide current coordinate to super class
  const TakeDown(super.currentCoordinate);

  @override
  CoordinateModel? move({required int steps}) {
    // Down
    var newIntValue = currentCoordinate.intValue;
    for (var i = 0; i < steps; i++) {
      newIntValue = newIntValue == 1 ? 1 : newIntValue - 1;
    }
    final newCoordinate = CoordinateModel(
      color: Utils.returnCoordinateSquareColor(
        intValue: newIntValue,
        stringValue: currentCoordinate.stringValue,
      ),
      intValue: newIntValue,
      stringValue: currentCoordinate.stringValue,
    );

    if (isMovePossible(newCoordinate)) return newCoordinate;
    return null;
  }
}
