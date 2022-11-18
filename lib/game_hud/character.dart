import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/bloc/character_bloc.dart';
import 'package:flutter_state_management/bloc/gamepad_bloc.dart';

import 'dart:math' as math;

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GamepadBloc, GamePadState>(
      builder: (context, state) {
        return Positioned(
            top: state.top,
            left: state.left,
            right: state.right,
            bottom: state.bottom,
            child: BlocBuilder<CharacterBloc, CharacterState>(
              builder: (context, state) {
                return _characterBase(state);
              },
            ));
      },
    );
  }

  Widget _characterBase(CharacterState state) {
    if (state.facingLeft == false && state.facingRight == true) {
      return SizedBox(
        width: 100.0,
        height: 100.0,
        child: _characterAction(state),
      );
    } else {
      return SizedBox(
        width: 100.0,
        height: 100.0,
        child: Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationY(math.pi),
            child: _characterAction(state)),
      );
    }
  }

  Widget _characterAction(CharacterState state) {
    if (state.stand == false && state.walk == true) {
      return const Image(
        image: AssetImage('assets/images/player_walking.gif'),
        fit: BoxFit.cover,
      );
    } else if (state.stand == false && state.attack == true) {
      return const Image(
        image: AssetImage('assets/images/player_attacking.gif'),
        fit: BoxFit.cover,
      );
    } else {
      return const Image(
        image: AssetImage('assets/images/player_standing.gif'),
        fit: BoxFit.cover,
      );
    }
  }
}
