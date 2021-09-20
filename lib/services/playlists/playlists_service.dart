import 'package:sample_music_player/domain/playlists/author.dart';
import 'package:sample_music_player/domain/playlists/playlist_item.dart';

abstract class PlaylistsService {
  List<PlaylistItem> get allItems;
  Map<Author, List<PlaylistItem>> get itemsByAuthor;
}