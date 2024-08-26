import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:local_language_change_apps/localizations/locals.dart';

import 'home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  FlutterLocalization localization = FlutterLocalization.instance;

  @override
  void initState() {
    configureLocalization();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: localization.supportedLocales,
      localizationsDelegates: localization.localizationsDelegates,
      home: HomePage(),
    );
  }
  void configureLocalization(){
    localization.init(mapLocales: LOCALES, initLanguageCode: "bn");
    localization.onTranslatedLanguage = onTranslatedLanguage;
  }
  void onTranslatedLanguage (Locale? locale){
    setState(() {

    });
  }
}
