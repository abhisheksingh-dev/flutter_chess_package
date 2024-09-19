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

  /// From json
  factory ChessBoardModel.fromJson(Map<String, dynamic> json) {
    return ChessBoardModel(
      blackChessPieces: (json['blackChessPieces'] as List)
          .map((e) => ChessPieceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      whiteChessPieces: (json['whiteChessPieces'] as List)
          .map((e) => ChessPieceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      coordinates: (json['coordinates'] as List)
          .map((e) => CoordinateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

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
      whiteChessPieces: whiteChessPieces ?? this.whiteChessPieces,
    );
  }

  /// To json
  Map<String, dynamic> toJson() {
    return {
      'blackChessPieces': blackChessPieces.map((e) => e.toJson()).toList(),
      'whiteChessPieces': whiteChessPieces.map((e) => e.toJson()).toList(),
      'coordinates': coordinates.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [coordinates, blackChessPieces, whiteChessPieces];
}
