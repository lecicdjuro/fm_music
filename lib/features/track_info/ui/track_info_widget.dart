import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fm_music/design/fm_button_styles.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_text_styles.dart';
import 'package:fm_music/networking/model/track_details.dart';
import 'package:fm_music/utils/format_utils.dart';

class TrackInfoWidget extends StatelessWidget {
  const TrackInfoWidget({Key? key, required this.trackDetails})
      : super(key: key);

  final TrackDetails trackDetails;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Card(
            color: Colors.grey,
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(trackDetails.artist.name),
                    Text(
                      trackDetails.name,
                      style: FmTextStyles.title(),
                    ),
                    Text(
                        'Listeners: ${FormatUtils.formatLikesAndRepliesCount(int.tryParse(trackDetails.listeners))}'),
                    if (trackDetails.hasAlbumInfo)
                      Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: trackDetails.album!.coverImage,
                                placeholder: (context, url) => const Icon(
                                    Icons.photo_album_outlined,
                                    color: FmColors.error),
                                errorWidget: (context, url, error) =>
                                    const Icon(
                                  Icons.photo_album_outlined,
                                  color: FmColors.error,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(' Album: ${trackDetails.album!.name}')
                            ],
                          )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: FmButtonStyles.primaryButtonStyle(),
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(Icons.play_arrow),
                              Text('PLAY TRACK')
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: FmButtonStyles.primaryButtonStyle(),
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(Icons.favorite_outline),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: FmButtonStyles.primaryButtonStyle(),
                          onPressed: () {},
                          child: Row(
                            children: const [
                              Icon(Icons.save_outlined),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                )))
      ],
    );
  }
}
