import 'package:json_annotation/json_annotation.dart';

part 'entity.g.dart';


@JsonSerializable()
  class Entity extends Object {

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'data')
  Data data;

  Entity(this.code,this.msg,this.data,);

  factory Entity.fromJson(Map<String, dynamic> srcJson) => _$EntityFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntityToJson(this);

}


@JsonSerializable()
  class Data extends Object {

  @JsonKey(name: 'tech')
  List<Tech> tech;

  @JsonKey(name: 'auto')
  List<Auto> auto;

  @JsonKey(name: 'money')
  List<Money> money;

  @JsonKey(name: 'sports')
  List<Sports> sports;

  @JsonKey(name: 'dy')
  List<Dy> dy;

  @JsonKey(name: 'war')
  List<War> war;

  @JsonKey(name: 'ent')
  List<Ent> ent;

  @JsonKey(name: 'toutiao')
  List<Toutiao> toutiao;

  Data(this.tech,this.auto,this.money,this.sports,this.dy,this.war,this.ent,this.toutiao,);

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
  class Tech extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  String isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  Tech(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory Tech.fromJson(Map<String, dynamic> srcJson) => _$TechFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TechToJson(this);

}


@JsonSerializable()
  class PicInfo extends Object {

  @JsonKey(name: 'ref')
  String ref;

  @JsonKey(name: 'width')
  String width;

  @JsonKey(name: 'url')
  String url;

  @JsonKey(name: 'height')
  String height;

  PicInfo(this.ref,this.width,this.url,this.height,);

  factory PicInfo.fromJson(Map<String, dynamic> srcJson) => _$PicInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$PicInfoToJson(this);

}


@JsonSerializable()
  class Auto extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  String isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  Auto(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory Auto.fromJson(Map<String, dynamic> srcJson) => _$AutoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AutoToJson(this);

}





@JsonSerializable()
  class Money extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  String isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  Money(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory Money.fromJson(Map<String, dynamic> srcJson) => _$MoneyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$MoneyToJson(this);

}




@JsonSerializable()
  class Sports extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  String isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  Sports(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory Sports.fromJson(Map<String, dynamic> srcJson) => _$SportsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SportsToJson(this);

}





@JsonSerializable()
  class Dy extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  String isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  Dy(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory Dy.fromJson(Map<String, dynamic> srcJson) => _$DyFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DyToJson(this);

}





@JsonSerializable()
  class War extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  String isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  War(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory War.fromJson(Map<String, dynamic> srcJson) => _$WarFromJson(srcJson);

  Map<String, dynamic> toJson() => _$WarToJson(this);

}





@JsonSerializable()
  class Ent extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  String isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  Ent(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory Ent.fromJson(Map<String, dynamic> srcJson) => _$EntFromJson(srcJson);

  Map<String, dynamic> toJson() => _$EntToJson(this);

}





@JsonSerializable()
  class Toutiao extends Object {

  @JsonKey(name: 'liveInfo')
  String liveInfo;

  @JsonKey(name: 'tcount')
  int tcount;

  @JsonKey(name: 'picInfo')
  List<PicInfo> picInfo;

  @JsonKey(name: 'docid')
  String docid;

  @JsonKey(name: 'videoInfo')
  String videoInfo;

  @JsonKey(name: 'channel')
  String channel;

  @JsonKey(name: 'link')
  String link;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'imgsrcFrom')
  String imgsrcFrom;

  @JsonKey(name: 'imgsrc3gtype')
  int imgsrc3gtype;

  @JsonKey(name: 'unlikeReason')
  String unlikeReason;

  @JsonKey(name: 'isTop')
  bool isTop;

  @JsonKey(name: 'digest')
  String digest;

  @JsonKey(name: 'typeid')
  String typeid;

  @JsonKey(name: 'addata')
  String addata;

  @JsonKey(name: 'tag')
  String tag;

  @JsonKey(name: 'category')
  String category;

  @JsonKey(name: 'ptime')
  String ptime;

  Toutiao(this.liveInfo,this.tcount,this.picInfo,this.docid,this.videoInfo,this.channel,this.link,this.source,this.title,this.type,this.imgsrcFrom,this.imgsrc3gtype,this.unlikeReason,this.isTop,this.digest,this.typeid,this.addata,this.tag,this.category,this.ptime,);

  factory Toutiao.fromJson(Map<String, dynamic> srcJson) => _$ToutiaoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ToutiaoToJson(this);

}


