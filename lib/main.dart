import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_music_player/screens/category_selector.dart';
import 'package:sample_music_player/services/playlists/hardcoded_playlists_service.dart';
import 'package:sample_music_player/services/playlists/playlists_service.dart';

import 'services/audio/audio_player_service.dart';
import 'services/audio/just_audio_player.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PlaylistsService>(
          create: (_) => HardcodedPlaylistsService(),
        ),
        Provider<AudioPlayerService>(
          create: (_) => JustAudioPlayer(),
          dispose: (_, value) {
            (value as JustAudioPlayer).dispose();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CategorySelector(),
      ),
    );
  }
}