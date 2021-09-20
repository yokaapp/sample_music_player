import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Playlist extends StatelessWidget {
  const Playlist(this._audioPlayer, {Key key}) : super(key: key);

  final AudioPlayer _audioPlayer;

  Widget build(BuildContext context) {
    return StreamBuilder<SequenceState>(
      stream: _audioPlayer.sequenceStateStream,
      builder: (context, snapshot) {
        final state = snapshot.data;
        final sequence = state?.sequence ?? [];
        return ListView(
          children: [
            for (var i = 0; i < sequence.length; i++)
              ListTile(
                selected: i == state.currentIndex,
                leading: Image.network(sequence[i].tag.artwork),
                title: Text(sequence[i].tag.title),
                onTap: () {
                  // TODO: play this audio when tapped.
                },
              ),
          ],
        );
      },
    );
  }
}