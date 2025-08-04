import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlay extends StatefulWidget {
  const AudioPlay({super.key});

  @override
  State<AudioPlay> createState() => _AudioPlayState();
}

class _AudioPlayState extends State<AudioPlay> {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _playsound(),
    );
  }

  Widget _playsound() {
    String audioPath = 'assets/laughter-29686.mp3';
    player.play(AssetSource(
        audioPath)); // The await can be avoided in the build method, handled during initState instead.
    return const Center(child: Text('Playing Sound'));
  }

  // @override
  // void initState() {
  //   super.initState();
  //   _playSound();
  // }

  // Future<void> _playSound() async {
  //   String audioPath = 'assets/laughter-29686.mp3';
  //   await player.play(AssetSource(audioPath));
  // }
}
