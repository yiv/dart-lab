import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;

void main() {
   print(loop3());
}

Future<void> wait_multi_future() async {
  var f1 = loop1();
  var f2 = loop2();
  var futures = <Future>[];
  // futures.add(f1);
  futures.add(f2);
  await Future.wait(futures);
}

Future<void> future1() => loop1();
Future<void> future2()=> loop2();

Future<void> loop1() async {
  // for (var i = 0; i < 500; i++) {
  //   sleep(new Duration(seconds: 1));
  //   print("##1 ${i}");
  // }
  return "loop1";
}

Future<void> loop2() async {
  // for (var i = 0; i < 500; i++) {
  //   sleep(new Duration(seconds: 1));
  //   print("#2 ${i}");
  // }
  print("object");

  return "loop2";
}

Future<void> loop3 () => loop2();
