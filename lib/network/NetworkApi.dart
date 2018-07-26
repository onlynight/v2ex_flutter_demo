import 'dart:async';
import 'dart:convert';

import 'package:flutter_app/model/RepliesResp.dart';
import 'package:flutter_app/model/SiteInfoResp.dart';
import 'package:flutter_app/model/TopicsResp.dart';
import 'package:flutter_app/network/Constants.dart' as httpConstants;
import 'package:http/http.dart' as http;
import 'package:kernel/log.dart';
//import 'package:logging/logging.dart';

final Logger log1 = new Logger("dart-kernel");

class NetworkApi {
//  static Logger log = new Logger('NetworkApi');

  static Future _read(String url) {
    return http.read(url);
  }

//  response =
//  '''
//  {
//
//    "status": "error",
//    "message": "Object Not Found",
//    "rate_limit": {
//      "used": 5,
//      "hourly_quota": 120,
//      "hourly_remaining": 115
//    }
//  }
//  ''';

  static dynamic _get(String url) async {
//    log.fine('log');
    String response = await _read(url);
//    log.fine('$url =>\n $response');
    print('$url =>\n $response');
    return json.decode(response.replaceAll('\r\n', '').replaceAll('\n', ''));
  }

  static Future<SiteInfoResp> getSiteInfo() async {
    return SiteInfoResp.fromJson(await _get(httpConstants.API_SITE_INFO));
  }

  static Future<TopicsResp> getLatestTopics() async {
    return TopicsResp.fromJson(await _get(httpConstants.API_TOPICS_LATEST));
  }

  static Future<TopicsResp> getHotTopics() async {
    return TopicsResp.fromJson(await _get(httpConstants.API_TOPICS_HOT));
  }

  static Future<TopicsResp> getTopicDetails(int id) async {
    return TopicsResp.fromJson(
        await _get(httpConstants.API_TOPIC_DETAILS + '?id=' + id.toString()));
  }

  static Future<RepliesResp> getReplies(int topicId) async {
    return RepliesResp.fromJson(await _get(
        httpConstants.API_TOPIC_REPLY + '?topic_id=' + topicId.toString()));
  }

}
