
import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:hex/hex.dart';



void aes_encrypt(String userId, int expiredSeconds){
  final now = DateTime.now().millisecondsSinceEpoch;
  final tokenData = {"user_id": userId, "exp": now+expiredSeconds, "iat": now};
  final jsonData = json.encode(tokenData);
  final plainText = base64.encode(utf8.encode(jsonData));
  final theKey = HEX.encode(utf8.encode("a9PFsAXHiGktp&5!"));
  final theIv = HEX.encode(utf8.encode("8*2tn&O6wc%x4g1b"));

  print(theKey);
  print(theIv);

  final key = Key.fromBase16(theKey);
  final iv = IV.fromBase16(theIv);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  final encrypted = encrypter.encrypt(plainText, iv: iv);
  final decrypted = encrypter.decrypt(encrypted, iv: iv);

  print(decrypted);
  print(encrypted.bytes);
  print(encrypted.base16);
  print(encrypted.base64);

}

void main(){
  aes_encrypt("136754116792680450", 3600);
}

