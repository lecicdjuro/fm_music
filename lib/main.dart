import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fm_music/config/routes/app_routes.dart';
import 'package:fm_music/config/themes/app_theme.dart';
import 'package:fm_music/core/utils/strings.dart';
import 'package:fm_music/injector.dart';
import 'package:fm_music/presentation/track_info/bloc/track_info_bloc.dart';

import 'presentation/track_list/bloc/tracks_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await initDependencies();
  runApp(const FmMusic());
}

class FmMusic extends StatelessWidget {
  const FmMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TracksBloc>(
            create: (BuildContext context) => injector(),
          ),
          BlocProvider<TrackInfoBloc>(
            create: (BuildContext context) => injector(),
          )
        ],
        child: MaterialApp(
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''),
            Locale("sr", "RS"),
            Locale("hr", 'HR'),
          ],
          debugShowCheckedModeBanner: false,
          title: kAppTitle,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          theme: AppTheme.light,
        ));
  }
}
