import 'package:flutter_localization/flutter_localization.dart';

const List<MapLocale> LOCALES = [
  MapLocale("bn", LocalData.BN),
  MapLocale("en", LocalData.EN)
];

mixin LocalData {
  static const String title = "title";
  static const String body = "body";

  // Add new keys for the additional data
  static const Map<String, dynamic> EN = {
    title: "MD Motiur Rahman Mostakim",
    body: {
      "name": "MR Mostakim",
      "college": "Dhaka College",
      "father_name": "Abdur Rahman",
      "mother_name": "MST Mahbuba Khatun",
      "address": "123 Example Street",
      "email": "example@example.com",
    },
  };

  static const Map<String, dynamic> BN = {
    title: "মোঃ মতিউর রহমান মুস্তাকিম",
    body: {
      "name": "এম আর মোস্তাকিম",
      "college": "ঢাকা কলেজ",
      "father_name": "আব্দুর রহমান",
      "mother_name": "মাহবুবা খাতুন",
      "address": "১২৩ উদাহরণ স্ট্রিট",
      "email": "example@example.com",
    },
  };
}
