part of 'chess_game_bloc.dart';

/// ChessGameEvents Type
sealed class ChessGameEvents extends Equatable {
  const ChessGameEvents();

  @override
  List<Object?> get props => [];
}

/// Subscribe to chess Game
final class SubscribeChessGameEvent extends ChessGameEvents {
  ///Constructor
  const SubscribeChessGameEvent();
}

/// Start new game
final class StartNewGameEvent extends ChessGameEvents {
  ///Constructor
  const StartNewGameEvent({
    required this.playerColorStatus,
  });

  ///Player Color Status
  final PlayerColorStatus playerColorStatus;

  @override
  List<Object?> get props => [playerColorStatus];
}

/// Load Saved Game
final class LoadGameEvent extends ChessGameEvents {
  ///Constructor
  const LoadGameEvent({
    required this.savedGameKey,
  });

  /// Saved game key
  final String savedGameKey;

  @override
  List<Object?> get props => [savedGameKey];
}

/// Save Game Event
final class SaveGameEvent extends ChessGameEvents {
  ///Constructor
  const SaveGameEvent({
    required this.state,
  });

  /// State of the current game to be saved in local storage
  final ChessGameState state;

  @override
  List<Object?> get props => [state];
}

/// Get Available Moves List
final class MoveChessPieceEvent extends ChessGameEvents {
  ///Constructor
  const MoveChessPieceEvent({
    required this.chessPieceModel,
    required this.requestedCoordinate,
  });

  ///Chess Piece to move
  final ChessPieceModel chessPieceModel;

  ///Requested Coordinate to move
  final CoordinateModel requestedCoordinate;

  @override
  List<Object?> get props => [chessPieceModel, requestedCoordinate];
}

/// UndoEvent
final class UndoEvent extends ChessGameEvents {
  /// Constructor
  const UndoEvent();
}

/// End Game Event
final class EndGameEvent extends ChessGameEvents {
  /// Constructor
  const EndGameEvent();
}
