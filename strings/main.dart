

void main(){

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