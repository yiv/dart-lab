
import 'dart:io';
import 'dart:async';

Socket socket;

void main() {
  print("tcp socket client......1");
  Socket.connect("localhost", 7001).then((Socket sock) {
    print('Connected to: '
        '${sock.remoteAddress.address}:${sock.remotePort}');
    socket = sock;
    socket.listen(dataHandler,
        onError: errorHandler,
        onDone: doneHandler,
        cancelOnError: false);
  }).catchError((AsyncError e) {
    print("Unable to connect: $e");
  });
  print("tcp socket client......2");
  Socket.connect("localhost", 7002).then((Socket sock) {
    print('Connected to: '
        '${sock.remoteAddress.address}:${sock.remotePort}');
    socket = sock;
    socket.listen(dataHandler2,
        onError: errorHandler,
        onDone: doneHandler,
        cancelOnError: false);
  }).catchError((AsyncError e) {
    print("Unable to connect: $e");
  });
  //Connect standard in to the socket
  stdin.listen((data) => socket.write(new String.fromCharCodes(data).trim() + '\n'));
}


Future tcp_client() async{
  print("tcp socket client......");
  Socket.connect("localhost", 7001).then((Socket sock) {
    print('Connected to: '
        '${sock.remoteAddress.address}:${sock.remotePort}');
    socket = sock;
    socket.listen(dataHandler,
        onError: errorHandler,
        onDone: doneHandler,
        cancelOnError: false);
  }).catchError((AsyncError e) {
    print("Unable to connect: $e");
  });
}


void dataHandler(data){
  print("#1 from: " + String.fromCharCodes(data).trim());

}
void dataHandler2(data){
  // print("#2 from: " + String.fromCharCodes(data).trim());
  print("#2 from: " + String.fromCharCodes(data).trim());
}

void errorHandler(error, StackTrace trace){
  print(error);
}

void doneHandler(){
  socket.destroy();
}