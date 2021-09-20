import 'package:sample_music_player/domain/playlists/author.dart';

class PlaylistItem {
  final Author author;
  final String title;
  final Uri? artworkUri;
  final Uri itemLocation;

  PlaylistItem(
      this.author,
      this.title,
      this.artworkUri,
      this.itemLocation,
      );
}