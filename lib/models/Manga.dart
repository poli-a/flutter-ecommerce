import 'package:cloud_firestore/cloud_firestore.dart';

class Manga {
  String descripcion;
  String edadRecomendada;
  String estado;
  DateTime fechaCreacion;
  DateTime fechaFinalizacion;
  String guiaParaPublico;
  String imagen;
  String slug;
  String subtipo;
  String titulo;
  List<String> tituloAbreviado;
  int tomo;
  final DocumentSnapshot? documentSnapshot;

  Manga({
    required this.descripcion,
    required this.edadRecomendada,
    required this.estado,
    required this.fechaCreacion,
    required this.fechaFinalizacion,
    required this.guiaParaPublico,
    required this.imagen,
    required this.slug,
    required this.subtipo,
    required this.titulo,
    required this.tituloAbreviado,
    required this.tomo,
    required this.documentSnapshot,
  });

  static Manga fromJson(
      Map<String, dynamic> json, DocumentSnapshot? documentSnapshot) {
    return Manga(
      descripcion: json['descripcion'] ?? '',
      edadRecomendada: json['edadRecomendada'] ?? '',
      estado: json['estado'] ?? '',
      // Parsear las fechas de string a DateTime
      fechaCreacion:
          DateTime.tryParse(json['fechaCreacion'] ?? '') ?? DateTime.now(),
      fechaFinalizacion:
          DateTime.tryParse(json['fechaFinalizacion'] ?? '') ?? DateTime.now(),
      guiaParaPublico: json['guiaParaPublico'] ?? '',
      imagen: json['imagen'] ?? '',
      slug: json['slug'] ?? '',
      subtipo: json['subtipo'] ?? '',
      titulo: json['titulo'] ?? '',
      tituloAbreviado: List<String>.from(json['tituloAbreviado'] ?? []),
      tomo: json['tomo'] ?? 0,
      documentSnapshot: documentSnapshot,
    );
  }
}
