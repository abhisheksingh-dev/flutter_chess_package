import 'package:flutter_chess/src/core/default_chessboard.dart';
import 'package:flutter_chess/src/models/models.dart';

/// Coordinate Navigator Utils
class NavigatorUtils {
  /// Is this coordinate valid
  static bool isThisCoordinateValid({
    required CoordinateModel currentCoordinates,
  }) =>
      kDefaultChessBoardModel.coordinates.any((e) => e == currentCoordinates);
}
