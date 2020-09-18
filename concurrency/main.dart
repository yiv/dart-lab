import 'dart:io';
import 'dart:isolate';

void foo(var message) {
  for (var i = 0; i < 50; i++){
    print('execution from foo ... the message is :${message} - ${i}');
    sleep(new Duration(seconds: 1));

  }
}

void main() {
  Isolate.spawn(foo, 'Hello!!');
  Isolate.spawn(foo, 'Greetings!!');
  Isolate.spawn(foo, 'Welcome!!');
  print('execution from main1');
  print('execution from main2');
  print('execution from main3');
  sleep(new Duration(seconds: 500));
}
