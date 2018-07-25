import 'dart:convert' show json;

class BaseResp {
  String message;
  String status;
  RateLimit rate_limit;

  BaseResp.fromParams({this.message, this.status, this.rate_limit});

  factory BaseResp(jsonStr) => jsonStr is String
      ? BaseResp.fromJson(json.decode(jsonStr))
      : BaseResp.fromJson(jsonStr);

  BaseResp.fromJson(jsonRes) {
    try {
      message = jsonRes['message'];
      status = jsonRes['status'];
      rate_limit = new RateLimit.fromJson(jsonRes['rate_limit']);
    } catch (e) {
      e.toString();
    }
  }

  @override
  String toString() {
    return '{"message": ${message != null
        ? '${json.encode(message)}'
        : 'null'},"status": ${status != null
        ? '${json.encode(status)}'
        : 'null'},"rate_limit": $rate_limit}';
  }
}

class RateLimit {
  int hourly_quota;
  int hourly_remaining;
  int used;

  RateLimit.fromParams({this.hourly_quota, this.hourly_remaining, this.used});

  RateLimit.fromJson(jsonRes) {
    try {
      hourly_quota = jsonRes['hourly_quota'];
      hourly_remaining = jsonRes['hourly_remaining'];
      used = jsonRes['used'];
    } catch (e) {
      e.toString();
    }
  }

  @override
  String toString() {
    return '{"hourly_quota": $hourly_quota,"hourly_remaining": $hourly_remaining,"used": $used}';
  }
}
