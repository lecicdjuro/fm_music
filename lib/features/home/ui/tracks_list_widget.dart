import 'package:flutter/material.dart';
import 'package:fm_music/features/home/ui/track_list_item_widget.dart';
import 'package:fm_music/networking/model/track.dart';

class TracksScreenWidget extends StatelessWidget {
  const TracksScreenWidget({Key? key, required this.tracks}) : super(key: key);

  final List<Track> tracks;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tracks.length,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (BuildContext context, int index) {
          return TrackListItemWidget(track: tracks.elementAt(index));
        });
  }
}
