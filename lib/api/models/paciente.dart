// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Paciente {
  final String id;
  final String fname;
  final String lname;
  final String img;
  final String bday;
  final String condicao;
  final String password;
  final List<dynamic> fonos;
  final String token;
  final bool firstLogin;
  final int v;
  Paciente({
    required this.id,
    required this.fname,
    required this.lname,
    required this.img,
    required this.bday,
    required this.condicao,
    required this.password,
    required this.fonos,
    required this.token,
    required this.firstLogin,
    required this.v,
  });
  

  Paciente copyWith({
    String? id,
    String? fname,
    String? lname,
    String? img,
    String? bday,
    String? condicao,
    String? password,
    List<dynamic>? fonos,
    String? token,
    bool? firstLogin,
    int? v,
  }) {
    return Paciente(
      id: id ?? this.id,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      img: img ?? this.img,
      bday: bday ?? this.bday,
      condicao: condicao ?? this.condicao,
      password: password ?? this.password,
      fonos: fonos ?? this.fonos,
      token: token ?? this.token,
      firstLogin: firstLogin ?? this.firstLogin,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'fname': fname,
      'lname': lname,
      'img': img,
      'bday': bday,
      'condicao': condicao,
      'password': password,
      'fonos': fonos,
      'token': token,
      'firstLogin': firstLogin,
      'v': v,
    };
  }

  factory Paciente.fromMap(Map<String, dynamic> map) {
    return Paciente(
      id: map['_id'] as String,
      fname: map['fname'] as String,
      lname: map['lname'] as String,
      img: map['img'] as String,
      bday: map['bday'] as String,
      condicao: map['condicao'] as String,
      password: map['password'] as String,
      fonos: List<dynamic>.from((map['fonos'] as List<dynamic>)),
      token: map['token'] as String,
      firstLogin: map['firstLogin'] as bool,
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Paciente.fromJson(String source) => Paciente.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Paciente(id: $id, fname: $fname, lname: $lname, img: $img, bday: $bday, condicao: $condicao, password: $password, fonos: $fonos, token: $token, firstLogin: $firstLogin, v: $v)';
  }

  @override
  bool operator ==(covariant Paciente other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.fname == fname &&
      other.lname == lname &&
      other.img == img &&
      other.bday == bday &&
      other.condicao == condicao &&
      other.password == password &&
      listEquals(other.fonos, fonos) &&
      other.token == token &&
      other.firstLogin == firstLogin &&
      other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      img.hashCode ^
      bday.hashCode ^
      condicao.hashCode ^
      password.hashCode ^
      fonos.hashCode ^
      token.hashCode ^
      firstLogin.hashCode ^
      v.hashCode;
  }
}
