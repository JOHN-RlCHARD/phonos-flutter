import 'dart:convert';
import 'dart:io';
import 'package:app_fono/api/models/access_token.dart';
import 'package:app_fono/api/models/agendamento.dart';
import 'package:app_fono/api/models/fono.dart';
import 'package:app_fono/api/models/paciente.dart';
import 'package:app_fono/screens/consultas.dart';
import 'package:app_fono/variables/globals.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'models/atividade.dart';

class ApiService {
  final String url = "http://" + IP_HOST + ":3000";

  Future<Paciente?> getPacienteByToken(
      String userToken, String accessToken) async {
    final pacienteUri = Uri.parse('$url/pacientes/${userToken}');
    var res = null;

    try {
      res = await http.get(pacienteUri,
          headers: {"Authorization": "Bearer ${accessToken}"});
    } catch (e) {
      return res;
    }

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      var paciente = Paciente.fromMap(data);
      return paciente;
    } else {
      return null;
    }
  }

  Future<String?> logIn(String token, String password) async {
    final uri = Uri.parse('$url/authpaciente/login');
    var res = null;

    try {
      res = await http.post(uri, body: {'token': token, 'password': password});
    } catch (e) {
      return res;
    }

    if (res.statusCode == 201) {
      final data = jsonDecode(res.body);
      var accesstoken = AccessToken.fromMap(data);
      return accesstoken.access_token;
    } else
      return null;
  }

  Future putFirstLogin(
      String userToken, String password, String accessToken) async {
    final uri = Uri.parse('$url/pacientes/${userToken}');

    final res = await http.put(uri, body: {
      'password': password,
      'firstLogin': 'false',
    }, headers: {
      "Authorization": "Bearer ${accessToken}"
    });
  }

  Future changeAvatar(
      String userToken, String avatar, String accessToken) async {
    final uri = Uri.parse('$url/pacientes/${userToken}');

    final res = await http.put(uri, body: {
      'img': avatar,
    }, headers: {
      "Authorization": "Bearer ${accessToken}"
    });
  }

  Future<List<Agendamento>?> getAgendamentos(
      String userToken, String accessToken) async {
    final uri = Uri.parse('$url/agendamentos/filterpaciente/${userToken}');

    final res = await http
        .get(uri, headers: {"Authorization": "Bearer ${accessToken}"});

    final data = jsonDecode(res.body);
    final agendamentos =
        List<Agendamento>.from(data.map((cat) => Agendamento.fromMap(cat)));

    return agendamentos;
  }

  Future<List<Atividade>?> getAtividades(
      String userToken, String accessToken) async {
    final uri = Uri.parse('$url/atividades/filterpaciente/${userToken}');

    final res = await http
        .get(uri, headers: {"Authorization": "Bearer ${accessToken}"});

    final data = jsonDecode(res.body);
    final atividades =
        List<Atividade>.from(data.map((cat) => Atividade.fromMap(cat)));

    return atividades;
  }

  Future<Fono?> getFonoByCrfa(String crfa, String accessToken) async {
    final fonoUri = Uri.parse('$url/fonos/${crfa}');
    final res = await http
        .get(fonoUri, headers: {"Authorization": "Bearer ${accessToken}"});

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      var fono = Fono.fromMap(data);
      return fono;
    } else {
      return null;
    }
  }
}
