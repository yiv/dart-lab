void main(){
  switch_test();
}


void switch_test(){
  final countryCode = "UK";
  switch (countryCode){
    case "CN": {
      print(10);
    }
    break;
    case "US": {
      print(13);
    }
    break;
    default: {
      print(18);
    }
  }
}