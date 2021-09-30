import 'package:flutter/material.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_dimens.dart';
import 'package:fm_music/design/fm_text_styles.dart';
import 'package:fm_music/design/image_assets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyScreenWidget extends StatelessWidget {
  const EmptyScreenWidget({Key? key, this.description}) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.all(FmDimens.hugePadding),
            child: Image.asset(ImageAssets.fmBanner)),
        Text(
          AppLocalizations.of(context)!.searchTitle,
          style: FmTextStyles.title(),
        ),
        Card(
            color: FmColors.primaryDark,
            margin: const EdgeInsets.symmetric(
                vertical: FmDimens.hugePadding,
                horizontal: FmDimens.largePadding),
            child: Padding(
                padding: const EdgeInsets.all(FmDimens.hugePadding),
                child: Text(
                  description ?? AppLocalizations.of(context)!.searchMessage,
                  textAlign: TextAlign.center,
                  style: FmTextStyles.body(color: FmColors.primaryInvertedText),
                )))
      ],
    );
  }
}
