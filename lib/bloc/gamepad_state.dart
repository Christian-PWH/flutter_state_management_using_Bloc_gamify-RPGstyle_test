part of 'gamepad_bloc.dart';

abstract class GameState {}

class GamePadState extends GameState {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  double? get getTop {
    return top;
  }

  double? get getLeft {
    return left;
  }

  double? get getRight {
    return right;
  }

  double? get getBottom {
    return bottom;
  }

  GamePadState({this.top, this.left, this.right, this.bottom});
}
