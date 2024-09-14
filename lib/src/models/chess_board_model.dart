import 'package:equatable/equatable.dart';
import 'package:flutter_chess/src/models/chess_piece_model.dart';
import 'package:flutter_chess/src/models/coordinate_model.dart';

/// This model describes the chess board
class ChessBoardModel extends Equatable {
  /// Constructor
  const ChessBoardModel({
    required this.blackChessPieces,
    required this.coordinates,
    required this.whiteChessPieces,
  });

  /// 8*8 Coordinates for chess board
  final List<CoordinateModel> coordinates;

  /// Black Chess Pieces
  final List<ChessPieceModel> blackChessPieces;

  /// White Chess Pieces
  final List<ChessPieceModel> whiteChessPieces;

  /// Creates a copy of [ChessBoardModel]
  ChessBoardModel copyWith(
    List<CoordinateModel>? coordinates,
    List<ChessPieceModel>? blackChessPieces,
    List<ChessPieceModel>? whiteChessPieces,
  ) {
    return ChessBoardModel(
        blackChessPieces: blackChessPieces ?? this.blackChessPieces,
        coordinates: coordinates ?? this.coordinates,
        whiteChessPieces: whiteChessPieces ?? this.whiteChessPieces);
  }

  @override
  List<Object?> get props => [coordinates, blackChessPieces, whiteChessPieces];
}
