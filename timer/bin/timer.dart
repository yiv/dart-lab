import 'dart:async';

void main(List<String> arguments) {
  timer_run();
  print('Hello world!');
}

void test_() {
  Timer.periodic(Duration(seconds: 1), (t) {
    print(t);
  });
}

void timer_run() {
  Timer.run(() {
    for (var i = 0; i < 100; i++) {
      var x = DateTime.now().millisecondsSinceEpoch;
      print(x);
    }
  });
}
