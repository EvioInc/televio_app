import 'package:intl/intl.dart';

String commaStringFromInt(int number) {
  var f = NumberFormat('###,###,###,###,###,###,###,###,###,###,###,###,###');
  return (f.format(number)).toString();
}
