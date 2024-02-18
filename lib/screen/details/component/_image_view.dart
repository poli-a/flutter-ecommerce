import 'package:flutter/material.dart';

Container showImageView(BuildContext context, manga) {
  var screenSize = MediaQuery.of(context).size;
  var screenHeight = (screenSize.height);
  print("URL de la imagen: ${manga.imagen}");
  return Container(
    padding: const EdgeInsets.all(20),
    color: Colors.lightBlue.shade500,
    child: Image.network(manga.imagen),
  );
}
