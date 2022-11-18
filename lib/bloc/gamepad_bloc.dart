import 'package:flutter_bloc/flutter_bloc.dart';

part 'gamepad_event.dart';
part 'gamepad_state.dart';

class GamepadBloc extends Bloc<GamepadEvent, GamePadState> {
  GamepadBloc()
      : super(GamePadState(top: 100, left: 325, right: 300, bottom: 90)) {
    on<MoveUpEvent>(_mapMoveUpEvent);
    on<MoveDownEvent>(_mapMoveDownEvent);
    on<MoveLeftEvent>(_mapMoveLeftEvent);
    on<MoveRightEvent>(_mapMoveRightEvent);
  }

  void _mapMoveUpEvent(MoveUpEvent event, Emitter<GamePadState> emit) async {
    try {
      double newTop = state.getTop! - event.moveUp!;
      double newBottom = state.getBottom! + event.moveUp!;
      double newLeft = state.getLeft!;
      double newRight = state.getRight!;
      emit(GamePadState(
          top: newTop, bottom: newBottom, left: newLeft, right: newRight));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void _mapMoveDownEvent(
      MoveDownEvent event, Emitter<GamePadState> emit) async {
    try {
      double newTop = state.getTop! + event.moveDown!;
      double newBottom = state.getBottom! - event.moveDown!;
      double newLeft = state.getLeft!;
      double newRight = state.getRight!;
      emit(GamePadState(
          top: newTop, bottom: newBottom, left: newLeft, right: newRight));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void _mapMoveLeftEvent(
      MoveLeftEvent event, Emitter<GamePadState> emit) async {
    try {
      double newTop = state.getTop!;
      double newBottom = state.getBottom!;
      double newLeft = state.getLeft! - event.moveLeft!;
      double newRight = state.getRight! + event.moveLeft!;
      emit(GamePadState(
          top: newTop, bottom: newBottom, left: newLeft, right: newRight));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void _mapMoveRightEvent(
      MoveRightEvent event, Emitter<GamePadState> emit) async {
    try {
      double newTop = state.getTop!;
      double newBottom = state.getBottom!;
      double newLeft = state.getLeft! + event.moveRight!;
      double newRight = state.getRight! - event.moveRight!;
      emit(GamePadState(
          top: newTop, bottom: newBottom, left: newLeft, right: newRight));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
