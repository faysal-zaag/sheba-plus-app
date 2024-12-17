import 'package:intl/intl.dart';
import 'package:sheba_plus/utils/constant/app_constants.dart';

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
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(getCanadianTime(selectedDateTime));
  }

  static String getFormattedDateTimeInCanada2({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat("MMMM dd, yyyy 'at' hha").format(getCanadianTime(selectedDateTime));
  }

  static String getFormattedDateTimeInBD({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat('yyyy-MM-dd hh:mm:ss a').format(getBDTime(selectedDateTime));
  }

  static String getFormattedDateTimeInBD2({required DateTime? selectedDateTime}) {
    if (selectedDateTime == null) return "No Date Selected";
    return DateFormat("MMMM dd, yyyy 'at' hha").format(getBDTime(selectedDateTime));
  }

  static DateTime getCanadianTime(DateTime dateTime){
    return dateTime.toUtc().add(AppConstants.canadaOffset);
  }

  static DateTime getBDTime(DateTime dateTime){
    DateTime utcTime = dateTime.subtract(AppConstants.canadaOffset);

    // Convert UTC time to Bangladesh time
    return utcTime.add(AppConstants.bdOffset);
  }
}