// To parse this JSON data, do
//
//     final searchArticlesListModel = searchArticlesListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

SearchArticlesListModel searchArticlesListModelFromJson(String str) =>
    SearchArticlesListModel.fromJson(json.decode(str));

class SearchArticlesListModel {
  final String status;
  final String copyright;
  final Response response;

  SearchArticlesListModel({
    required this.status,
    required this.copyright,
    required this.response,
  });

  factory SearchArticlesListModel.fromJson(Map<String, dynamic> json) =>
      SearchArticlesListModel(
        status: json["status"],
        copyright: json["copyright"],
        response: Response.fromJson(json["response"]),
      );
}

class Response {
  final List<SearchResultItem> docs;
  final Meta meta;

  Response({
    required this.docs,
    required this.meta,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        docs: List<SearchResultItem>.from(json["docs"].map((x) => SearchResultItem.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
      );
}

class SearchResultItem {
  final String docAbstract;
  final String webUrl;
  final List<Multimedia> multimedia;
  final Headline headline;
  final String? pubDate;
  final Byline byline;
  final String? id;
  final int? wordCount;
  final String? uri;
  final String? printSection;

  SearchResultItem({
    required this.docAbstract,
    required this.webUrl,
    required this.multimedia,
    required this.headline,
    required this.pubDate,
    required this.byline,
    required this.id,
    required this.wordCount,
    required this.uri,
    required this.printSection,
  });

  factory SearchResultItem.fromJson(Map<String, dynamic> json) => SearchResultItem(
        docAbstract: json["abstract"],
        webUrl: json["web_url"],
        multimedia: List<Multimedia>.from(
            json["multimedia"].map((x) => Multimedia.fromJson(x))),
        headline: Headline.fromJson(json["headline"]),
        pubDate: json["pub_date"],
        byline: Byline.fromJson(json["byline"]),
        id: json["_id"],
        wordCount: json["word_count"],
        uri: json["uri"],
        printSection: json["print_section"],
      );
}

@JsonSerializable()
class Meta {
  final int hits;
  final int offset;
  final int time;

  Meta({
    required this.hits,
    required this.offset,
    required this.time,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        hits: json["hits"],
        offset: json["offset"],
        time: json["time"],
      );

  Map<String, dynamic> toJson() => {
        "hits": hits,
        "offset": offset,
        "time": time,
      };
}

@JsonSerializable()
class Byline {
  final String original;

  Byline({
    required this.original,
  });

  factory Byline.fromJson(Map<String, dynamic> json) => Byline(
        original: json["original"] == null ? 'No Author Available': json["original"],
      );

  Map<String, dynamic> toJson() => {
        "original": original,
      };
}

@JsonSerializable()
class Person {
  final String? firstname;
  final String? middlename;
  final String? lastname;
  final String? qualifier;
  final String? title;
  final String? role;
  final String? organization;
  final int? rank;

  Person({
    required this.firstname,
    required this.middlename,
    required this.lastname,
    required this.qualifier,
    required this.title,
    required this.role,
    required this.organization,
    required this.rank,
  });

  factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstname: json["firstname"],
        middlename: json["middlename"],
        lastname: json["lastname"],
        qualifier: json["qualifier"],
        title: json["title"],
        role: json["role"],
        organization: json["organization"],
        rank: json["rank"],
      );

  Map<String, dynamic> toJson() => {
        "firstname": firstname,
        "middlename": middlename,
        "lastname": lastname,
        "qualifier": qualifier,
        "title": title,
        "role": role,
        "organization": organization,
        "rank": rank,
      };
}

@JsonSerializable()
class Headline {
  final String? main;
  final String? kicker;
  final String? contentKicker;
  final String? printHeadline;
  final String? name;
  final String? seo;
  final String? sub;

  Headline({
    required this.main,
    required this.kicker,
    required this.contentKicker,
    required this.printHeadline,
    required this.name,
    required this.seo,
    required this.sub,
  });

  factory Headline.fromJson(Map<String, dynamic> json) => Headline(
        main: json["main"],
        kicker: json["kicker"],
        contentKicker: json["content_kicker"],
        printHeadline: json["print_headline"],
        name: json["name"],
        seo: json["seo"],
        sub: json["sub"],
      );

  Map<String, dynamic> toJson() => {
        "main": main,
        "kicker": kicker,
        "content_kicker": contentKicker,
        "print_headline": printHeadline,
        "name": name,
        "seo": seo,
        "sub": sub,
      };
}

@JsonSerializable()
class Multimedia {
  final String? url;
  final String? format;
  final int? height;
  final int? width;
  final String? type;
  final String? subtype;
  final String? caption;
  final String? copyright;

  Multimedia({
    required this.url,
    required this.format,
    required this.height,
    required this.width,
    required this.type,
    required this.subtype,
    required this.caption,
    required this.copyright,
  });

  factory Multimedia.fromJson(Map<String, dynamic> json) => Multimedia(
        url: json["url"],
        format: json["format"],
        height: json["height"],
        width: json["width"],
        type: json["type"],
        subtype: json["subtype"],
        caption: json["caption"],
        copyright: json["copyright"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "format": format,
        "height": height,
        "width": width,
        "type": type,
        "subtype": subtype,
        "caption": caption,
        "copyright": copyright,
      };
}
