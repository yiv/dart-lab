
import 'package:intl/intl.dart';  //for date format
import 'package:intl/date_symbol_data_local.dart';  //for date locale

void main(){
  var n = new DateTime.now();
  print(n.millisecondsSinceEpoch);
  print(n.millisecond);
  print(n);

  var formatter = new DateFormat("yyyy-MM-dd");
  print(formatter.format(n));

  formatter = DateFormat.yMMMd();
  print(formatter.format(n));

  var m = DateTime.parse("2020-09-16 21:05:27");
  print(m);
}

void duration() {
  var x = new Duration(seconds: 1);

}