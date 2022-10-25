import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'tr_TR': {
          'Monday': 'Pazartesi',
          'Tuesday': 'Salı',
          'Wednesday': 'Çarşamba',
          'Thursday': 'Perşembe',
          'Friday': 'Cuma',
          'Saturday': 'Cumartesi',
          'Sunday': 'Pazar',
        },
      };
}
