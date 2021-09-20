import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:sample_music_player/domain/audio_metadata.dart';
import 'package:sample_music_player/domain/playlists/playlist_item.dart';
import 'package:sample_music_player/screens/commons/player_buttons.dart';
import 'package:sample_music_player/services/playlists/playlists_service.dart';

import 'commons/playlist.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Consumer<PlaylistsService>(
            builder: (__, value, _) {
              _loadAudioSources(value.allItems);
              return Column(
                children: [
                  Expanded(child: Playlist(_audioPlayer)),
                  PlayerButtons(_audioPlayer),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _loadAudioSources(List<PlaylistItem> playlist) {
    _audioPlayer
        .setAudioSource(
      ConcatenatingAudioSource(
        children: playlist
            .map(
              (item) => AudioSource.uri(
                item.itemLocation,
                tag: AudioMetadata(
                    title: item.title, artwork: item.artworkUri.toString()),
              ),
            )
            .toList(),
      ),
    )
        .catchError((error) {
      // catch load errors: 404, invalid url ...
      print("An error occured $error");
    });
  }
}
