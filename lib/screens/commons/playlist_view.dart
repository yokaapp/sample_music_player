import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flexible_repeat/domain/playlists/playlist_item.dart';
import 'package:flexible_repeat/services/audio/audio_player_service.dart';

/// A list of tiles showing all the items of a playlist.
///
/// Items are displayed with a `ListTile` with a leading image (the
/// artwork), and the title of the item.
class PlaylistView extends StatelessWidget {
  final List<PlaylistItem> _playlist;

  PlaylistView(this._playlist, {Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return ListView(
      children: [
        for (var i = 0; i < _playlist.length; i++)
          ListTile(
            // selected: i == state.currentIndex, // TODO only if this is the loaded playlist
            leading: Image.network(_playlist[i].artworkLocation),
            title: Text(_playlist[i].title),
            onTap: () {
              final player =
              Provider.of<AudioPlayerService>(context, listen: false);

              player
                  .loadPlaylist(_playlist)
                  .then((_) => player.seekToIndex(i))
                  .then((_) => player.play());
            },
          ),
      ],
    );
  }
}