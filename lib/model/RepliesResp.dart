import 'dart:convert' show json;

import 'package:flutter_app/model/BaseResp.dart';
import 'package:flutter_app/model/MemberResp.dart';

class RepliesResp extends BaseResp {
  List<Reply> list;

  RepliesResp.fromParams(
      {this.list, String message, String status, RateLimit rateLimit})
      : super.fromParams(
            message: message, status: status, rate_limit: rateLimit);

  factory RepliesResp(jsonStr) => jsonStr is String
      ? RepliesResp.fromJson(json.decode(jsonStr))
      : RepliesResp.fromJson(jsonStr);

  RepliesResp.fromJson(jsonRes) : super.fromJson(jsonRes) {
    list = [];

    for (var listItem in jsonRes) {
      list.add(new Reply.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"json_list": $list}';
  }
}

class Reply {
  int created;
  int id;
  int last_modified;
  int last_touched;
  int replies;
  String content;
  String content_rendered;
  String last_reply_by;
  String title;
  String url;
  Member member;
  Node node;

  Reply.fromParams(
      {this.created,
      this.id,
      this.last_modified,
      this.last_touched,
      this.replies,
      this.content,
      this.content_rendered,
      this.last_reply_by,
      this.title,
      this.url,
      this.member,
      this.node});

  Reply.fromJson(jsonRes) {
    created = jsonRes['created'];
    id = jsonRes['id'];
    last_modified = jsonRes['last_modified'];
    last_touched = jsonRes['last_touched'];
    replies = jsonRes['replies'];
    content = jsonRes['content'];
    content_rendered = jsonRes['content_rendered'];
    last_reply_by = jsonRes['last_reply_by'];
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
        : 'null'},"content_rendered": ${content_rendered != null
        ? '${json.encode(content_rendered)}'
        : 'null'},"last_reply_by": ${last_reply_by != null ? '${json.encode(
        last_reply_by)}' : 'null'},"title": ${title != null ? '${json.encode(
        title)}' : 'null'},"url": ${url != null
        ? '${json.encode(url)}'
        : 'null'},"member": $member,"node": $node}';
  }
}

class Node {
  int id;
  int stars;
  int topics;
  bool root;
  String avatar_large;
  String avatar_mini;
  String avatar_normal;
  String footer;
  String header;
  String name;
  String parent_node_name;
  String title;
  String title_alternative;
  String url;

  Node.fromParams(
      {this.id,
      this.stars,
      this.topics,
      this.root,
      this.avatar_large,
      this.avatar_mini,
      this.avatar_normal,
      this.footer,
      this.header,
      this.name,
      this.parent_node_name,
      this.title,
      this.title_alternative,
      this.url});

  Node.fromJson(jsonRes) {
    id = jsonRes['id'];
    stars = jsonRes['stars'];
    topics = jsonRes['topics'];
    root = jsonRes['root'];
    avatar_large = jsonRes['avatar_large'];
    avatar_mini = jsonRes['avatar_mini'];
    avatar_normal = jsonRes['avatar_normal'];
    footer = jsonRes['footer'];
    header = jsonRes['header'];
    name = jsonRes['name'];
    parent_node_name = jsonRes['parent_node_name'];
    title = jsonRes['title'];
    title_alternative = jsonRes['title_alternative'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"id": $id,"stars": $stars,"topics": $topics,"root": $root,"avatar_large": ${avatar_large !=
        null
        ? '${json.encode(avatar_large)}'
        : 'null'},"avatar_mini": ${avatar_mini != null ? '${json.encode(
        avatar_mini)}' : 'null'},"avatar_normal": ${avatar_normal != null
        ? '${json.encode(avatar_normal)}'
        : 'null'},"footer": ${footer != null
        ? '${json.encode(footer)}'
        : 'null'},"header": ${header != null
        ? '${json.encode(header)}'
        : 'null'},"name": ${name != null
        ? '${json.encode(name)}'
        : 'null'},"parent_node_name": ${parent_node_name != null ? '${json
        .encode(parent_node_name)}' : 'null'},"title": ${title != null ? '${json
        .encode(title)}' : 'null'},"title_alternative": ${title_alternative !=
        null ? '${json.encode(title_alternative)}' : 'null'},"url": ${url !=
        null ? '${json.encode(url)}' : 'null'}}';
  }
}
