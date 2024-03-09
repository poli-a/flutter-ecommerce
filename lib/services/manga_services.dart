import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';
import 'dart:developer';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Manga>> getMangas() async {
  List<Manga> mangas = [];
  CollectionReference collectionReferenceMangas = db.collection('mangas');
  QuerySnapshot queryMangas = await collectionReferenceMangas.limit(30).get();
  log(mangas.toString());
  for (var element in queryMangas.docs) {
    var data = element.data();
    Manga manga = Manga.fromJson(data as Map<String, dynamic>, element);
    mangas.add(manga);
  }
  return mangas;
}

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

class MangaService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<List<Manga>> getMangas(
      int pageSize, DocumentSnapshot? startAfter) async {
    Query query = _db.collection('mangas').limit(pageSize);

    if (startAfter != null) {
      query = query.startAfterDocument(startAfter);
    }

    QuerySnapshot queryMangas = await query.get();

    List<Manga> mangas = [];

    for (var element in queryMangas.docs) {
      var data = element.data();
      Manga manga = Manga.fromJson(data as Map<String, dynamic>, element);

      mangas.add(manga);
    }

    return mangas;
  }
}*/
