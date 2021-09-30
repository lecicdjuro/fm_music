import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:fm_music/data_provider/model/track_details.dart';
import 'package:fm_music/design/fm_button_styles.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_dimens.dart';
import 'package:fm_music/design/fm_text_styles.dart';
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
                    Text(
                      trackDetails.artist.name,
                      style:
                          FmTextStyles.subtitle(color: FmColors.highlightColor),
                    ),
                    Text(
                      trackDetails.name,
                      textAlign: TextAlign.center,
                      style: FmTextStyles.title(),
                    ),
                    _buildAdditionInfoWidget(
                        AppLocalizations.of(context)!.duration,
                        FormatUtils.formatTrackDurationString(
                            int.tryParse(trackDetails.duration))),
                    _buildAdditionInfoWidget(
                        AppLocalizations.of(context)!.listeners,
                        FormatUtils.formatNumber(
                            int.tryParse(trackDetails.listeners))),
                    const SizedBox(
                      height: FmDimens.enormousPadding,
                    ),
                    if (trackDetails.hasAlbumInfo)
                      Container(
                          height: 100,
                          padding: const EdgeInsets.symmetric(
                              vertical: FmDimens.largePadding),
                          child: Row(
                            children: [
                              Expanded(
                                child: CachedNetworkImage(
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
                                flex: 1,
                              ),
                              const SizedBox(
                                width: FmDimens.largePadding,
                              ),
                              Expanded(
                                  flex: 3,
                                  child: _buildAdditionInfoWidget(
                                      AppLocalizations.of(context)!.album,
                                      trackDetails.album!.name)),
                            ],
                          )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: FmButtonStyles.primaryButtonStyle(),
                          onPressed: () {},
                          child: Row(
                            children: [
                              const Icon(Icons.play_arrow),
                              Text(AppLocalizations.of(context)!.playTrack)
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

  Widget _buildAdditionInfoWidget(String key, String value) {
    return RichText(
      textAlign: TextAlign.left,
      text: TextSpan(
        text: key,
        style: FmTextStyles.smallText(),
        children: <TextSpan>[
          TextSpan(
              text: value,
              style: FmTextStyles.body(color: FmColors.highlightColor)),
        ],
      ),
    );
  }
}
