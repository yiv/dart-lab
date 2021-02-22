
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

part 'convert_json.g.dart';




final result_list =
    r'[{"snippet":"{\"type\": \"text\", \"text\": \"女生真的<b>路</b><b>痴</b>么？","result":{"guild_id":139260719811133440,"message_id":141906710246850560,"channel_id":139260947033358336,"timestamp":"2020-09-02T14:14:44+00:00","user_id":139259597750927360,"content":"{\"type\": \"text\", \"text\": \"女生真的路痴么？\\t我就是路痴，真的，大号的我会做菜会合并报表会弹钢琴会撕逼我智商（据扯）高达160但是港真我就是不认路真不是蠢，就是人总得有个擅长不擅长的吧，我要是啥都擅长你们不得惭愧死？ 我初中时候才会看纸质的地图（仅限中国地图跟世界地图，那俩货已经在我卧室墙上挂了很多年了都晒褪色了），现在给我一个省的地图我都只认识山东上海台湾高中时候学什么时区变更我到现在都没搞明白，全靠手机的世界时钟功能 作为一个北方人\", \"contentType\": 0}"}}]';
final result = r'{"snippet":"{\"type\": \"text\", \"text\": \"女生真的<b>路</b><b>痴</b>么？","result":{"guild_id":139260719811133440,"message_id":141906710246850560,"channel_id":139260947033358336,"timestamp":"2020-09-02T14:14:44+00:00","user_id":139259597750927360,"content":"{\"type\": \"text\", \"text\": \"女生真的路痴么？\\t我就是路痴，真的，大号的我会做菜会合并报表会弹钢琴会撕逼我智商（据扯）高达160但是港真我就是不认路真不是蠢，就是人总得有个擅长不擅长的吧，我要是啥都擅长你们不得惭愧死？ 我初中时候才会看纸质的地图（仅限中国地图跟世界地图，那俩货已经在我卧室墙上挂了很多年了都晒褪色了），现在给我一个省的地图我都只认识山东上海台湾高中时候学什么时区变更我到现在都没搞明白，全靠手机的世界时钟功能 作为一个北方人\", \"contentType\": 0}"}}';
final message = r'{"guild_id":139260719811133440,"message_id":141906710246850560,"channel_id":139260947033358336,"timestamp":"2020-09-02T14:14:44+00:00","user_id":139259597750927360,"content":"{\"type\": \"text\", \"text\": \"女生真的路痴么？\\t我就是路痴，真的，大号的我会做菜会合并报表会弹钢琴会撕逼我智商（据扯）高达160但是港真我就是不认路真不是蠢，就是人总得有个擅长不擅长的吧，我要是啥都擅长你们不得惭愧死？ 我初中时候才会看纸质的地图（仅限中国地图跟世界地图，那俩货已经在我卧室墙上挂了很多年了都晒褪色了），现在给我一个省的地图我都只认识山东上海台湾高中时候学什么时区变更我到现在都没搞明白，全靠手机的世界时钟功能 作为一个北方人\", \"contentType\": 0}"}';




void main(List<String> arguments) {
  class_to_json();
}


void class_to_json() {
  var v = Message(100, 200, 300, "tommorow", "ddddd");
  final s = v.toJson();
  print(s.runtimeType);
  print(s);
  print(json.encode(s));

  final list = [Message(100, 200, 300, "tommorow", "ddddd"), Message(100, 200, 300, "tommorow", "ddddd")];

  final ss = json.encode(list);
  print(ss.runtimeType);
  print(ss);

}

void json_to_class() {
  final _json = json.decode(result);
  final r = Result.fromJson(_json);
  print(r.runtimeType);
  print(r);
  print(r.snippet);

  var results = (json.decode(result_list) as List).map((e) => Result.fromJson(e)).toList();
  print(results.runtimeType);
  
}


@JsonSerializable()
class Result {
  final String snippet;
  final Message result;

  Result(this.snippet, this.result);

  factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}

@JsonSerializable()
class Message {
  final int message_id;
  final int guild_id;
  final int user_id;
  final String timestamp;
  final String content;

  Message(this.message_id, this.guild_id, this.user_id, this.timestamp,
      this.content);
  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

}
