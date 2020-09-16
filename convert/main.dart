

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

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
  _base64();
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


