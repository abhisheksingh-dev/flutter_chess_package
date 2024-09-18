part of 'chess_game_bloc.dart';

/// Player turn status `white` | `black`
enum PlayerTurnStatus {
  /// White chance
  white,

  /// Black chance
  black,
}

/// Player Turn Status Extension
extension PlayerTurnStatusX on PlayerTurnStatus {
  /// To Json
  String toJson() {
    return this == PlayerTurnStatus.white ? 'white' : 'black';
  }

  /// From Json
  static PlayerTurnStatus fromJson(String json) {
    return json == 'white' ? PlayerTurnStatus.white : PlayerTurnStatus.black;
  }
}

/// Player Color Status
enum PlayerColorStatus {
  idle,
  white,
  black,
}

/// Player Color Status Extension
extension PlayerColorStatusX on PlayerColorStatus {
  /// To Json
  String toJson() {
    switch (this) {
      case PlayerColorStatus.idle:
        return 'idle';
      case PlayerColorStatus.white:
        return 'white';
      case PlayerColorStatus.black:
        return 'black';
    }
  }

  /// From Json
  static PlayerColorStatus fromJson(String json) {
    switch (json) {
      case 'white':
        return PlayerColorStatus.white;
      case 'black':
        return PlayerColorStatus.black;
      case 'idle':
      default:
        return PlayerColorStatus.idle;
    }
  }
}

/// ChessGameStatus
enum GameStatus {
  /// Game not started
  idle,

  /// Game Loading
  loading,

  /// Game Running
  running,

  /// Game Ends
  end,
}

/// Extension on GameStatus
extension GameStatusX on GameStatus {
  /// To Json
  String toJson() {
    switch (this) {
      case GameStatus.idle:
        return 'idle';
      case GameStatus.loading:
        return 'loading';
      case GameStatus.running:
        return 'running';
      case GameStatus.end:
        return 'end';
    }
  }

  /// From Json
  static GameStatus fromJson(String json) {
    switch (json) {
      case 'loading':
        return GameStatus.loading;
      case 'running':
        return GameStatus.running;
      case 'end':
        return GameStatus.end;
      case 'idle':
      default:
        return GameStatus.idle;
    }
  }
}

/// ChessGameState
class ChessGameState extends Equatable {
  /// Default constructor
  const ChessGameState({
    this.chessBoardModel = kDefaultChessBoardModel,
    this.turnStatus = PlayerTurnStatus.white,
    this.gameStatus = GameStatus.idle,
    this.playerColorStatus = PlayerColorStatus.idle,
    this.prevState,
  });

  /// From json
  factory ChessGameState.fromJson(Map<String, dynamic> json) {
    return ChessGameState(
      chessBoardModel: ChessBoardModel.fromJson(
        json['chessBoardModel'] as Map<String, dynamic>,
      ),
      turnStatus: PlayerTurnStatusX.fromJson(
        json['turnStatus'] as String,
      ),
      playerColorStatus: PlayerColorStatusX.fromJson(
        json['playerColorStatus'] as String,
      ),
      gameStatus: GameStatusX.fromJson(
        json['gameStatus'] as String,
      ),
      prevState: json['prevState'] != null
          ? ChessGameState.fromJson(
              json['prevState'] as Map<String, dynamic>,
            )
          : null,
    );
  }

  /// [ChessBoardModel] has `ChessPieceModels` and `CoordinateModels`
  final ChessBoardModel chessBoardModel;

  /// Which player is allowed to move
  final PlayerTurnStatus turnStatus;

  /// Player Color Status
  final PlayerColorStatus playerColorStatus;

  /// GameStatus
  final GameStatus gameStatus;

  /// Nullable previous state
  final ChessGameState? prevState;

  /// Update current state
  ChessGameState copyWith({
    ChessBoardModel? chessBoardModel,
    PlayerTurnStatus? turnStatus,
    PlayerColorStatus? playerColorStatus,
    GameStatus? gameStatus,
    ChessGameState? prevState,
  }) =>
      ChessGameState(
        chessBoardModel: chessBoardModel ?? this.chessBoardModel,
        gameStatus: gameStatus ?? this.gameStatus,
        prevState: prevState ?? this.prevState,
        turnStatus: turnStatus ?? this.turnStatus,
        playerColorStatus: playerColorStatus ?? this.playerColorStatus,
      );

  /// To json
  Map<String, dynamic> toJson() {
    return {
      'chessBoardModel': chessBoardModel.toJson(),
      'turnStatus': turnStatus.toJson(),
      'playerColorStatus': playerColorStatus.toJson(),
      'gameStatus': gameStatus.toJson(),
      'prevState': prevState?.toJson(),
    };
  }

  @override
  List<Object?> get props =>
      [chessBoardModel, turnStatus, prevState, gameStatus];
}
