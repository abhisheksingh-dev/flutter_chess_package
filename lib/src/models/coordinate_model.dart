import 'package:equatable/equatable.dart';

/// Square color enum [white] | [black]
enum SquareColor {
  /// White Color index 0
  white,

  /// Black Color index 1
  black,
}

/// Square Color Extension
extension SquareColorExtension on SquareColor {
  /// Convert SquareColor to JSON (string or integer)
  String toJson() {
    switch (this) {
      case SquareColor.white:
        return 'white';
      case SquareColor.black:
        return 'black';
    }
  }

  /// Create SquareColor from JSON (string)
  static SquareColor fromJson(String json) {
    switch (json) {
      case 'white':
        return SquareColor.white;
      case 'black':
        return SquareColor.black;
      default:
        throw Exception('Unknown SquareColor value: $json');
    }
  }
}

/// A model for coordinates of 8x8 chess squares
class CoordinateModel extends Equatable {
  /// Constructor
  const CoordinateModel({
    required this.color,
    required this.intValue,
    required this.stringValue,
  });

  /// Create CoordinateModel from JSON
  factory CoordinateModel.fromJson(Map<String, dynamic> json) {
    return CoordinateModel(
      intValue: int.parse(json['intValue'].toString()),
      stringValue: json['stringValue'] as String,
      color: SquareColorExtension.fromJson(
        json['color'] as String,
      ),
    );
  }

  /// Int value representing 1 to 8
  final int intValue;

  /// String value representing a to h
  final String stringValue;

  ///0 is `white` and 1 is `black`
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

  /// Convert CoordinateModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'intValue': intValue,
      'stringValue': stringValue,
      'color': color.toJson(),
    };
  }

  @override
  List<Object?> get props => [intValue, stringValue, color];
}
