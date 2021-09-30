import 'package:flutter/material.dart';
import 'package:fm_music/design/fm_text_styles.dart';
import 'package:fm_music/design/image_assets.dart';

class EmptyScreenWidget extends StatelessWidget {
  const EmptyScreenWidget({Key? key, this.description}) : super(key: key);

  final String? description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 25),
            child: Image.asset(ImageAssets.fmBanner)),
        Text(
          'Welcome to Last.fm',
          style: FmTextStyles.title(),
        ),
        const SizedBox(
          height: 24,
        ),
        Text(
          description ??
              'Search the anything you want to listen! The more you listen, the better your recommendations will get!',
          textAlign: TextAlign.center,
          style: FmTextStyles.body(),
        )
      ],
    );
  }
}
