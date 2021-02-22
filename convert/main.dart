import 'dart:convert';

import "package:hex/hex.dart";


void main() {
  class_to_json();
}





void hex() {
  var s = "hello world";
  var b = utf8.encode(s);
  print(HEX.encode(b));

  print(HEX.decode("68656c6c6f20776f726c64"));
}

void _base64() {
  var s = "hello world";
  var b = base64.encode(utf8.encode(s));
  print(b);
}

void string_and_bytes() {
  var s = "hello";
  var list = utf8.encode(s);
  print(list.runtimeType);
  print(list);

  var ss = utf8.decode(list);
  print(ss);
}

void json_to_map() {
  var s1 = '''[
	{
		"message_id" : 141906710246850560,
		"guild_id" : 139260719811133440,
		"channel_id" : 139260947033358336,
		"user_id" : 139259597750927360,
		"timestamp" : "2020-09-02T14:14:44.000Z"
	}]''';

  var s2 = r'''[{
		"message_id" : 141906710238461952,
		"guild_id" : 139260719811133440,
		"channel_id" : 139260947033358336,
		"user_id" : 139259496311685120,
		"timestamp" : "2020-09-02T14:14:44.000Z",
		"content": "\"type\""
	}]''';

  var d1 = jsonDecode(s1);
  print(d1 is List);
  var d2 = jsonDecode(s2);
  print(d2 is List);

}

void map_to_json() {
  var m = {'name': 'edw\"in\"'};
  print(m);

  var s = jsonEncode(m);
  print(s);

  var s1 = r'{"name":"edw\"in\""}';
  var m1 = jsonDecode(s1);
  print(m1);
}

