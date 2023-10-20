import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

final dateFormatter = DateFormat.yMd();

const uuid = Uuid();

String getCapitalizedString(String str) {
  String capitalizedString =
      str.substring(0, 1).toUpperCase() + str.substring(1);

  return capitalizedString;
}
