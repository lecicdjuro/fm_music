import 'package:flutter/material.dart';
import 'package:fm_music/domain/entities/track.dart';
import 'package:fm_music/presentation/track_info/views/track_info_view.dart';
import 'package:fm_music/presentation/track_list/views/search_tracks_view.dart';

class AppRoutes {
  static Route? onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const SearchTracksView());

      case '/TrackInfo':
        return _materialRoute(
            TrackInfoView(track: settings.arguments as Track));
      default:
        return null;
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
