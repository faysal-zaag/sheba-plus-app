import 'package:intl/intl.dart';

class DateFormatters{
  static String convertDateTimeToYYYYMMDD({required DateTime dateTime}){
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }

  static String getFormattedDateTime({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(selectedDateTime);
  }

  static String getFormattedDateTimeInCanada({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(selectedDateTime.toUtc().add(const Duration(hours: -5)));
  }

  static String getFormattedDateTimeInBD({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";

    // Define time offsets
    const Duration canadaOffset = Duration(hours: -5);
    const Duration bdOffset = Duration(hours: 6);

    // Treat selectedDateTime as being in Canada time, adjust to UTC
    DateTime utcTime = selectedDateTime.subtract(canadaOffset);

    // Convert UTC time to Bangladesh time
    DateTime bdTime = utcTime.add(bdOffset);

    // Format the BD time
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(bdTime);
  }
}