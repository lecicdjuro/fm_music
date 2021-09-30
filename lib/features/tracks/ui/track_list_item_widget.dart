import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fm_music/data_provider/model/track.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_text_styles.dart';
import 'package:fm_music/features/track_info/ui/track_info_page.dart';

class TrackListItemWidget extends StatelessWidget {
  const TrackListItemWidget({Key? key, required this.track}) : super(key: key);

  final Track track;

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          onTap: () => _openTrackDetails(context),
          leading: CachedNetworkImage(
            imageUrl: track.thumbnailImage,
            placeholder: (context, url) => const Icon(Icons.play_circle_fill),
            errorWidget: (context, url, error) => const Icon(
              Icons.audiotrack,
              color: FmColors.error,
            ),
          ),
          title: Text(
            track.name,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: FmTextStyles.body(),
          ),
          trailing: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 100),
              child: Text(
                track.artist,
                textAlign: TextAlign.right,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )),
        ));
  }

  void _openTrackDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TrackInfoPage(
          track: track,
        ),
      ),
    );
  }
}
