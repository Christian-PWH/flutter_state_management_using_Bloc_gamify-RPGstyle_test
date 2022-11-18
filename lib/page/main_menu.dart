import 'package:flutter/material.dart';
import 'package:flutter_state_management/game_hud/character.dart';
import 'package:flutter_state_management/game_hud/game_action_btn.dart';
import 'package:flutter_state_management/game_hud/game_joypad.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _background(),
          const Character(),
          const GameActionBtn(),
          const GameJoyPad(),
        ],
      ),
    );
  }

  Widget _background() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.gif'), fit: BoxFit.cover)),
    );
  }
}
