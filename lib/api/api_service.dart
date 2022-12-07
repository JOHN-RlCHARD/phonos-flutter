import 'dart:convert';
import 'dart:io';
import 'package:app_fono/api/models/paciente.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String url = "http://192.168.0.15:3000";

  Future<List<Paciente>> getPacientes() async {
    final pacienteUri = Uri.parse('$url/pacientes');
    final res = await http.get(pacienteUri);

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      return List<Paciente>.from(data.map((cat)=>Paciente.fromMap(cat)));
    } else {
      return List<Paciente>.empty();
    }

  }

  Future<Paciente?> getPacienteByToken(String userToken) async {
    final pacienteUri = Uri.parse('$url/pacientes/${userToken}');
    final res = await http.get(pacienteUri);

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      var pacientes = List<Paciente>.from(data.map((cat)=>Paciente.fromMap(cat)));
      if (!pacientes.isEmpty) {
        Paciente paciente = pacientes[0];
        return paciente;
      } else return null;
    } else {
      return null;
    }

  }

  Future putFirstLogin(String userToken, String password) async {
    final uri = Uri.parse('$url/pacientes/${userToken}');

      final res = await http.put(
      uri,
      body: {
        'password': password,
        'firstLogin': 'false',
      },
      
    );
  }

  Future changeAvatar(String userToken, String avatar) async {
    final uri = Uri.parse('$url/pacientes/${userToken}');

      final res = await http.put(
      uri,
      body: {
        'img': avatar,
      },
      
    );
  }

}