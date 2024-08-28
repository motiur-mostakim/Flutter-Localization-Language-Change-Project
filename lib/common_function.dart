
import 'package:intl/intl.dart';

class CommonFunction{

  // date formatter
  static String dateFormatterFuncDate({required String inputString}) {
    final DateTime inputDateTime = DateTime.parse(inputString);
    final DateFormat formatter = DateFormat('h:mm a dd-MM-yyyy');
    final String formatted = formatter.format(inputDateTime);
    return formatted;
  }

  static String replaceEnglishNumbers(String input) {
    const english = [
      '0',
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      'weeks',
      'week',
      'days',
      'day',
      'months',
      'month',
      'years',
      'year'
    ];
    const farsi = [
      '০',
      '১',
      '২',
      '৩',
      '৪',
      '৫',
      '৬',
      '৭',
      '৮',
      '৯',
      'সপ্তাহ',
      'সপ্তাহ',
      'দিন',
      'দিন',
      'মাস',
      'মাস',
      'বছর',
      'বছর',
    ];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(english[i], farsi[i]);
    }

    return input;
  }

}