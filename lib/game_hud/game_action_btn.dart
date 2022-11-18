// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_state_management/bloc/character_bloc.dart';

class GameActionBtn extends StatefulWidget {
  const GameActionBtn({super.key});

  @override
  State<GameActionBtn> createState() => _GameActionBtnState();
}

class _GameActionBtnState extends State<GameActionBtn> {
  bool onHold = false;
  bool isRight = true;
  bool isLeft = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.height / 0.7,
        top: MediaQuery.of(context).size.height / 2.5,
      ),
      width: 200,
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _gamePadButton(0),
        ],
      ),
    );
  }

  Widget _gamePadButton(
    int id,
  ) {
    return Container(
      width: 100.0,
      height: 100.0,
      margin: const EdgeInsets.all(5.0),
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.black87,
        type: MaterialType.button,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
        elevation: 1.0,
        child: GestureDetector(
          child: const InkWell(
            borderRadius: BorderRadius.all(Radius.circular(50.0)),
            splashColor: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Image(
                image: AssetImage('assets/images/attack_icon.png'),
                alignment: Alignment.center,
                height: 75.0,
                width: 75.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
          onTap: () {
            BlocProvider.of<CharacterBloc>(context)
                .add(CharacterAttack(false, false, true));
            Future.delayed(const Duration(milliseconds: 500)).then((value) {
              BlocProvider.of<CharacterBloc>(context)
                  .add(CharacterAttack(true, false, false));
            });
          },
          onLongPress: () {
            onHold = true;
            continousAttack();
          },
          onLongPressEnd: (_) {
            BlocProvider.of<CharacterBloc>(context)
                .add(CharacterAttack(true, false, false));
            setState(() {
              onHold = false;
            });
          },
        ),
      ),
    );
  }

  continousAttack() async {
    BlocProvider.of<CharacterBloc>(context)
        .add(CharacterAttack(false, false, true));
    await Future.delayed(const Duration(milliseconds: 100));
    if (onHold) {
      continousAttack();
    }
  }
}
