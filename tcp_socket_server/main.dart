import 'dart:core';
import 'dart:async';
import 'dart:io';



//more https://gist.github.com/adrian61/8ba9a2084e0110d47b85a216a6d43189
void startServer() {
  Future<ServerSocket> serverFuture = ServerSocket.bind('0.0.0.0', 7001);
  serverFuture.then((ServerSocket server) {
    server.listen((Socket socket) {
      while(true){
        var data = DateTime.now().millisecondsSinceEpoch;
        print("7001 $data");
        socket.write(data);
        sleep(new Duration(seconds: 1));
      }
      socket.listen((List<int> data) {
        String result = new String.fromCharCodes(data);
        print(result.substring(0, result.length - 1));
        socket.write("echo: "+result);
      });
    });
  });
}

void startServer2() {
  Future<ServerSocket> serverFuture = ServerSocket.bind('0.0.0.0', 7002);
  serverFuture.then((ServerSocket server) {
    server.listen((Socket socket) {
      while(true){
        var data = DateTime.now().millisecondsSinceEpoch;
        print("7002 $data");
        socket.write(data);
        sleep(new Duration(seconds: 1));
      }
      socket.listen((List<int> data) {
        String result = new String.fromCharCodes(data);
        print(result.substring(0, result.length - 1));
        socket.write("echo: "+result);
      });
    });
  });
}

void main() {
  startServer();
  // startServer2();
  print("object -1");
}