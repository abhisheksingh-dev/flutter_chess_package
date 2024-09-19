import 'package:flutter_chess/src/bloc/chess_game_bloc.dart';
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
}
