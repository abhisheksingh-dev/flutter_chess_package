import 'package:flutter_chess/src/models/chess_board_model.dart';
import 'package:flutter_chess/src/models/chess_piece_model.dart';
import 'package:flutter_chess/src/models/coordinate_model.dart';

/// Default Chess Board Model
const kDefaultChessBoardModel = ChessBoardModel(
  blackChessPieces: [
    // Black Pawns start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 7,
        stringValue: 'a',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 7,
        stringValue: 'b',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 7,
        stringValue: 'c',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 7,
        stringValue: 'd',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 7,
        stringValue: 'e',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 7,
        stringValue: 'f',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 7,
        stringValue: 'g',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 7,
        stringValue: 'h',
      ),
      img: 'assets/images/black_pawn.png',
      type: ChessPieceType.pawn,
    ),
    // Black Pawns end
    // Black Rooks Start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 8,
        stringValue: 'a',
      ),
      img: 'assets/images/black_rook.png',
      type: ChessPieceType.rook,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 8,
        stringValue: 'h',
      ),
      img: 'assets/images/black_rook.png',
      type: ChessPieceType.rook,
    ),
    // Black Rooks end
    // Black knight start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 8,
        stringValue: 'b',
      ),
      img: 'assets/images/black_knight.png',
      type: ChessPieceType.knight,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 8,
        stringValue: 'g',
      ),
      img: 'assets/images/black_knight.png',
      type: ChessPieceType.knight,
    ),
    // Black knight end
    // Black bishop start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 8,
        stringValue: 'c',
      ),
      img: 'assets/images/black_bishop.png',
      type: ChessPieceType.bishop,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 8,
        stringValue: 'f',
      ),
      img: 'assets/images/black_bishop.png',
      type: ChessPieceType.bishop,
    ),
    // Black bishop end
    // Black Queen
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 8,
        stringValue: 'e',
      ),
      img: 'assets/images/black_queen.png',
      type: ChessPieceType.queen,
    ),
    // Black King
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 8,
        stringValue: 'd',
      ),
      img: 'assets/images/black_king.png',
      type: ChessPieceType.king,
    ),
  ],
  coordinates: [
    // 8th row
    CoordinateModel(
      color: SquareColor.white,
      intValue: 8,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 8,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 8,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 8,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 8,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 8,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 8,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 8,
      stringValue: 'h',
    ),
    // 7th row
    CoordinateModel(
      color: SquareColor.black,
      intValue: 7,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 7,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 7,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 7,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 7,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 7,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 7,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 7,
      stringValue: 'h',
    ),
    // 6th row
    CoordinateModel(
      color: SquareColor.white,
      intValue: 6,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 6,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 6,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 6,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 6,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 6,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 6,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 6,
      stringValue: 'h',
    ),
    // 5th row
    CoordinateModel(
      color: SquareColor.black,
      intValue: 5,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 5,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 5,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 5,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 5,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 5,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 5,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 5,
      stringValue: 'h',
    ),
    // 4th row
    CoordinateModel(
      color: SquareColor.white,
      intValue: 4,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 4,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 4,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 4,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 4,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 4,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 4,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 4,
      stringValue: 'h',
    ),
    // 3rd row
    CoordinateModel(
      color: SquareColor.black,
      intValue: 3,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 3,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 3,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 3,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 3,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 3,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 3,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 3,
      stringValue: 'h',
    ),
    // 2nd row
    CoordinateModel(
      color: SquareColor.white,
      intValue: 2,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 2,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 2,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 2,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 2,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 2,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 2,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 2,
      stringValue: 'h',
    ),
    // 1st row
    CoordinateModel(
      color: SquareColor.black,
      intValue: 1,
      stringValue: 'a',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 1,
      stringValue: 'b',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 1,
      stringValue: 'c',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 1,
      stringValue: 'd',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 1,
      stringValue: 'e',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 1,
      stringValue: 'f',
    ),
    CoordinateModel(
      color: SquareColor.black,
      intValue: 1,
      stringValue: 'g',
    ),
    CoordinateModel(
      color: SquareColor.white,
      intValue: 1,
      stringValue: 'h',
    ),
  ],
  whiteChessPieces: [
    // White Pawns start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 2,
        stringValue: 'a',
      ),
      img: 'assets/images/white_pawn.png',
      type: ChessPieceType.pawn,
    ),
    // White pawns end
    // White rook start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 1,
        stringValue: 'a',
      ),
      img: 'assets/images/white_rook.png',
      type: ChessPieceType.rook,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 1,
        stringValue: 'h',
      ),
      img: 'assets/images/white_rook.png',
      type: ChessPieceType.rook,
    ),
    // White rook end
    // White knight start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 1,
        stringValue: 'b',
      ),
      img: 'assets/images/white_knight.png',
      type: ChessPieceType.knight,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 1,
        stringValue: 'g',
      ),
      img: 'assets/images/white_knight.png',
      type: ChessPieceType.knight,
    ),
    // White knight end
    // White Bishop start
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 1,
        stringValue: 'c',
      ),
      img: 'assets/images/white_bishop.png',
      type: ChessPieceType.bishop,
    ),
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 1,
        stringValue: 'f',
      ),
      img: 'assets/images/white_bishop.png',
      type: ChessPieceType.bishop,
    ),
    // White bishop end
    // White queen
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.black,
        intValue: 1,
        stringValue: 'e',
      ),
      img: 'assets/images/white_queen.png',
      type: ChessPieceType.queen,
    ),
    // White king
    ChessPieceModel(
      coordinateOnBoard: CoordinateModel(
        color: SquareColor.white,
        intValue: 1,
        stringValue: 'd',
      ),
      img: 'assets/images/white_king.png',
      type: ChessPieceType.king,
    ),
  ],
);
