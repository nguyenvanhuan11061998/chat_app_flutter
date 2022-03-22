import 'package:intl/intl.dart';



class Utils {
  static String toStringTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String formattedDate = DateFormat('HH:mm').format(dateTime);
    return formattedDate;
  }

  static String toStringFullTime(DateTime? dateTime) {
    if (dateTime == null) {
      return '';
    }
    String formattedDate = DateFormat('HH:mm dd/MM/yyyy').format(dateTime);
    return formattedDate;
  }
}