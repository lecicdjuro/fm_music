import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/features/track_info/bloc/track_info_bloc.dart';
import 'package:fm_music/features/tracks/bloc/tracks_bloc.dart';
import 'package:fm_music/features/tracks/ui/search_tracks_page.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const FmMusic());
}

class FmMusic extends StatelessWidget {
  const FmMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TracksBloc>(
            create: (BuildContext context) => TracksBloc(),
          ),
          BlocProvider<TrackInfoBloc>(
            create: (BuildContext context) => TrackInfoBloc(),
          ),
        ],
        child: MaterialApp(
          theme: ThemeData(
            primaryColor: FmColors.primaryDark,
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          supportedLocales: const [
            Locale('en', ''),
            Locale("sr", "RS"),
            Locale("hr", 'HR'),
          ],
          home: const SearchTracksPage(),
        ));
  }
}
