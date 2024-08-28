// TabBar ar maddhome change korte chaile ai Part


import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';

import '../language_selector.dart';
import '../localizations/locals.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalization _flutterLocalization;
  late String _currentLocale;

  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  void _onLanguageChange(String languageCode) {
    setLocal(languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( getLocalizedText("name"),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              getLocalizedText("college"),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              getLocalizedText("name"),
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              getLocalizedText("father_name"),
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
      _currentLocale = value;
    });
  }

  // Define getLocalizedText method
  String getLocalizedText(String key) {
    final locale = _flutterLocalization.currentLocale?.languageCode ?? 'en';
    final localizedData = locale == 'bn' ? LocalData.BN : LocalData.EN;

    // Check if the data exists and extract the value for the given key
    if (localizedData.containsKey(LocalData.body) &&
        localizedData[LocalData.body] is Map<String, dynamic>) {
      final bodyData = localizedData[LocalData.body] as Map<String, dynamic>;
      return bodyData[key] ?? key; // Return the value or the key if not found
    }if(localizedData.containsKey(LocalData.title) && localizedData[LocalData.title] is Map<String,dynamic>){
      final titleData = localizedData[LocalData.title] as Map<String,dynamic>;
      return titleData[key] ?? key;
    }
    return key; // Default to the key if the data is not found
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
