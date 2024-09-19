import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chess/src/core/default_chessboard.dart';
import 'package:flutter_chess/src/models/models.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'chess_game_events.dart';
part 'chess_game_state.dart';

/// Chess Game Bloc
class ChessGameBloc extends Bloc<ChessGameEvents, ChessGameState> {
  /// Constructor
  ChessGameBloc() : super(const ChessGameState()) {
    on<SubscribeChessGameEvent>(_subscribeChessGameEvent);
    on<StartNewGameEvent>(_startNewGame);
    on<LoadGameEvent>(_loadGameEvent);
    on<SaveGameEvent>(_saveGameEvent);
    on<MoveChessPieceEvent>(_moveChessPiece);
    on<UndoEvent>(_undoEvent);
    on<EndGameEvent>(_endGameEvent);
  }

  void _subscribeChessGameEvent(
    SubscribeChessGameEvent event,
    Emitter<ChessGameState> emit,
  ) =>
      emit(state.copyWith(gameStatus: GameStatus.idle));

  void _startNewGame(
    StartNewGameEvent event,
    Emitter<ChessGameState> emit,
  ) =>
      emit(
        state.copyWith(
          playerColorStatus: event.playerColorStatus,
          gameStatus: GameStatus.running,
        ),
      );

  Future<void> _loadGameEvent(
    LoadGameEvent event,
    Emitter<ChessGameState> emit,
  ) async {
    emit(state.copyWith(gameStatus: GameStatus.loading));
    final pref = await SharedPreferences.getInstance();
    final data = pref.get(event.savedGameKey);
    if (data != null) {
      final stateModel = ChessGameState.fromJson(
        jsonDecode(data.toString()) as Map<String, dynamic>,
      );
      emit(
        state.copyWith(
          chessBoardModel: stateModel.chessBoardModel,
          gameStatus: stateModel.gameStatus,
          playerColorStatus: stateModel.playerColorStatus,
          prevState: stateModel.prevState,
          turnStatus: stateModel.turnStatus,
        ),
      );
    } else {
      emit(state.copyWith(gameStatus: GameStatus.idle));
      throw Exception('Loaded game does not exist');
    }
  }

  Future<void> _saveGameEvent(
    SaveGameEvent event,
    Emitter<ChessGameState> emit,
  ) async {
    final pref = await SharedPreferences.getInstance();
    // Create a utils that provides key
    // get a list of saved keys as well
    //TODO: Replace key with correct value
    await pref.setString(
      'some_key',
      jsonEncode(event.state.toJson()),
    );
  }

  void _moveChessPiece(
    MoveChessPieceEvent event,
    Emitter<ChessGameState> emit,
  ) {
    // Promotion of pawn will also be handled here by checking is last row ?
    // Coordinate + color of piece
    // if event.requestedCoordinate is occupied with another chess piece
    // then check if that piece is players or opponents
    // if its opponents then delete it from state
  }

  void _undoEvent(
    UndoEvent event,
    Emitter<ChessGameState> emit,
  ) {}

  void _endGameEvent(
    EndGameEvent event,
    Emitter<ChessGameState> emit,
  ) {}
}
