part of 'gamepad_bloc.dart';

abstract class GamepadEvent {}

class MoveUpEvent extends GamepadEvent {
  final double? moveUp;

  MoveUpEvent(this.moveUp);
}

class MoveDownEvent extends GamepadEvent {
  final double? moveDown;

  MoveDownEvent(this.moveDown);
}

class MoveLeftEvent extends GamepadEvent {
  final double? moveLeft;

  MoveLeftEvent(this.moveLeft);
}

class MoveRightEvent extends GamepadEvent {
  final double? moveRight;

  MoveRightEvent(this.moveRight);
}
