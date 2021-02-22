import 'dart:io';
import 'dart:isolate';



void main() {
  isolate();
}


void future_foo(var message) {
  for (var i = 0; i < 50; i++){
    print('execution from foo ... the message is :${message} - ${i}');
    sleep(new Duration(seconds: 1));
  }
}

void multi_futures(){

}

void isolate_foo(var message) {
  for (var i = 0; i < 50; i++){
    print('execution from foo ... the message is :${message} - ${i}');
    sleep(new Duration(seconds: 1));
  }
}

void isolate(){
  Isolate.spawn(isolate_foo, 'Hello!!');
  Isolate.spawn(isolate_foo, 'Greetings!!');
  Isolate.spawn(isolate_foo, 'Welcome!!');
  sleep(new Duration(seconds: 500));
}
