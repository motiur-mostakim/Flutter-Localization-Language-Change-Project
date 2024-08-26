import 'package:flutter/material.dart';

class LanguageSelector extends StatefulWidget {
  final Function(String) onLanguageChange;

  const LanguageSelector({required this.onLanguageChange, Key? key}) : super(key: key);

  @override
  _LanguageSelectorState createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  int selectIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DefaultTabController(
        length: 2,
        child: Container(
          alignment: Alignment.center,
          height: 40,
          width: 116,
          decoration: BoxDecoration(
            color: const Color(0xFFF0F0F0),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 3),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(3),
              splashBorderRadius: BorderRadius.circular(20),
              overlayColor: const MaterialStatePropertyAll(Colors.white),
              indicatorColor: const Color(0xFFF0F0F0),
              dividerColor: Colors.transparent,
              onTap: (index) {
                setState(() {
                  selectIndex = index;
                });
                String selectedLanguage = index == 0 ? "en" : "bn";
                widget.onLanguageChange(selectedLanguage);
              },
              labelPadding: EdgeInsets.symmetric(horizontal: 05),
              tabs: [
                selectIndex != 0
                    ? Center(
                  child: Text('English',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w400)),
                )
                    : Container(
                  alignment: Alignment.center,
                  width: 47,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.yellow),
                  child: Center(
                    child: Text('English',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                selectIndex != 1
                    ? Center(
                  child: Text('বাংলা',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'FontMain',
                          fontSize: 14,
                          fontWeight: FontWeight.w400)),
                )
                    : Container(
                  alignment: Alignment.center,
                  width: 47,
                  height: 24,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(13),
                      color: Colors.yellow),
                  child: Center(
                    child: Text('বাংলা',
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'FontMain',
                            fontSize: 14,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
