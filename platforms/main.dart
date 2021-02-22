

import 'dart:io' show Platform;

void main(){
  print(Platform.environment);
  print(Platform.isWindows);
  print(Platform.isMacOS);
  print(Platform.isIOS);
}