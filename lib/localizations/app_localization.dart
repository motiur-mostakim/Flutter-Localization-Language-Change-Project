import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../common_function.dart';


class AppLocalizations {
  static final AppLocalizations _singleton = AppLocalizations._internal();
  AppLocalizations._internal();
  static AppLocalizations get instance => _singleton;

  late Map<dynamic, dynamic> _localizedValues;

  Future<AppLocalizations> load(Locale locale) async {
    String jsonContent = await rootBundle
        .loadString("assets/locale/localization_${locale.languageCode}.json");
    _localizedValues = json.decode(jsonContent);

    return this;
  }

  String text(
    String key, {
    String? childKey,
    String? dynamicData,
    TextStyle? style,
  }) {
    if (childKey == null) {
      if (dynamicData == null) {
        return _localizedValues[key] ?? "$key not found";
      } else {
        return _localizedValues[key]
                ?.toString()
                .replaceAll("{{}}", dynamicData) ??
            "$key not found";
      }
    } else {
      if (dynamicData == null) {
        return _localizedValues[key][childKey] ?? "$childKey not found";
      } else {
        return _localizedValues[key][childKey]?.toString().replaceAll(
                "{{}}",
                _localizedValues["code"] == "bn"
                    ? CommonFunction.replaceEnglishNumbers(dynamicData)
                    : dynamicData) ??
            "$childKey not found";
      }
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ['bn', 'en'].contains(locale.languageCode);

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.instance.load(locale);
  }

  @override
  bool shouldReload(AppLocalizationsDelegate old) => true;
}
