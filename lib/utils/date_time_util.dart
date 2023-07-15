import 'package:intl/intl.dart';

const String PATTERN_1 = "dd/MM/yyyy";
const String PATTERN_2 = "dd/MM";
const String PATTERN_3 = "yyyy-MM-dd'T'HHmmss";
const String PATTERN_4 = "h:mm a dd/MM";
const String PATTERN_5 = "yyyy-MM-dd HH:mm:ss";
const String PATTERN_6 = "dd/MM/yyyy HH:mm";
const String PATTERN_7 = "HH:mm dd/MM/yyyy";
const String PATTERN_8 = "yyyy-MM-ddTHH:mm:ss";
const String PATTERN_9 = "dd-MM-yyyy";
const String PATTERN_DEFAULT = "yyyy-MM-dd";
const String PATTERN_TIME = "kk:mm";

String formatDateTimeToString(DateTime dateTime) {
  return DateFormat(PATTERN_1).format(dateTime);
}

int convertDMYToTimeStamps(String dateTimeStr, {String pattern = PATTERN_1}) {
  if (dateTimeStr.isNotEmpty) {
    DateTime dateTime = convertStringToDate(dateTimeStr, pattern);
    return dateTime
        .subtract(Duration(
            hours: dateTime.hour,
            minutes: dateTime.minute,
            seconds: dateTime.second,
            milliseconds: dateTime.millisecond,
            microseconds: dateTime.microsecond))
        .millisecondsSinceEpoch;
  } else {
    return 0;
  }
}

String convertDateToString(DateTime? dateTime, String pattern) {
  if (dateTime == null) return "";
  return DateFormat(pattern).format(dateTime);
}

DateTime convertStringToDate(String dateTime, String pattern) {
  return DateFormat(pattern).parse(dateTime);
}

String convertDateToStringDefault(DateTime dateTime) {
  return DateFormat(PATTERN_DEFAULT).format(dateTime);
}

String convertDateToStringTime(DateTime dateTime) {
  return DateFormat(PATTERN_TIME, "vi_VN").format(dateTime);
}

String changeDateString(String date, {String pattern = PATTERN_1}) {
  date = date.replaceAll('/', '');
  date = DateFormat(pattern).format(DateTime.parse(date));
  return date;
}

enum Time { thisWeek, lastWeek, thisMonth, lastMonth }

int getQuarter(DateTime date) {
  return (date.month + 2) ~/ 3;
}

String convertDateTimeReport(String date) {
  // Thời gian server trả về +7 rồi hiển thị, chỉ riêng màn Khai thác báo cáo
  DateTime _dateTime = convertStringToDate(PATTERN_1, date);
  _dateTime = _dateTime.add(const Duration(hours: 7));
  return convertDateToString(_dateTime, PATTERN_6);
}
