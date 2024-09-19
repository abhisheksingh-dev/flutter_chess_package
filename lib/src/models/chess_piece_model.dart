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

/// Extension on Chess Piece Type
extension ChessPieceTypeX on ChessPieceType {
  /// Convert to json string
  String toJson() {
    switch (this) {
      case ChessPieceType.pawn:
        return 'pawn';
      case ChessPieceType.bishop:
        return 'bishop';
      case ChessPieceType.knight:
        return 'knight';
      case ChessPieceType.rook:
        return 'rook';
      case ChessPieceType.queen:
        return 'queen';
      case ChessPieceType.king:
        return 'king';
    }
  }

  /// Create [ChessPieceType] from `String`
  static ChessPieceType fromJson(String json) {
    switch (json) {
      case 'pawn':
        return ChessPieceType.pawn;
      case 'bishop':
        return ChessPieceType.bishop;
      case 'knight':
        return ChessPieceType.knight;
      case 'rook':
        return ChessPieceType.rook;
      case 'queen':
        return ChessPieceType.queen;
      case 'king':
        return ChessPieceType.king;
      default:
        throw Exception('Invalid Chess Piece Type : $json');
    }
  }
}

/// Chess Piece Color [white] | [black]
enum ChessPieceColor {
  /// White Team
  white,

  /// Black Team
  black,
}

/// Extension on Chess piece color
extension ChessPieceColorX on ChessPieceColor {
  /// To Json
  String toJson() {
    switch (this) {
      case ChessPieceColor.white:
        return 'white';
      case ChessPieceColor.black:
        return 'black';
    }
  }

  /// From json
  static ChessPieceColor fromJson(String value) {
    switch (value) {
      case 'white':
        return ChessPieceColor.white;
      case 'black':
        return ChessPieceColor.black;
      default:
        throw Exception('Value for $value is not correct color');
    }
  }
}

/// ChessPieceModel -> Attributes
class ChessPieceModel extends Equatable {
  /// Constructor
  const ChessPieceModel({
    required this.coordinateOnBoard,
    required this.img,
    required this.type,
    required this.color,
  });

  /// Create ChessPieceModel from JSON
  factory ChessPieceModel.fromJson(Map<String, dynamic> json) {
    return ChessPieceModel(
      type: ChessPieceTypeX.fromJson(json['type'] as String),
      coordinateOnBoard: CoordinateModel.fromJson(
        json['coordinateOnBoard'] as Map<String, dynamic>,
      ),
      img: json['img'] as String,
      color: ChessPieceColorX.fromJson(json['color'] as String),
    );
  }

  /// Type of this chess piece
  final ChessPieceType type;

  /// Coordinate of this chess piece on board
  final CoordinateModel coordinateOnBoard;

  /// Image of this chess piece
  final String img;

  /// Color of the piece
  final ChessPieceColor color;

  /// Convert ChessPieceModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'type': type.toJson(),
      'coordinateOnBoard': coordinateOnBoard.toJson(),
      'img': img,
      'color': color.toJson(),
    };
  }

  @override
  List<Object?> get props => [type, coordinateOnBoard, img];
}
