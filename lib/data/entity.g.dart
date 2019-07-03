// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Entity _$EntityFromJson(Map<String, dynamic> json) {
  return Entity(
      json['code'] as int,
      json['msg'] as String,
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>));
}

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data
    };

Data _$DataFromJson(Map<String, dynamic> json) {
  return Data(
      (json['tech'] as List)
          ?.map((e) =>
              e == null ? null : Tech.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['auto'] as List)
          ?.map((e) =>
              e == null ? null : Auto.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['money'] as List)
          ?.map((e) =>
              e == null ? null : Money.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['sports'] as List)
          ?.map((e) =>
              e == null ? null : Sports.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['dy'] as List)
          ?.map(
              (e) => e == null ? null : Dy.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['war'] as List)
          ?.map(
              (e) => e == null ? null : War.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['ent'] as List)
          ?.map(
              (e) => e == null ? null : Ent.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['toutiao'] as List)
          ?.map((e) =>
              e == null ? null : Toutiao.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'tech': instance.tech,
      'auto': instance.auto,
      'money': instance.money,
      'sports': instance.sports,
      'dy': instance.dy,
      'war': instance.war,
      'ent': instance.ent,
      'toutiao': instance.toutiao
    };

Tech _$TechFromJson(Map<String, dynamic> json) {
  return Tech(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as String,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$TechToJson(Tech instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };

PicInfo _$PicInfoFromJson(Map<String, dynamic> json) {
  return PicInfo(json['ref'] as String, json['width'] as String,
      json['url'] as String, json['height'] as String);
}

Map<String, dynamic> _$PicInfoToJson(PicInfo instance) => <String, dynamic>{
      'ref': instance.ref,
      'width': instance.width,
      'url': instance.url,
      'height': instance.height
    };

Auto _$AutoFromJson(Map<String, dynamic> json) {
  return Auto(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as String,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$AutoToJson(Auto instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };

Money _$MoneyFromJson(Map<String, dynamic> json) {
  return Money(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as String,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$MoneyToJson(Money instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };

Sports _$SportsFromJson(Map<String, dynamic> json) {
  return Sports(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as String,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$SportsToJson(Sports instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };

Dy _$DyFromJson(Map<String, dynamic> json) {
  return Dy(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as String,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$DyToJson(Dy instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };

War _$WarFromJson(Map<String, dynamic> json) {
  return War(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as String,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$WarToJson(War instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };

Ent _$EntFromJson(Map<String, dynamic> json) {
  return Ent(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as String,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$EntToJson(Ent instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };

Toutiao _$ToutiaoFromJson(Map<String, dynamic> json) {
  return Toutiao(
      json['liveInfo'] as String,
      json['tcount'] as int,
      (json['picInfo'] as List)
          ?.map((e) =>
              e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      json['docid'] as String,
      json['videoInfo'] as String,
      json['channel'] as String,
      json['link'] as String,
      json['source'] as String,
      json['title'] as String,
      json['type'] as String,
      json['imgsrcFrom'] as String,
      json['imgsrc3gtype'] as int,
      json['unlikeReason'] as String,
      json['isTop'] as bool,
      json['digest'] as String,
      json['typeid'] as String,
      json['addata'] as String,
      json['tag'] as String,
      json['category'] as String,
      json['ptime'] as String);
}

Map<String, dynamic> _$ToutiaoToJson(Toutiao instance) => <String, dynamic>{
      'liveInfo': instance.liveInfo,
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'videoInfo': instance.videoInfo,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'type': instance.type,
      'imgsrcFrom': instance.imgsrcFrom,
      'imgsrc3gtype': instance.imgsrc3gtype,
      'unlikeReason': instance.unlikeReason,
      'isTop': instance.isTop,
      'digest': instance.digest,
      'typeid': instance.typeid,
      'addata': instance.addata,
      'tag': instance.tag,
      'category': instance.category,
      'ptime': instance.ptime
    };
