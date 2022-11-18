part of 'character_bloc.dart';

class CharacterState {
  final bool? stand;
  final bool? walk;
  final bool? attack;
  final bool? facingRight;
  final bool? facingLeft;

  String get allVal {
    return "stand : $stand | walk : $walk | attack : $attack | facingRight : $facingRight | facingLeft : $facingLeft";
  }

  bool? get getStand {
    return stand;
  }

  bool? get getWalk {
    return walk;
  }

  bool? get getFacingRight {
    return facingRight;
  }

  bool? get getFacingLeft {
    return facingLeft;
  }

  CharacterState(
      {this.stand, this.walk, this.attack, this.facingRight, this.facingLeft});
}
