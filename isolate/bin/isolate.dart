import 'dart:io';
import 'dart:isolate';

void main(List<String> arguments) {
  Loop.run_isolate_in_async();
}

void run_isolate_out_async() {
  var t = Isolate.spawn(loop, 'message');

  print(t);

  for (var i = 0; i < 500; i++) {
    print('main#1 ${i}');
    sleep(Duration(seconds: 1));
  }
}



class Loop {
  static void run_isolate_out_async() {
    var t = Isolate.spawn(loop, 'message');

    print(t);

    for (var i = 0; i < 500; i++) {
      print('main#1 ${i}');
      sleep(Duration(seconds: 1));
    }
  }
  static void run_isolate_in_async() async {
    var t = Isolate.spawn(loop, 'message');

    var x = await t;
    print('edwin 36 ${x.runtimeType}');
    print('edwin 37 ${t.runtimeType}');

    for (var i = 0; i < 500; i++) {
      print('main#1 ${i}');
      sleep(Duration(seconds: 1));
    }
  }
  static void loop(String msg) async {
    for (var i = 0; i < 500; i++) {
      print('isolate#1 ${i}');
      sleep(Duration(seconds: 1));
    }
  }
}

void loop(String msg) async {
  for (var i = 0; i < 500; i++) {
    print('isolate#1 ${i}');
    sleep(Duration(seconds: 1));
  }
}

void testIsolate() async {
  var receiver = ReceivePort();
  var sender = receiver.sendPort;
}
