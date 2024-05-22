import 'dart:convert';
/// status : 200
/// message : "Data retrieve successfully."
/// data : {"access_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lWm9uZSI6IkFzaWEvS29sa2F0YSIsImlhdCI6MTcxNjI5NDEwMCwiZXhwIjoxNzE2Mjk1MDAwfQ.D4aVfGaVcF_qC14aNzGSQGnuIFNTRxPmsTaMC4Sp9JI","refresh_token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lWm9uZSI6IkFzaWEvS29sa2F0YSIsImlhdCI6MTcxNjI5NDEwMCwiZXhwIjoxNzE2ODk4OTAwfQ.nLzOoVi1c7oAbbH5wbXZ_JReLI8G93Rp4zJo7ShljxU"}

RefreshTokenModel refreshTokenModelFromJson(String str) => RefreshTokenModel.fromJson(json.decode(str));
String refreshTokenModelToJson(RefreshTokenModel data) => json.encode(data.toJson());
class RefreshTokenModel {
  RefreshTokenModel({
      num? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  RefreshTokenModel.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  num? _status;
  String? _message;
  Data? _data;
RefreshTokenModel copyWith({  num? status,
  String? message,
  Data? data,
}) => RefreshTokenModel(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  num? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// access_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lWm9uZSI6IkFzaWEvS29sa2F0YSIsImlhdCI6MTcxNjI5NDEwMCwiZXhwIjoxNzE2Mjk1MDAwfQ.D4aVfGaVcF_qC14aNzGSQGnuIFNTRxPmsTaMC4Sp9JI"
/// refresh_token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0aW1lWm9uZSI6IkFzaWEvS29sa2F0YSIsImlhdCI6MTcxNjI5NDEwMCwiZXhwIjoxNzE2ODk4OTAwfQ.nLzOoVi1c7oAbbH5wbXZ_JReLI8G93Rp4zJo7ShljxU"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      String? accessToken, 
      String? refreshToken,}){
    _accessToken = accessToken;
    _refreshToken = refreshToken;
}

  Data.fromJson(dynamic json) {
    _accessToken = json['access_token'];
    _refreshToken = json['refresh_token'];
  }
  String? _accessToken;
  String? _refreshToken;
Data copyWith({  String? accessToken,
  String? refreshToken,
}) => Data(  accessToken: accessToken ?? _accessToken,
  refreshToken: refreshToken ?? _refreshToken,
);
  String? get accessToken => _accessToken;
  String? get refreshToken => _refreshToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['access_token'] = _accessToken;
    map['refresh_token'] = _refreshToken;
    return map;
  }

}