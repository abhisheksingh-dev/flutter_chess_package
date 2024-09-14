// ignore_for_file: flutter_style_todos

import 'package:equatable/equatable.dart';
import 'package:flutter_chess/src/models/coordinate_model.dart';

/// Chess Pieces Types `pawn` `bishop` `knight` `rook` `queen` `king`
enum ChessPieceType {
  /// Pawn Piece
  pawn,

  /// Bishop Piece
  bishop,

  /// Knight Piece
  knight,

  /// Rook Piece
  rook,

  /// Queen Piece
  queen,

  /// King Piece
  king,
}

/// ChessPieceModel -> Attributes
class ChessPieceModel extends Equatable {
  /// Constructor
  const ChessPieceModel({
    required this.coordinateOnBoard,
    required this.img,
    required this.type,
  });

  /// Type of this chess piece
  final ChessPieceType type;

  /// Coordinate of this chess piece on board
  final CoordinateModel coordinateOnBoard;

  /// Image of this chess piece
  final String img;
  //TODO(abhisheksingh-dev): "Make moveset model which will define moveset
  // of said pieces or make functions to do it".

  @override
  List<Object?> get props => [type, coordinateOnBoard, img];
}
