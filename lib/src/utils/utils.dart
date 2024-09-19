import 'package:flutter_chess/src/bloc/chess_game_bloc.dart';
import 'package:flutter_chess/src/core/game_objects/coordinate_navigator/object.dart';
import 'package:flutter_chess/src/models/models.dart';

/// Utils Class
class Utils {
  /// Map of x axis
  static final xAxisMap = {
    'a': 0,
    'b': 1,
    'c': 2,
    'd': 3,
    'e': 4,
    'f': 5,
    'g': 6,
    'h': 7,
  };

  /// List of y axis
  static final List<int> yAxis = [1, 2, 3, 4, 5, 6, 7, 8];

  /// Return Color of Coordinate
  static SquareColor returnCoordinateSquareColor({
    required int intValue,
    required String stringValue,
  }) {
    final isOdd = intValue.isOdd;
    // 0 is white and 1 is black
    // oddInt value will always start with black
    var returnValue = isOdd ? 1 : 0;
    for (var i = 0; i < (xAxisMap[stringValue] ?? 0); i++) {
      if (returnValue == 0) {
        returnValue = 1;
      } else {
        returnValue = 0;
      }
    }
    return returnValue == 0 ? SquareColor.white : SquareColor.black;
  }

  /// Check if there is any diagonal piece to corresponding coordinate
  static bool isOpponentPiecePresentAtCoordinate({
    required CoordinateModel requestedCoordinate,
    required ChessPieceModel chessPieceModel,
    required ChessGameState chessBoardModelState,
  }) {
    var returnValue = false;
    if (chessBoardModelState.turnStatus == PlayerTurnStatus.white) {
      // iterate all the black piece and check if they are present at
      // requested coordinate
      returnValue = chessBoardModelState.chessBoardModel.blackChessPieces
          .any((e) => e.coordinateOnBoard == requestedCoordinate);
    } else {
      // iterate all the white piece and check if they are present at
      // requested coordinate
      returnValue = chessBoardModelState.chessBoardModel.whiteChessPieces
          .any((e) => e.coordinateOnBoard == requestedCoordinate);
    }
    return returnValue;
  }

  /// Return Pad left on x axis
  static String padLeftOnXAxis({required String stringValue}) {
    if (stringValue == 'a') {
      throw Exception('Illegal pad left requested');
    }
    final requestedIntValue = int.parse(xAxisMap[stringValue]!.toString()) - 1;
    var returnStringValue = 'a';
    for (final e in xAxisMap.entries) {
      if (e.value == requestedIntValue) {
        returnStringValue = e.key;
      }
    }
    return returnStringValue;
  }

  /// Return Pad right on x axis
  static String padRightOnXAxis({required String stringValue}) {
    if (stringValue == 'h') {
      throw Exception('Illegal pad right requested');
    }
    final requestedIntValue = int.parse(xAxisMap[stringValue]!.toString()) + 1;
    var returnStringValue = 'h';
    for (final e in xAxisMap.entries) {
      if (e.value == requestedIntValue) {
        returnStringValue = e.key;
      }
    }
    return returnStringValue;
  }

  /// Get Pawn Steps
  static List<CoordinateModel> getPawnSteps({
    required CoordinateModel currentCoordinate,
    required ChessGameState chessBoardModelState,
  }) {
    // TODO: Refactor code from moveset and place it here
    throw UnimplementedError();
  }

  /// Get Bishop Diagonal Steps
  static List<CoordinateModel> getBishopDiagonalSteps({
    required CoordinateModel currentCoordinate,
    required ChessGameState chessBoardModelState,
  }) {
    // TODO: Collision does not supported
    // Player own pieces or opponent's pieces
    final returnList = <CoordinateModel>[];

    // Store the current row and column
    final currentRow = currentCoordinate.intValue;
    var leftColumn = currentCoordinate.stringValue;
    var rightColumn = currentCoordinate.stringValue;

    // Explore diagonals in all four directions
    // (top-left, top-right, bottom-left, bottom-right)

    // Moving diagonally upwards
    for (var i = currentRow + 1; i <= 8; i++) {
      leftColumn = padLeftOnXAxis(stringValue: leftColumn);
      rightColumn = padRightOnXAxis(stringValue: rightColumn);

      // Add top-left diagonal
      if (leftColumn.isNotEmpty) {
        returnList.add(
          CoordinateModel(
            color: returnCoordinateSquareColor(
              intValue: i,
              stringValue: leftColumn,
            ),
            intValue: i,
            stringValue: leftColumn,
          ),
        );
      }

      // Add top-right diagonal
      if (rightColumn.isNotEmpty) {
        returnList.add(
          CoordinateModel(
            color: returnCoordinateSquareColor(
              intValue: i,
              stringValue: rightColumn,
            ),
            intValue: i,
            stringValue: rightColumn,
          ),
        );
      }
    }

    // Reset the columns
    leftColumn = currentCoordinate.stringValue;
    rightColumn = currentCoordinate.stringValue;

    // Moving diagonally downwards
    for (var i = currentRow - 1; i >= 1; i--) {
      leftColumn = padLeftOnXAxis(stringValue: leftColumn);
      rightColumn = padRightOnXAxis(stringValue: rightColumn);

      // Add bottom-left diagonal
      if (leftColumn.isNotEmpty) {
        returnList.add(
          CoordinateModel(
            color: returnCoordinateSquareColor(
              intValue: i,
              stringValue: leftColumn,
            ),
            intValue: i,
            stringValue: leftColumn,
          ),
        );
      }

      // Add bottom-right diagonal
      if (rightColumn.isNotEmpty) {
        returnList.add(
          CoordinateModel(
            color: returnCoordinateSquareColor(
              intValue: i,
              stringValue: rightColumn,
            ),
            intValue: i,
            stringValue: rightColumn,
          ),
        );
      }
    }

    return returnList;
  }

  ///Get Knight 2.5 Leaping Steps
  static List<CoordinateModel> getKnightSteps({
    required CoordinateModel currentCoordinate,
    required ChessGameState chessBoardModelState,
  }) {
    // Knight generally move 2 steps in any 4 directions
    // and then either takes left or right.
    // or
    // takes 1 step in any 4 direction
    // and then takes 3 steps in other direction
    final returnList = <CoordinateModel>[];

    // Example Input Coordinate (2,a,white)
    // Expected Result =  <CoordinateModel>[(4,b,black), (3,c,black),(1,c,black)]

    // Create a function upward movement of piece with int steps
    // which returns CoordinateModel and null if this is not possible

    // take 2 up and 1 right
    final up2Coordinate = _takeUpSteps(
      currentCoordinates: currentCoordinate,
      steps: 2,
    );
    // If not null then continue to take right
    if (up2Coordinate != null) {
      // Right step coordinate
      final right1Coordinate = _takeRightSteps(
        currentCoordinates: up2Coordinate,
        steps: 1,
      );
      // If present then add
      if (right1Coordinate != null) {
        returnList.add(right1Coordinate);
      }
      // Left step coordinate
      final left1StepCoordinate = TakeLeft(currentCoordinate).move(
        steps: 1,
      );
      // If present then add
      if (left1StepCoordinate != null) {
        returnList.add(left1StepCoordinate);
      }
      //
    }

    // take 1 up and 2 right
    throw UnimplementedError();
  }

  static CoordinateModel? _takeUpSteps({
    required CoordinateModel currentCoordinates,
    required int steps,
  }) {}

  static CoordinateModel? _takeRightSteps({
    required CoordinateModel currentCoordinates,
    required int steps,
  }) {}

  static CoordinateModel? _takeLeftSteps({
    required CoordinateModel currentCoordinates,
    required int steps,
  }) {}

  static CoordinateModel? _takeDownSteps({
    required CoordinateModel currentCoordinates,
    required int steps,
  }) {}
}
