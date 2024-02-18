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
    Manga manga = Manga.fromJson(data as Map<String, dynamic>);
    mangas.add(manga);
  }
  return mangas;
}

/*import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';
import 'dart:developer';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List<Manga>> getMangas(
    int pageSize, DocumentSnapshot? startAfter) async {
  List<Manga> mangas = [];
  Query query = db.collection('mangas').orderBy('createdAt').limit(pageSize);

  if (startAfter != null) {
    query = query.startAfterDocument(startAfter);
  }

  QuerySnapshot queryMangas = await query.get();
  log(mangas.toString());

  for (var element in queryMangas.docs) {
    var data = element.data();
    Manga manga = Manga.fromJson(data as Map<String, dynamic>);
    mangas.add(manga);
  }

  return mangas;
}
*/