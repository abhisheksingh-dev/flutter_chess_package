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

  // TODO: Bug in this code there are some out of bond exceptions
  // forexample input - (3,b,white) and get (2,a,white)
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

    // Case 1 - take 2 up and 1 right
    final up2Coordinate = TakeUp(currentCoordinate).move(steps: 2);
    if (up2Coordinate != null) {
      final right1Coordinate = TakeRight(up2Coordinate).move(steps: 1);
      if (right1Coordinate != null) returnList.add(right1Coordinate);
    }

    // Case 1.5 - take 2 up and 1 left
    if (up2Coordinate != null) {
      final left1Coordinate = TakeLeft(up2Coordinate).move(steps: 1);
      if (left1Coordinate != null) returnList.add(left1Coordinate);
    }

    // Case 2 - take 1 up and 2 right
    final up1Coordinate = TakeUp(currentCoordinate).move(steps: 1);
    if (up1Coordinate != null) {
      final right2Coordinate = TakeRight(up1Coordinate).move(steps: 2);
      if (right2Coordinate != null) returnList.add(right2Coordinate);
    }

    // Case 2.5 - take 1 up and 2 left
    if (up1Coordinate != null) {
      final left2Coordinate = TakeLeft(up1Coordinate).move(steps: 2);
      if (left2Coordinate != null) returnList.add(left2Coordinate);
    }

    // Case 3 - take 1 right and 2 up
    final right1Coordinate = TakeRight(currentCoordinate).move(steps: 1);
    if (right1Coordinate != null) {
      final up2Coordinate = TakeUp(right1Coordinate).move(steps: 2);
      if (up2Coordinate != null) returnList.add(up2Coordinate);
    }

    // Case 3.5 - take 1 right and 2 down
    if (right1Coordinate != null) {
      final down2Coordinate = TakeDown(right1Coordinate).move(steps: 2);
      if (down2Coordinate != null) returnList.add(down2Coordinate);
    }

    // Case 4 - take 1 left and 2 up
    final left1Coordinate = TakeLeft(currentCoordinate).move(steps: 1);
    if (left1Coordinate != null) {
      final up2Coordinate = TakeUp(left1Coordinate).move(steps: 2);
      if (up2Coordinate != null) returnList.add(up2Coordinate);
    }

    // Case 4.5 - take 1 left and 2 down
    if (left1Coordinate != null) {
      final down2Coordinates = TakeDown(left1Coordinate).move(steps: 2);
      if (down2Coordinates != null) returnList.add(down2Coordinates);
    }

    // Case 5 - take 1 down and 2 right
    final down1Coordinate = TakeDown(currentCoordinate).move(steps: 1);
    if (down1Coordinate != null) {
      final right2Coordinate = TakeRight(down1Coordinate).move(steps: 2);
      if (right2Coordinate != null) returnList.add(right2Coordinate);
    }

    // Case 5.5 - take 1 down and 2 left
    if (down1Coordinate != null) {
      final left2Coordinate = TakeLeft(down1Coordinate).move(steps: 2);
      if (left2Coordinate != null) returnList.add(left2Coordinate);
    }

    return returnList;
  }

  /// Get Rook Steps
  static List<CoordinateModel> getRookSteps({
    required CoordinateModel currentCoordinate,
  }) {
    final returnList = <CoordinateModel>[];

    // Case 1: Move up (increasing row)
    var bufferCoordinate = TakeUp(currentCoordinate).move(steps: 1);
    while (bufferCoordinate != null) {
      returnList.add(bufferCoordinate);
      bufferCoordinate = TakeUp(bufferCoordinate).move(steps: 1);
    }

    // Case 2: Move down (decreasing row)
    bufferCoordinate = TakeDown(currentCoordinate).move(steps: 1);
    while (bufferCoordinate != null) {
      returnList.add(bufferCoordinate);
      bufferCoordinate = TakeDown(bufferCoordinate).move(steps: 1);
    }

    // Case 3: Move left (decreasing column)
    bufferCoordinate = TakeLeft(currentCoordinate).move(steps: 1);
    while (bufferCoordinate != null) {
      returnList.add(bufferCoordinate);
      bufferCoordinate = TakeLeft(bufferCoordinate).move(steps: 1);
    }

    // Case 4: Move right (increasing column)
    bufferCoordinate = TakeRight(currentCoordinate).move(steps: 1);
    while (bufferCoordinate != null) {
      returnList.add(bufferCoordinate);
      bufferCoordinate = TakeRight(bufferCoordinate).move(steps: 1);
    }

    return returnList;
  }
}
