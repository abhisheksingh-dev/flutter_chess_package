import 'package:flutter_chess/src/core/game_objects/coordinate_navigator/object.dart';
import 'package:flutter_chess/src/models/coordinate_model.dart';
import 'package:test/test.dart';

void main() {
  group('CoordinateNavigator Tests', () {
    const initialCoordinate = CoordinateModel(
      intValue: 2,
      stringValue: 'a',
      color: SquareColor.white,
    );

    test('TakeLeft: Moves 1 step left from (2,a)', () {
      const leftNavigator = TakeLeft(initialCoordinate);
      final result = leftNavigator.move(steps: 1);
      expect(result, isNull); // No left from 'a' on the X axis
    });

    test('TakeRight: Moves 1 step right from (2,a)', () {
      const rightNavigator = TakeRight(initialCoordinate);
      final result = rightNavigator.move(steps: 1);
      expect(result, isNotNull);
      expect(result?.intValue, 2);
      expect(result?.stringValue, 'b');
    });

    test('TakeUp: Moves 2 steps up from (2,a)', () {
      const upNavigator = TakeUp(initialCoordinate);
      final result = upNavigator.move(steps: 2);
      expect(result, isNotNull);
      expect(result?.intValue, 4);
      expect(result?.stringValue, 'a');
    });

    test('TakeDown: Moves 1 step down from (2,a)', () {
      const downNavigator = TakeDown(initialCoordinate);
      final result = downNavigator.move(steps: 1);
      expect(result, isNotNull);
      expect(result?.intValue, 1);
      expect(result?.stringValue, 'a');
    });
  });
}
