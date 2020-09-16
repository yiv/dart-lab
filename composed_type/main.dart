void main() {
  growable_list();
}

void fixed_list() {
  var list = new List(3);
  print(list);
  print(list.length);
}

void growable_list() {
  var list = [];
  print(list);
  print(list.length);

  list.add(5);
  print(list);
  list.add(10);
  list[1] = 50;
  print(list);
  var reverse = list.reversed.toList();
  print(reverse);

  reverse.forEach((element) {
    print(element);
  });

  list.removeAt(0);
  print(list);
}

void the_map() {
  Map<String, String> a = new Map();
  print(a.isEmpty);
  a["haha"] = "wowo";
  print(a);

  var b = {0: "00"};
  print(b);
  print(b.runtimeType);

  var c = <String, double>{"a": 2};
  c["b"] = 21.0;
  c["d"] = 55;
  print(c);
  print(c.runtimeType);

  c.remove("d");
  print(c);

  dynamic d = {"a": 1, "b": 2};
  print(d.runtimeType);

  d.forEach((k, v) {
    print(k);
    print(v);
  });
}
