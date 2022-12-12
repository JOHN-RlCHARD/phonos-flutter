// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AccessToken {
  final String access_token;
  AccessToken({
    required this.access_token,
  });

  

  AccessToken copyWith({
    String? access_token,
  }) {
    return AccessToken(
      access_token: access_token ?? this.access_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
    };
  }

  factory AccessToken.fromMap(Map<String, dynamic> map) {
    return AccessToken(
      access_token: map['access_token'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccessToken.fromJson(String source) => AccessToken.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AccessToken(access_token: $access_token)';

  @override
  bool operator ==(covariant AccessToken other) {
    if (identical(this, other)) return true;
  
    return 
      other.access_token == access_token;
  }

  @override
  int get hashCode => access_token.hashCode;
}
