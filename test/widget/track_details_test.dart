import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fm_music/data/models/artist_model.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/domain/entities/track_info.dart';
import 'package:fm_music/injector.dart';
import 'package:fm_music/presentation/track_info/bloc/track_info_bloc.dart';
import 'package:fm_music/presentation/track_info/widgets/track_info_widget.dart';
import 'package:fm_music/presentation/track_list/bloc/tracks_bloc.dart';

void main() {
  initDependencies();

  testWidgets('Test track details widget', (WidgetTester tester) async {
    await tester.pumpWidget(_getApp(const TrackInfoWidget(
        trackDetails: TrackInfo(
            listeners: '55500',
            playcount: '101000',
            url: 'https://someurl.com',
            artist: ArtistModel(name: 'Eminem', url: 'https://eminem.com'),
            name: 'Lose yourself',
            duration: "71700"))));
    await tester.pump(const Duration(milliseconds: 100));

    expect(find.text('Eminem'), findsWidgets);
    expect(find.text('Lose yourself'), findsWidgets);
  });
}

Widget _getApp(Widget widget) {
  return MultiBlocProvider(
      providers: [
        BlocProvider<TracksBloc>(
          create: (BuildContext context) => injector(),
        ),
        BlocProvider<TrackInfoBloc>(
          create: (BuildContext context) => injector(),
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
        home: widget,
      ));
}
