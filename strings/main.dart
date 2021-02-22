

void main(){

  splitString();


}

void some(){
  var s = "hello world";
  print(s.contains("wor"));
  print(s.startsWith("he"));
  print(s.endsWith("o"));
  print(s.replaceAll("world", "earth"));

  s = "    world   ";
  print(s.trimLeft());
  print(s.trimRight());
  print(s.replaceAll(" ", ""));
}

void rawString(){
  final s = '''{"id":"1234567890", "title": "社会", "body": "中右檑sdfk"}''';
  print(s);
}

void splitString(){
  final s = 'a b c';
  final r = s.split(' ');
  print('r=$r, type=${r.runtimeType}');
}