abstract class GDateUtils {
  static String formatDateToString(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static String formatTimeToString(DateTime date) {
    String minutes = date.minute < 10 ? '0${date.minute}' : '${date.minute}';
    String hours = date.hour < 10 ? '0${date.hour}' : '${date.hour}';

    return '$hours : $minutes';
  }
}
