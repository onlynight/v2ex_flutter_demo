import 'dart:convert' show json;

import 'package:flutter_app/model/BaseResp.dart';

class SiteInfoResp extends BaseResp {
  String description;
  String domain;
  String slogan;
  String title;

  SiteInfoResp.fromParams({
    this.description,
    this.domain,
    this.slogan,
    this.title,
    String message,
    String status,
    RateLimit rateLimit,
  }) : super.fromParams(
            message: message, status: status, rate_limit: rateLimit);

  factory SiteInfoResp(jsonStr) => jsonStr is String
      ? SiteInfoResp.fromJson(json.decode(jsonStr))
      : SiteInfoResp.fromJson(jsonStr);

  SiteInfoResp.fromJson(jsonRes) : super.fromJson(jsonRes) {
    try {
      description = jsonRes['description'];
      domain = jsonRes['domain'];
      slogan = jsonRes['slogan'];
      title = jsonRes['title'];
    } catch (e) {
      print(e);
    }
  }

  @override
  String toString() {
    return super.toString() +
        '\n' +
        '{"description": ${description != null ? '${json.encode(
            description)}' : 'null'},"domain": ${domain != null ? '${json
            .encode(
            domain)}' : 'null'},"slogan": ${slogan != null ? '${json.encode(
            slogan)}' : 'null'},"title": ${title != null
            ? '${json.encode(title)}'
            : 'null'}}';
  }
}
