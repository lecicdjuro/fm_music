
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fm_music/design/fm_colors.dart';
import 'package:fm_music/features/home/ui/fm_home_page.dart';

void main() {
  runApp(const FmMusic());
}

class FmMusic extends StatelessWidget {
  const FmMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const FMHomePage(),
    );
  }
}
