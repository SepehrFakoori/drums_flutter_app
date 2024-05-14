import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return getApplication();
  }
}

Widget getApplication() {
  return MaterialApp(
    theme: ThemeData(
      useMaterial3: false,
    ),
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.amber,
      body: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/drum.png"), fit: BoxFit.fitWidth),
          ),
          position: DecorationPosition.background,
          child: getBody(),
        ),
      ),
    ),
  );
}

Widget getBody() {
  return Column(
    children: [
      rowButtons(["h1.wav", "h2.wav"]),
      rowButtons(["c1.wav", "c2.wav"]),
      rowButtons(["k1.wav", "k2.wav"]),
    ],
  );
}

Expanded rowButtons(List<String> sounds) {
  return Expanded(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: TextButton(
            onPressed: () {
              playSound(sounds[0]);
            },
            child: Text(""),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              playSound(sounds[1]);
            },
            child: Text(""),
          ),
        ),
      ],
    ),
  );
}

playSound(String sound) {
  var player = AudioPlayer();
  player.play(AssetSource(sound));
}
