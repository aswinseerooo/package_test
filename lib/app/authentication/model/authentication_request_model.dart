import 'dart:convert';
/// client_id : "SGD_test_a0aefba9-5ffe-4661-8ef0-6b332371fe66"
/// client_secrete : "SGD_test_a8e77599-9242-44f7-9a0d-4321a7ccbd5e"

AuthenticationRequestModel authenticationRequestModelFromJson(String str) => AuthenticationRequestModel.fromJson(json.decode(str));
String authenticationRequestModelToJson(AuthenticationRequestModel data) => json.encode(data.toJson());
class AuthenticationRequestModel {
  AuthenticationRequestModel({
      String? clientId, 
      String? clientSecrete,}){
    _clientId = clientId;
    _clientSecrete = clientSecrete;
}

  AuthenticationRequestModel.fromJson(dynamic json) {
    _clientId = json['client_id'];
    _clientSecrete = json['client_secrete'];
  }
  String? _clientId;
  String? _clientSecrete;
AuthenticationRequestModel copyWith({  String? clientId,
  String? clientSecrete,
}) => AuthenticationRequestModel(  clientId: clientId ?? _clientId,
  clientSecrete: clientSecrete ?? _clientSecrete,
);
  String? get clientId => _clientId;
  String? get clientSecrete => _clientSecrete;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['client_id'] = _clientId;
    map['client_secrete'] = _clientSecrete;
    return map;
  }

}