import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc()
      : super(CharacterState(
            stand: true,
            walk: false,
            attack: false,
            facingRight: true,
            facingLeft: false)) {
    on<CharacterStand>(_mapCharacterStand);
    on<CharacterWalking>(_mapCharacterWalking);
    on<CharacterAttack>(_mapCharacterAttack);
  }

  void _mapCharacterStand(
      CharacterStand event, Emitter<CharacterState> emit) async {
    try {
      emit(CharacterState(
          stand: true,
          walk: false,
          attack: false,
          facingRight: state.facingRight,
          facingLeft: state.facingLeft));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void _mapCharacterWalking(
      CharacterWalking event, Emitter<CharacterState> emit) async {
    try {
      emit(CharacterState(
          stand: event.stand,
          walk: event.walking,
          attack: event.attack,
          facingRight: event.facingRight,
          facingLeft: event.facingleft));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }

  void _mapCharacterAttack(
      CharacterAttack event, Emitter<CharacterState> emit) async {
    try {
      emit(CharacterState(
          stand: event.stand,
          walk: event.walk,
          attack: event.attack,
          facingRight: state.facingRight,
          facingLeft: state.facingLeft));
    } on Exception catch (error) {
      // ignore: avoid_print
      print(error);
    }
  }
}
