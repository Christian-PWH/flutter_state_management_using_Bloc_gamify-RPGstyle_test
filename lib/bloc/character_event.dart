part of 'character_bloc.dart';

abstract class CharacterEvent {}

class CharacterStand extends CharacterEvent {
  final bool stand;
  final bool walk;
  final bool attack;

  CharacterStand(this.stand, this.walk, this.attack);
}

class CharacterWalking extends CharacterEvent {
  final bool stand;
  final bool walking;
  final bool attack;
  final bool facingRight;
  final bool facingleft;

  CharacterWalking(
      this.stand, this.walking, this.attack, this.facingRight, this.facingleft);
}

class CharacterAttack extends CharacterEvent {
  final bool stand;
  final bool walk;
  final bool attack;

  CharacterAttack(this.stand, this.walk, this.attack);
}
