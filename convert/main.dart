

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import "package:hex/hex.dart";


part 'main.g.dart';

@JsonSerializable(nullable: false)
class Person {
  final String firstName;
  final String lastName;

  Person({this.firstName, this.lastName});
  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}

void main(){
  class_to_json();
}

class GetUser{
  String user_ids;
}

void class_to_json(){
  var v = GetUser();
  json.encode(v);
}

void hex(){
  var s = "hello world";
  var b = utf8.encode(s);
  print(HEX.encode(b));

  print(HEX.decode("68656c6c6f20776f726c64"));
}

void _base64(){
  var s = "hello world";
  var b = base64.encode(utf8.encode(s));
  print(b);
}

void string_and_bytes(){
  var s = "hello";
  var list = utf8.encode(s);
  print(list.runtimeType);
  print(list);

  var ss = utf8.decode(list);
  print(ss);
}


void _json(List<String> arguments) {
  var  p =  Person(firstName: "edwin", lastName: 'shao');



  print(p.toJson());
  print(json.encode(p.toJson()));
  print(jsonEncode(p));


  var s = '''
  {
	  "firstName": "edwin",
	  "lastName": "shao"
  }''';

  var v = json.decode(s);
  print(v.runtimeType);

  var x = Person.fromJson(v);
  print(x.runtimeType);
}


