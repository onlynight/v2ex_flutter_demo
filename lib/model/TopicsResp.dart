import 'dart:convert' show json;

import 'package:flutter_app/model/BaseResp.dart';
import 'package:flutter_app/model/MemberResp.dart';

class TopicsResp extends BaseResp {
  List<Topic> list;

  TopicsResp.fromParams({this.list}) : super.fromParams();

  factory TopicsResp(jsonStr) => jsonStr is String
      ? TopicsResp.fromJson(json.decode(jsonStr))
      : TopicsResp.fromJson(jsonStr);

  TopicsResp.fromJson(jsonRes) : super.fromJson(jsonRes) {
    list = [];

    for (var listItem in jsonRes) {
      list.add(new Topic.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"json_list": $list}';
  }
}

class Topic {
  int created;
  int id;
  int last_modified;
  int last_touched;
  int replies;
  String content;
  String content_rendered;
  String title;
  String url;
  Member member;
  Node node;

  Topic.fromParams(
      {this.created,
      this.id,
      this.last_modified,
      this.last_touched,
      this.replies,
      this.content,
      this.content_rendered,
      this.title,
      this.url,
      this.member,
      this.node});

  Topic.fromJson(jsonRes) {
    created = jsonRes['created'];
    id = jsonRes['id'];
    last_modified = jsonRes['last_modified'];
    last_touched = jsonRes['last_touched'];
    replies = jsonRes['replies'];
    content = jsonRes['content'];
    content_rendered = jsonRes['content_rendered'];
    title = jsonRes['title'];
    url = jsonRes['url'];
    member = new Member.fromJson(jsonRes['member']);
    node = new Node.fromJson(jsonRes['node']);
  }

  @override
  String toString() {
    return '{"created": $created,"id": $id,"last_modified": $last_modified,"last_touched": $last_touched,"replies": $replies,"content": ${content !=
        null
        ? '${json.encode(content)}'
        : 'null'},"content_rendered": ${content_rendered != null ? '${json
        .encode(content_rendered)}' : 'null'},"title": ${title != null ? '${json
        .encode(title)}' : 'null'},"url": ${url != null
        ? '${json.encode(url)}'
        : 'null'},"member": $member,"node": $node}';
  }
}

class Node {
  int id;
  int topics;
  String avatar_large;
  String avatar_mini;
  String avatar_normal;
  String name;
  String title;
  String title_alternative;
  String url;

  Node.fromParams(
      {this.id,
      this.topics,
      this.avatar_large,
      this.avatar_mini,
      this.avatar_normal,
      this.name,
      this.title,
      this.title_alternative,
      this.url});

  Node.fromJson(jsonRes) {
    id = jsonRes['id'];
    topics = jsonRes['topics'];
    avatar_large = jsonRes['avatar_large'];
    avatar_mini = jsonRes['avatar_mini'];
    avatar_normal = jsonRes['avatar_normal'];
    name = jsonRes['name'];
    title = jsonRes['title'];
    title_alternative = jsonRes['title_alternative'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"id": $id,"topics": $topics,"avatar_large": ${avatar_large != null
        ? '${json.encode(avatar_large)}'
        : 'null'},"avatar_mini": ${avatar_mini != null ? '${json.encode(
        avatar_mini)}' : 'null'},"avatar_normal": ${avatar_normal != null
        ? '${json.encode(avatar_normal)}'
        : 'null'},"name": ${name != null
        ? '${json.encode(name)}'
        : 'null'},"title": ${title != null
        ? '${json.encode(title)}'
        : 'null'},"title_alternative": ${title_alternative != null ? '${json
        .encode(title_alternative)}' : 'null'},"url": ${url != null ? '${json
        .encode(url)}' : 'null'}}';
  }
}
