import 'dart:async';

import 'dart:io';

void main(List<String> arguments) {
  test_my_tcp_stream();
}



void simple_stream (){
  var s1 = Stream.fromIterable([1,2,3,4,5]);
  // s1.forEach((element) {
  //   print(element);
  // });

  var l1 = s1.toList();
  print(l1.runtimeType);

  
  var s2 = Stream.periodic(Duration(seconds: 1)).forEach((element) {
    print(element);
  });

}

void new_stream(){
  var ts = TestStream();
  print(ts.runtimeType);
  var s1 = ts.stream;
  print(s1.runtimeType);

  s1.listen((event) {
    print('listen $event');
  });

}

class TestStream {
  TestStream(){
    // Timer.run((){
    //   for (var i = 0; i < 1000; i++){
    //     var t = DateTime.now().millisecondsSinceEpoch;
    //     print('$i - $t');
    //     _controller.sink.add(i);
    //   }
    // });
    Timer.periodic(Duration(seconds: 1), (timer) {
      var t = DateTime.now().millisecondsSinceEpoch;
      print('$t');
      _controller.sink.add(t);
    });
  }
  final _controller = StreamController<int>();
  Stream<int> get stream => _controller.stream;
}


void test_my_tcp_stream(){
  var m = MyTcpStream();
  var s = m.stream;
  s.listen((event) {
    print(event);
  });
}

class MyTcpStream {
  MyTcpStream(){
    Socket.connect("localhost", 7001).then((Socket sock){
      sock.listen((event) {
        var data = String.fromCharCodes(event).trim();
        _controller.sink.add('my tcp stream: $data');
      });
    });
  }
  final _controller = StreamController<String>();
  Stream<String> get stream => _controller.stream;
}