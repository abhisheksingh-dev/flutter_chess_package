import 'package:equatable/equatable.dart';

/// Square color enum [white] | [black]
enum SquareColor {
  /// White Color index 0
  white,

  /// Black Color index 1
  black,
}

/// A model for coordinated of chess squares
class CoordinateModel extends Equatable {
  /// Constructor
  const CoordinateModel({
    required this.color,
    required this.intValue,
    required this.stringValue,
  });

  /// Int value representing 1 to 8
  final int intValue;

  /// String value representing a to h
  final String stringValue;

  ///0 is black and 1 is white;
  final SquareColor color;

  /// Exposing a method to quickly modify the [CoordinateModel]
  CoordinateModel copyWith({
    int? intValue,
    String? stringValue,
    SquareColor? color,
  }) {
    return CoordinateModel(
      color: color ?? this.color,
      intValue: intValue ?? this.intValue,
      stringValue: stringValue ?? this.stringValue,
    );
  }

  @override
  List<Object?> get props => [intValue, stringValue, color];
}
