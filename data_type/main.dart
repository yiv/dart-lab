void main() {
  typeof();
}


void type_test(){
  var n = 2;
  print(n is int);
  print(n is double);

  var age;
  print(age is double);
  age = 2.2;
  print(age is double);

  dynamic any = 10;
  print(age is double);
  print(age is int);
  print(age is String);

}

void typeof(){
  var x= 1.10;
  print(x.runtimeType);
}

void const_and_final() {
//  final end;
//  final int end; //Err: The final variable 'end' must be initialized.

  final end = 5;

  const pi = 3.14;
  final area = pi * 3.14;
//  const volume = area * pi; //Err: Const variables must be initialized with a constant value.
  const volume = pi * pi * pi;

  print(pi);
  print(area);
  print(volume);

//  pi = 3.15; //Err: onstant variables can't be assigned a value.
//  area = area * 2; //Err: The final variable 'area' can only be set once.
}

void type_basic() {
  int age = 5;
  var name = "edwin";
  String nick = "show";

//  var int age; //Err: Variables can't be declared using both 'var' and a type name.
  var balance;
  print(balance); //Output: null
}

void type_dynamic() {
  dynamic any = 5;
  print(any);
  any = "55";
  print(any);
}
