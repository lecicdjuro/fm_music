import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/design/fm_text_styles.dart';
import 'package:fm_music/features/home/ui/empty_screen_widget.dart';
import 'package:fm_music/features/track_info/bloc/track_info_bloc.dart';
import 'package:fm_music/features/track_info/bloc/track_info_event.dart';
import 'package:fm_music/features/track_info/bloc/track_info_state.dart';
import 'package:fm_music/features/track_info/ui/track_info_widget.dart';
import 'package:fm_music/networking/model/track.dart';

class TrackInfoPage extends StatefulWidget {
  const TrackInfoPage({Key? key, required this.track}) : super(key: key);

  final Track track;

  @override
  State<TrackInfoPage> createState() => _TrackInfoPageState();
}

class _TrackInfoPageState extends State<TrackInfoPage> {
  @override
  void initState() {
    super.initState();
    context.read<TrackInfoBloc>().add(GetTrackInfoEvent(track: widget.track));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: FmColors.primaryDark,
            title: Text('Track Info',
                style:
                    FmTextStyles.title(color: FmColors.primaryInvertedText))),
        body: BlocConsumer<TrackInfoBloc, TrackInfoState>(
            listener: (context, state) {},
            builder: (context, state) {
              if (state is LoadingTrackInfoState) {
                return const Center(
                    child:
                        CircularProgressIndicator(color: FmColors.primaryDark));
              } else if (state is DisplayTrackInfoState) {
                return TrackInfoWidget(
                  trackDetails: state.trackDetails,
                );
              } else {
                return const EmptyScreenWidget(
                  description:
                      'Sorry, but there is no track details record at this moment',
                );
              }
            }));
  }
}
