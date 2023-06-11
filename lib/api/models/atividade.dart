import 'dart:convert';

class Atividade {
  final String id;
  final String titulo;
  final String entrega;
  final String isEntregue;
  final String descricao;
  final String feedback;
  final String arquivoPath;
  final String fono;
  final String paciente;
  final int v;
  Atividade({
    required this.id,
    required this.titulo,
    required this.entrega,
    required this.isEntregue,
    required this.descricao,
    required this.feedback,
    required this.arquivoPath,
    required this.fono,
    required this.paciente,
    required this.v,
  });

  Atividade copyWith({
    String? id,
    String? titulo,
    String? entrega,
    String? isEntregue,
    String? descricao,
    String? feedback,
    String? arquivoPath,
    String? fono,
    String? paciente,
    int? v,
  }) {
    return Atividade(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      entrega: entrega ?? this.entrega,
      isEntregue: isEntregue ?? this.isEntregue,
      descricao: descricao ?? this.descricao,
      feedback: feedback ?? this.feedback,
      arquivoPath: arquivoPath ?? this.arquivoPath,
      fono: fono ?? this.fono,
      paciente: paciente ?? this.paciente,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'titulo': titulo,
      'entrega': entrega,
      'isEntregue': isEntregue,
      'descricao': descricao,
      'feedback': feedback,
      'arquivoPath': arquivoPath,
      'fono': fono,
      'paciente': paciente,
      'v': v,
    };
  }

  factory Atividade.fromMap(Map<String, dynamic> map) {
    return Atividade(
      id: map['_id'] as String,
      titulo: map['titulo'] as String,
      entrega: map['entrega'] as String,
      isEntregue: map['isEntregue'] as String,
      descricao: map['descricao'] as String,
      feedback: map['feedback'] as String,
      arquivoPath: map['arquivoPath'] as String,
      fono: map['fono'] as String,
      paciente: map['paciente'] as String,
      v: map['__v'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Atividade.fromJson(String source) =>
      Atividade.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Atividade(id: $id, titulo: $titulo, entrega: $entrega, isEntregue: $isEntregue, descricao: $descricao, feedback: $feedback, arquivoPath: $arquivoPath, fono: $fono, paciente: $paciente, v: $v)';
  }

  @override
  bool operator ==(covariant Atividade other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.titulo == titulo &&
        other.entrega == entrega &&
        other.isEntregue == isEntregue &&
        other.descricao == descricao &&
        other.feedback == feedback &&
        other.arquivoPath == arquivoPath &&
        other.fono == fono &&
        other.paciente == paciente &&
        other.v == v;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        titulo.hashCode ^
        entrega.hashCode ^
        isEntregue.hashCode ^
        descricao.hashCode ^
        feedback.hashCode ^
        arquivoPath.hashCode ^
        fono.hashCode ^
        paciente.hashCode ^
        v.hashCode;
  }
}
