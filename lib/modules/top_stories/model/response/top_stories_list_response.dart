// To parse this JSON data, do
//
//     final topStoriesListModel = topStoriesListModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

TopStoriesListModel topStoriesListModelFromJson(String str) => TopStoriesListModel.fromJson(json.decode(str));

@JsonSerializable()
class TopStoriesListModel {
  final String status;
  final String copyright;
  final String section;
  final DateTime lastUpdated;
  final int numResults;
  final List<TopStoryItem> results;

  TopStoriesListModel({
    required this.status,
    required this.copyright,
    required this.section,
    required this.lastUpdated,
    required this.numResults,
    required this.results,
  });

  factory TopStoriesListModel.fromJson(Map<String, dynamic> json) => TopStoriesListModel(
    status: json["status"],
    copyright: json["copyright"],
    section: json["section"],
    lastUpdated: DateTime.parse(json["last_updated"]),
    numResults: json["num_results"],
    results: List<TopStoryItem>.from(json["results"].map((x) => TopStoryItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "copyright": copyright,
    "section": section,
    "last_updated": lastUpdated.toIso8601String(),
    "num_results": numResults,
    "results": List<dynamic>.from(results.map((x) => x.toJson())),
  };

}
@JsonSerializable()
class TopStoryItem {
  final String section;
  final String subsection;
  final String title;
  final String abstract;
  final String url;
  final String uri;
  final String byline;
  final String itemType;
  final DateTime updatedDate;
  final DateTime createdDate;
  final DateTime publishedDate;
  final String materialTypeFacet;
  final String kicker;
  final List<String> desFacet;
  final List<String> orgFacet;
  final List<String> perFacet;
  final List<String> geoFacet;
  final List<Multimedia> multimedia;
  final String shortUrl;

  TopStoryItem({
    required this.section,
    required this.subsection,
    required this.title,
    required this.abstract,
    required this.url,
    required this.uri,
    required this.byline,
    required this.itemType,
    required this.updatedDate,
    required this.createdDate,
    required this.publishedDate,
    required this.materialTypeFacet,
    required this.kicker,
    required this.desFacet,
    required this.orgFacet,
    required this.perFacet,
    required this.geoFacet,
    required this.multimedia,
    required this.shortUrl,
  });

  factory TopStoryItem.fromJson(Map<String, dynamic> json) => TopStoryItem(
    section: json["section"],
    subsection: json["subsection"],
    title: json["title"],
    abstract: json["abstract"],
    url: json["url"],
    uri: json["uri"],
    byline: json["byline"],
    itemType: json["item_type"],
    updatedDate: DateTime.parse(json["updated_date"]),
    createdDate: DateTime.parse(json["created_date"]),
    publishedDate: DateTime.parse(json["published_date"]),
    materialTypeFacet: json["material_type_facet"],
    kicker: json["kicker"],
    desFacet: List<String>.from(json["des_facet"].map((x) => x)),
    orgFacet: List<String>.from(json["org_facet"].map((x) => x)),
    perFacet: List<String>.from(json["per_facet"].map((x) => x)),
    geoFacet: List<String>.from(json["geo_facet"].map((x) => x)),
    multimedia:json["multimedia"] == null ? []: List<Multimedia>.from(json["multimedia"].map((x) => Multimedia.fromJson(x))),
    shortUrl: json["short_url"],
  );


  Map<String, dynamic> toJson() => {
    "section": section,
    "subsection": subsection,
    "title": title,
    "abstract": abstract,
    "url": url,
    "uri": uri,
    "byline": byline,
    "item_type": itemType,
    "updated_date": updatedDate.toIso8601String(),
    "created_date": createdDate.toIso8601String(),
    "published_date": publishedDate.toIso8601String(),
    "material_type_facet": materialTypeFacet,
    "kicker": kicker,
    "des_facet": List<dynamic>.from(desFacet.map((x) => x)),
    "org_facet": List<dynamic>.from(orgFacet.map((x) => x)),
    "per_facet": List<dynamic>.from(perFacet.map((x) => x)),
    "geo_facet": List<dynamic>.from(geoFacet.map((x) => x)),
    "multimedia": List<dynamic>.from(multimedia.map((x) => x.toJson())),
    "short_url": shortUrl,
  };

}


@JsonSerializable()
class Multimedia {
  final String url;
  final String format;
  final int height;
  final int width;
  final String type;
  final String subtype;
  final String caption;
  final String copyright;

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

