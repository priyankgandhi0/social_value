import 'dart:convert';

ResponseItem responseItemFromJson(String str) =>
    ResponseItem.fromJson(json.decode(str));

String responseItemToJson(ResponseItem data) => json.encode(data.toJson());

class ResponseItem {
  ResponseItem({
    this.data,
    required this.message,
    required this.status,
    this.fullData,
    this.isVerify,
    this.forceLogout,
  });
  dynamic data;
  dynamic fullData;
  String message;
  String status;
  bool? isVerify;
  bool? forceLogout = false;

  factory ResponseItem.fromJson(Map<String, dynamic> json) => ResponseItem(
        data: json["data"],
        fullData: json,
        message: json["msg"],
        status: json["status"],
        isVerify: (json["is_verify"] ?? 1) == 1,
        forceLogout: json["force_logout"] == 1,
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "msg": message,
        "fullData": fullData,
        "status": status,
        "force_logout": forceLogout,
        "is_verify": isVerify
      };
}
