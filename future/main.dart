import 'dart:io';

import '../tcp_socket_client/main.dart';

void main() {
  future_jon();
}

Future<void> future_jon() async {
  var futures = <Future>[];
  futures.add(client_1());
  futures.add(client_2());

  sleep(Duration(seconds: 1));
  await Future.wait(futures);
}

Future<void> client_1() async {
  await tcp_client();
}

Future<void> client_2() async {
  await tcp_client();
}

Future<void> f1() async {
  for (var i = 0; i < 100; i++) {
    print("object - 1 - $i");
    sleep(Duration(seconds: 1));
  }
}

Future<void> f2() async {
  for (var i = 0; i < 100; i++) {
    print("object - 2 - $i");
    sleep(Duration(seconds: 1));
  }
}

void new_future() {
  new Future.delayed(
      new Duration(seconds: 1), () => print('future #1 (delayed)'));
}

String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Your order is: $order';
}

Future<String> fetchUserOrder() =>
    // Imagine that this function is more complex and slow.
    Future.delayed(
      Duration(seconds: 2),
      () => 'Large Latte',
    );
