
import 'dart:convert';

import 'package:encrypt/encrypt.dart';
import 'package:hex/hex.dart';
import 'package:http/http.dart' as http;

const BILI_API_VIDEO_STAT = "http://api.bilibili.com/x/web-interface/archive/stat?";
const PHP_API_Prod = "https://a1.fanbook.mobi";
const PHP_USER_GET_USER = "/api/user/getUser";




Future<void> main() async {
  // await GetBiliVideoStat("BV1ep4y1e7qE");
  await GetUserInfo("137225053866557440");
}


String aes_encrypt(String userId, int expiredSeconds){
  final now = DateTime.now().millisecondsSinceEpoch;
  final tokenData = {"user_id": userId, "exp": now+expiredSeconds, "iat": now};
  final jsonData = json.encode(tokenData);
  final plainText = base64.encode(utf8.encode(jsonData));
  final theKey = HEX.encode(utf8.encode("xx&5!"));
  final theIv = HEX.encode(utf8.encode("8*2tn&xx%xx"));

  print(theKey);
  print(theIv);

  final key = Key.fromBase16(theKey);
  final iv = IV.fromBase16(theIv);
  final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

  final encrypted = encrypter.encrypt(plainText, iv: iv);

  return encrypted.base16;
}

Future<String> PostJSON(String host, String path, String content, Map<String, String> headers) async {
  var reqUrl = "${host}${path}";
  // var req = http.Request("POS", Uri.https(host, path))
  //   ..headers.addAll(headers)
  //   ..body = content;
  // var res =  await http.Client().send(req);
  // var x = await http.Response.fromStream(res);
  headers[ "Content-Type"] = "application/json";
  var x = await http.post(reqUrl, headers: headers, body: content);
  print(x.statusCode);
  print(x.request.headers);
  return x.body;
}


Future<void> GetUserInfo(String userId) async {
  var req =  {"user_ids": userId};
  // req.user_ids = userId;
  var body = json.encode(req);

  print(body);
  var token = aes_encrypt(userId, 3600);

  var headers = {"Authorization": "b1d9Tcgo//l8we9LJIQb48BvUX2ruFe/eOpMimeteSXtRb1xaZjtF9LCzQh/aOn6inwz1qpYB2yiPkFUbdjWBtIOtDsY/B/Gv9KcwbuuIhZlB2KL2v+o1N9r14i/qWg5bt4oGfCRRI0KCh/LAF3fa6cb56g4Tn/RJ7+gyIG69Ro="};

  var res =  await PostJSON(PHP_API_Prod, PHP_USER_GET_USER, body, headers);
  print(res);
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