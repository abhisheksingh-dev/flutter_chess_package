import 'package:flutter_chess/src/bloc/chess_game_bloc.dart';
import 'package:flutter_chess/src/models/models.dart';
import 'package:flutter_chess/src/utils/utils.dart';

/// Chess Piece Move Set
abstract class ChessPieceMoveSet {
  /// Constructor
  const ChessPieceMoveSet();

  /// Get chess piece moves
  List<CoordinateModel> getChessPieceMoves({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  });
}

/// Pawn piece Move Set
final class PawnChessMoveSet extends ChessPieceMoveSet {
  @override
  List<CoordinateModel> getChessPieceMoves({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    final returnCoordinates = <CoordinateModel>[];
    final isBlack = (chessPieceModel.color == ChessPieceColor.black);
    // White Pawn Last Row Promotion Constraint
    if (chessPieceModel.coordinateOnBoard.intValue == 7 && !isBlack) {
      returnCoordinates.add(
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: 8,
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
          intValue: 8,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      );
    }
    // Black Pawn Last Row Promotion Constraint
    if (chessPieceModel.coordinateOnBoard.intValue == 2 && isBlack) {
      returnCoordinates.add(
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: 1,
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
          intValue: 1,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      );
    }
    // Black Start Double Move
    if (isBlack && chessPieceModel.coordinateOnBoard.intValue == 7) {
      returnCoordinates.addAll([
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: 6,
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
          intValue: 6,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: 5,
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
          intValue: 5,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      ]);
    }
    // White Start Double Move
    if (!isBlack && chessPieceModel.coordinateOnBoard.intValue == 2) {
      returnCoordinates.addAll([
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: 4,
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
          intValue: 4,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: 3,
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
          intValue: 3,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      ]);
    }
    // check if there is any piece diagonal to the position not considering
    if (chessPieceModel.coordinateOnBoard.stringValue != 'a' &&
        chessPieceModel.coordinateOnBoard.stringValue != 'h') {
      // Left pad diagonal
      final leftRes = _padLeft(chessPieceModel: chessPieceModel, state: state);
      // Right pad diagonal
      final rightRes =
          _padRight(chessPieceModel: chessPieceModel, state: state);
      returnCoordinates.addAll([...rightRes, ...leftRes]);
    }
    // check for a
    if (chessPieceModel.coordinateOnBoard.stringValue == 'a') {
      final res = _padRight(chessPieceModel: chessPieceModel, state: state);
      returnCoordinates.addAll(res);
    }
    // check for h
    if (chessPieceModel.coordinateOnBoard.stringValue == 'h') {
      final res = _padLeft(chessPieceModel: chessPieceModel, state: state);
      returnCoordinates.addAll(res);
    }
    return returnCoordinates;
  }

  // TODO: Big flaw -> detect current player turn white | black
  // and accordingly increment or decrement y axis

  /// Pad Right Coordinates for pawn
  static List<CoordinateModel> _padRight({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    final returnCoordinates = <CoordinateModel>[];
    // Right pad diagonal
    if (Utils.isOpponentPiecePresentAtCoordinate(
      requestedCoordinate: CoordinateModel(
        color: Utils.returnCoordinateSquareColor(
          intValue: chessPieceModel.coordinateOnBoard.intValue,
          stringValue: Utils.padRightOnXAxis(
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
        ),
        intValue: chessPieceModel.coordinateOnBoard.intValue,
        stringValue: Utils.padRightOnXAxis(
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      ),
      chessPieceModel: chessPieceModel,
      chessBoardModelState: state,
    )) {
      returnCoordinates.add(
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: chessPieceModel.coordinateOnBoard.intValue,
            stringValue: Utils.padRightOnXAxis(
              stringValue: chessPieceModel.coordinateOnBoard.stringValue,
            ),
          ),
          intValue: chessPieceModel.coordinateOnBoard.intValue,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      );
    }
    return returnCoordinates;
  }

  /// Pad Left Coordinates for pawn
  static List<CoordinateModel> _padLeft({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    final returnCoordinates = <CoordinateModel>[];
    // Right pad diagonal
    if (Utils.isOpponentPiecePresentAtCoordinate(
      requestedCoordinate: CoordinateModel(
        color: Utils.returnCoordinateSquareColor(
          intValue: chessPieceModel.coordinateOnBoard.intValue,
          stringValue: Utils.padLeftOnXAxis(
            stringValue: chessPieceModel.coordinateOnBoard.stringValue,
          ),
        ),
        intValue: chessPieceModel.coordinateOnBoard.intValue,
        stringValue: Utils.padLeftOnXAxis(
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      ),
      chessPieceModel: chessPieceModel,
      chessBoardModelState: state,
    )) {
      returnCoordinates.add(
        CoordinateModel(
          color: Utils.returnCoordinateSquareColor(
            intValue: chessPieceModel.coordinateOnBoard.intValue,
            stringValue: Utils.padLeftOnXAxis(
              stringValue: chessPieceModel.coordinateOnBoard.stringValue,
            ),
          ),
          intValue: chessPieceModel.coordinateOnBoard.intValue,
          stringValue: chessPieceModel.coordinateOnBoard.stringValue,
        ),
      );
    }
    return returnCoordinates;
  }
}

/// Bishop piece Move Set
final class BishopChessMoveSet extends ChessPieceMoveSet {
  @override
  List<CoordinateModel> getChessPieceMoves({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    // Bishop moves diagonally until board ends or
    // there is any piece obstructing its path
    // Bug in getBishopDiagonalSteps function
    return Utils.getBishopDiagonalSteps(
      currentCoordinate: chessPieceModel.coordinateOnBoard,
      chessBoardModelState: state,
    );
  }
}

/// Knight piece Move Set
final class KnightChessMoveSet extends ChessPieceMoveSet {
  @override
  List<CoordinateModel> getChessPieceMoves({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    // Knight generally move 2 steps in any 4 directions
    // and then either takes left or right.
    return Utils.getKnightSteps(
      currentCoordinate: chessPieceModel.coordinateOnBoard,
      chessBoardModelState: state,
    );
  }
}

/// Rook piece Move Set
final class RookChessMoveSet extends ChessPieceMoveSet {
  @override
  List<CoordinateModel> getChessPieceMoves({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    // TODO: implement getChessPieceMoves
    throw UnimplementedError();
  }
}

/// Queen piece Move Set
final class QueenChessMoveSet extends ChessPieceMoveSet {
  @override
  List<CoordinateModel> getChessPieceMoves({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    // TODO: implement getChessPieceMoves
    throw UnimplementedError();
  }
}

/// King chess Move Set
final class KingChessMoveSet extends ChessPieceMoveSet {
  @override
  List<CoordinateModel> getChessPieceMoves({
    required ChessPieceModel chessPieceModel,
    required ChessGameState state,
  }) {
    // TODO: implement getChessPieceMoves
    throw UnimplementedError();
  }
}
