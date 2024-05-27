abstract class GDateUtils {
  static String formatDateToString(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  static String formatTimeToString(DateTime date) {
    return '${date.hour} : ${date.minute}';
  }
}
