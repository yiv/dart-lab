void main(List<String> arguments) {
  list_access_modify();
}


void map_init(){
  var colors = new Map();
  var colors1 =  Map();
  colors['blue']= 'blue';
  colors['red'] = true;
  colors['black'] = 0;

  print(colors is Map);
  print(colors.runtimeType);

  var shapes1 = {};
  var shapes2 = {
    'square': false,
    'triangle': true,
    'date': 11,
  };

  print(shapes2 is Map);
  print(shapes2.runtimeType);
}

void map_iterate(){
  var shapes = {
    'square': false,
    'triangle': true,
    'date': 11,
  };

  for (var key in shapes.keys){
    print(key);
  }
  for (var value in shapes.values){
    print(value);
  }

  shapes.forEach((key, value) {
    print('key=${key}, value=${value}');
    if (key == 'date') {
      value = 20;
    }
    if (key == 'triangle'){
      shapes[key] = false;
    }
  });
  print(shapes);
}

void map_access(){
  var shapes = {
    'square': false,
    'triangle': true,
    'date': 11,
  };
  shapes['date'] = 15;
  print(shapes);
  shapes.remove('date');
  print(shapes);
  shapes.addAll({'a': 1, 'b': 2});
  print(shapes);
}

void list_init(){
  // fixed list
  var l1 = new List(3);
  var l2 = List(3);
  l2[0] = 'a';
  l2[1] = 'b';
  l2[2] = 'c';
  print(l2);
  //l2[3] = 'd'; //RangeError (index): Invalid value: Not in inclusive range 0..2: 3

  // growable list
  var g1 = new List();
  var g2 = List();
  var g3 = [];
  var g4 = ['a', 'b'];
  print(g2);
  print(g4);
}

void list_iterate(){
  var l = ['a', 'b'];
  l.forEach((element) {
    print(element);
  });

  for (var v in l){
    print(v);
  }

  var m = l.asMap();
  print(m.runtimeType);

  l.asMap().forEach((key, value) {
    print('key = ${key}, key_type = ${key.runtimeType}, value = ${value}');
  });

}

void list_access_modify(){
  var l = ['a', 'b'];
  l[0] = 'aa';
  print(l);
  // l[9] = '9'; //RangeError (index): Invalid value: Not in inclusive range 0..1: 9
  l.addAll(['x', 'y', 'z']);
  print(l);
}


