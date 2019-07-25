import 'package:date_format/date_format.dart';

class DateUtil{
  static String convertRawToView(String raw){    
    int year = int.parse(raw.substring(0,4));
    int month = int.parse(raw.substring(5,7));
    int day = int.parse(raw.substring(8,10));    
    DateTime rawDatetime = DateTime(year, month, day);
    return formatDate(rawDatetime, [M, ' ',dd, ', ', yyyy ]);
  }
}