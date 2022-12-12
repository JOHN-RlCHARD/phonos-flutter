// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class Fono {
  String id;
  String crfa;
  String fname;
  String lname;
  String img;
  String email;
  String password;
  List<dynamic> pacientes;
  int v;
  Fono({
    required this.id,
    required this.crfa,
    required this.fname,
    required this.lname,
    required this.img,
    required this.email,
    required this.password,
    required this.pacientes,
    required this.v,
  });

  Fono copyWith({
    String? id,
    String? crfa,
    String? fname,
    String? lname,
    String? img,
    String? email,
    String? password,
    List<String>? pacientes,
    int? v,
  }) {
    return Fono(
      id: id ?? this.id,
      crfa: crfa ?? this.crfa,
      fname: fname ?? this.fname,
      lname: lname ?? this.lname,
      img: img ?? this.img,
      email: email ?? this.email,
      password: password ?? this.password,
      pacientes: pacientes ?? this.pacientes,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'crfa': crfa,
      'fname': fname,
      'lname': lname,
      'img': img,
      'email': email,
      'password': password,
      'pacientes': pacientes,
      'v': v,
    };
  }

  factory Fono.fromMap(Map<String, dynamic> map) {
    return Fono(
      id: map['_id'] as String,
      crfa: map['crfa'] as String,
      fname: map['fname'] as String,
      lname: map['lname'] as String,
      img: map['img'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      pacientes: List<dynamic>.from((map['pacientes'] as List<dynamic>)),
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Fono.fromJson(String source) => Fono.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Fono(id: $id, crfa: $crfa, fname: $fname, lname: $lname, img: $img, email: $email, password: $password, pacientes: $pacientes, v: $v)';
  }

  @override
  bool operator ==(covariant Fono other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.crfa == crfa &&
      other.fname == fname &&
      other.lname == lname &&
      other.img == img &&
      other.email == email &&
      other.password == password &&
      listEquals(other.pacientes, pacientes) &&
      other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      crfa.hashCode ^
      fname.hashCode ^
      lname.hashCode ^
      img.hashCode ^
      email.hashCode ^
      password.hashCode ^
      pacientes.hashCode ^
      v.hashCode;
  }
}
