import 'package:flutter_chess/src/models/models.dart';
import 'package:flutter_chess/src/widgets/chess_board_widgets.dart';

/// {@template flutter_chess}
/// A wholesome chess game package
/// {@endtemplate}
class FlutterChess {
  /// {@macro flutter_chess}
  const FlutterChess();

  /// Loads a new chess board model
  ChessBoardModel loadNewChessBoardModel() =>
      ChessBoardWidgets.loadChessBoard();
  //TODO(abhisehk-dev): Change this to a stream of ChessBoardModel
}
