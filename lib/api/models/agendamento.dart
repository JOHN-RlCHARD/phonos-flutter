import 'dart:convert';

class Agendamento {
  final String id;
  final String data;
  final String hora;
  final String paciente;
  final String tipo;
  final String status;
  final String endereco;
  final int v;
  Agendamento({
    required this.id,
    required this.data,
    required this.hora,
    required this.paciente,
    required this.tipo,
    required this.status,
    required this.endereco,
    required this.v,
  });

  Agendamento copyWith({
    String? id,
    String? data,
    String? hora,
    String? paciente,
    String? tipo,
    String? status,
    String? endereco,
    int? v,
  }) {
    return Agendamento(
      id: id ?? this.id,
      data: data ?? this.data,
      hora: hora ?? this.hora,
      paciente: paciente ?? this.paciente,
      tipo: tipo ?? this.tipo,
      status: status ?? this.status,
      endereco: endereco ?? this.endereco,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'data': data,
      'hora': hora,
      'paciente': paciente,
      'tipo': tipo,
      'status': status,
      'endereco': endereco,
      'v': v,
    };
  }

  factory Agendamento.fromMap(Map<String, dynamic> map) {
    return Agendamento(
      id: map['_id'] as String,
      data: map['data'] as String,
      hora: map['hora'] as String,
      paciente: map['paciente'] as String,
      tipo: map['tipo'] as String,
      status: map['status'] as String,
      endereco: map['endereco'] as String,
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Agendamento.fromJson(String source) => Agendamento.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Agendamento(id: $id, data: $data, hora: $hora, paciente: $paciente, tipo: $tipo, status: $status, endereco: $endereco, v: $v)';
  }

  @override
  bool operator ==(covariant Agendamento other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.data == data &&
      other.hora == hora &&
      other.paciente == paciente &&
      other.tipo == tipo &&
      other.status == status &&
      other.endereco == endereco &&
      other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      data.hashCode ^
      hora.hashCode ^
      paciente.hashCode ^
      tipo.hashCode ^
      status.hashCode ^
      endereco.hashCode ^
      v.hashCode;
  }
}
