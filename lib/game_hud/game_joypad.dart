// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/bloc/character_bloc.dart';
import 'package:flutter_state_management/bloc/gamepad_bloc.dart';

class GameJoyPad extends StatefulWidget {
  const GameJoyPad({super.key});

  @override
  State<GameJoyPad> createState() => _GameJoyPadState();
}

class _GameJoyPadState extends State<GameJoyPad> {
  bool onHold = false;
  bool isRight = true;
  bool isLeft = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.height / 10,
        top: MediaQuery.of(context).size.height / 2.5,
      ),
      width: 200,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _gamePadButton(0, Icons.keyboard_arrow_up, Colors.white,
              const EdgeInsets.only(bottom: 5.0)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _gamePadButton(1, Icons.keyboard_arrow_left, Colors.white,
                  const EdgeInsets.only(left: 10.0)),
              const Spacer(),
              _gamePadButton(2, Icons.keyboard_arrow_right, Colors.white,
                  const EdgeInsets.only(right: 10.0)),
            ],
          ),
          _gamePadButton(3, Icons.keyboard_arrow_down, Colors.white,
              const EdgeInsets.only(top: 5.0)),
        ],
      ),
    );
  }

  Widget _gamePadButton(
      int id, IconData icons, Color iconColor, EdgeInsetsGeometry? marginVal) {
    return Container(
      width: 60.0,
      height: 60.0,
      margin: marginVal,
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.black54,
        type: MaterialType.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 1.0,
        child: GestureDetector(
          child: InkWell(
            borderRadius: const BorderRadius.all(Radius.circular(50.0)),
            splashColor: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Icon(
                icons,
                size: 60.0,
                color: iconColor,
              ),
            ),
          ),
          onTap: () {
            switch (id) {
              case 0:
                BlocProvider.of<GamepadBloc>(context).add(MoveUpEvent(5.0));
                BlocProvider.of<CharacterBloc>(context)
                    .add(CharacterWalking(false, true, false, isRight, isLeft));
                break;
              case 1:
                BlocProvider.of<GamepadBloc>(context).add(MoveLeftEvent(5.0));
                BlocProvider.of<CharacterBloc>(context)
                    .add(CharacterWalking(false, true, false, false, true));
                setState(() {
                  isLeft = true;
                  isRight = false;
                });
                break;
              case 2:
                BlocProvider.of<GamepadBloc>(context).add(MoveRightEvent(5.0));
                BlocProvider.of<CharacterBloc>(context)
                    .add(CharacterWalking(false, true, false, true, false));
                setState(() {
                  isLeft = false;
                  isRight = true;
                });
                break;
              case 3:
                BlocProvider.of<GamepadBloc>(context).add(MoveDownEvent(5.0));
                BlocProvider.of<CharacterBloc>(context)
                    .add(CharacterWalking(false, true, false, isRight, isLeft));
                break;
              default:
            }

            BlocProvider.of<CharacterBloc>(context)
                .add(CharacterWalking(true, false, false, isRight, isLeft));
          },
          onLongPress: () {
            onHold = true;
            continousWalk(id);
          },
          onLongPressEnd: (_) {
            BlocProvider.of<CharacterBloc>(context)
                .add(CharacterStand(true, false, false));
            setState(() {
              onHold = false;
            });
          },
        ),
      ),
    );
  }

  continousWalk(int id) async {
    switch (id) {
      case 0:
        BlocProvider.of<GamepadBloc>(context).add(MoveUpEvent(5.0));
        BlocProvider.of<CharacterBloc>(context)
            .add(CharacterWalking(false, true, false, isRight, isLeft));
        break;
      case 1:
        BlocProvider.of<GamepadBloc>(context).add(MoveLeftEvent(5.0));
        BlocProvider.of<CharacterBloc>(context)
            .add(CharacterWalking(false, true, false, false, true));
        setState(() {
          isLeft = true;
          isRight = false;
        });
        break;
      case 2:
        BlocProvider.of<GamepadBloc>(context).add(MoveRightEvent(5.0));
        BlocProvider.of<CharacterBloc>(context)
            .add(CharacterWalking(false, true, false, true, false));
        setState(() {
          isLeft = false;
          isRight = true;
        });
        break;
      case 3:
        BlocProvider.of<GamepadBloc>(context).add(MoveDownEvent(5.0));
        BlocProvider.of<CharacterBloc>(context)
            .add(CharacterWalking(false, true, false, isRight, isLeft));
        break;
      default:
    }
    await Future.delayed(const Duration(milliseconds: 100));
    if (onHold) {
      continousWalk(id);
    }
  }
}
