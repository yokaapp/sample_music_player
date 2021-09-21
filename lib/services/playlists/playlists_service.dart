import 'package:flexible_repeat/domain/playlists/author.dart';
import 'package:flexible_repeat/domain/playlists/playlist_item.dart';

abstract class PlaylistsService {
  List<PlaylistItem> get allItems;
  Map<Author, List<PlaylistItem>> get itemsByAuthor;
  Map<String, List<PlaylistItem>> get playlists;
}