
import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("bn", LocalData.BN),
  MapLocale("en", LocalData.EN)
];

mixin LocalData {
  static const String title = "title";
  static const String body = "body";

  static const Map<String,dynamic> EN = {
    title: "MR Mostakim",
    body: "MD Motiur Rahman Mostakim %a",
  };
  static const Map<String,dynamic> BN = {
    title: "এম আর মোস্তাকিম",
    body: "মোঃ মতিউর রহমান মুস্তাকিম %a"
  };
}