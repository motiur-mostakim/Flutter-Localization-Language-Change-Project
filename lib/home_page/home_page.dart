// TabBar ar maddhome change korte chaile ai Part

import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:local_language_change_apps/localizations/locals.dart';

import '../language_selector.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalization _flutterLocalization;
  late String _currenLocal;

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currenLocal = _flutterLocalization.currentLocale!.languageCode;
  }

  void _onLanguageChange(String languageCode) {
    setLocal(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalData.title.getString(context)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.formatString(LocalData.body, ["MRM"]),
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 20),
            Text(
              _currenLocal == "bn" ? "ভাষা: বাংলা" : "Language: English",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            LanguageSelector(onLanguageChange: _onLanguageChange),
          ],
        ),
      ),
    );
  }

  void setLocal(String value) {
    if (value == "bn") {
      _flutterLocalization.translate("bn");
    } else if (value == "en") {
      _flutterLocalization.translate("en");
    } else {
      return;
    }
    setState(() {
      _currenLocal = value;
    });
  }
}



// Button ar maddome change korte chaile nicher part

//
// import 'package:flutter/material.dart';
// import 'package:flutter_localization/flutter_localization.dart';
// import 'package:local_language_change_apps/localizations/locals.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   late FlutterLocalization _flutterLocalization;
//   late String _currenLocal;
//
//   @override
//   void initState() {
//     super.initState();
//     _flutterLocalization = FlutterLocalization.instance;
//     _currenLocal = _flutterLocalization.currentLocale!.languageCode;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(LocalData.title.getString(context)),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               context.formatString(LocalData.body, ["MRM"]),
//               style: const TextStyle(fontSize: 22),
//             ),
//             const SizedBox(height: 20),
//             Text(
//               _currenLocal == "bn" ? "ভাষা: বাংলা" : "Language: English",
//               style: const TextStyle(fontSize: 18),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: () {
//                 String newLanguage = _currenLocal == "bn" ? "en" : "bn";
//                 setLocal(newLanguage);
//               },
//               child: Text(_currenLocal == "bn" ? "Change to English" : "বাংলায় পরিবর্তন করুন"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void setLocal(String value) {
//     if (value == "bn") {
//       _flutterLocalization.translate("bn");
//     } else if (value == "en") {
//       _flutterLocalization.translate("en");
//     } else {
//       return;
//     }
//     setState(() {
//       _currenLocal = value;
//     });
//   }
// }
