
import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart' as http;

const BILI_API_VIDEO_STAT = "http://api.bilibili.com/x/web-interface/archive/stat?";


Future<void> main() async {
  await GetBiliVideoStat("BV1ep4y1e7qE");
}


String aes_encrypt(String userId, int expiredSeconds){
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

  return encrypted.base16;
}

String PostJSON(String host, String path, String content, Map<String, String> headers){
  return "";
}

Future<void> GetBiliVideoStat(String id) async {
  var v = parseBiliVideoId(id);
  var reqUrl = "";
  if (v.isBv) {
    reqUrl = "${BILI_API_VIDEO_STAT}bvid=${v.id}";
  } else {
    reqUrl = "${BILI_API_VIDEO_STAT}aid=${v.id}";
  }

  var res = await http.get(reqUrl);
  print(res.runtimeType);
  print(res.statusCode);
  print(res.body);
}

class BiliVideoId {
  String id;
  bool isBv;
}

BiliVideoId parseBiliVideoId(String id){
  var v = BiliVideoId();
  if (id.startsWith("BV") || id.startsWith("bv")){
    v.id = id;
    v.isBv = true;
  }else if (id.startsWith("AV")){
    v.id = id.replaceAll("AV", "");
    v.isBv = false;
  }else if (id.startsWith("av")){
    v.id = id.replaceAll("av", "");
    v.isBv = false;
  }
  return v;
}