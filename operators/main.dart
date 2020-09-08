void main() {
  conditional_exp();
}

void assign_to_null() {
  var age = 5;
  var empty;

  age ??= 50;
  empty ??= 100;

  print(age);
  print(empty);
}

void conditional_exp() {
  int a = 5;
  int b = 6;
  var bigger = a > b ? a : b;
  print(bigger);

  var age = 5;
  var num;
  var m = age ?? 50;
  var n = num ?? 100;
  print(m);
  print(n);
}
