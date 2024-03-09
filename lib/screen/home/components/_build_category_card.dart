import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screen/details/manga_detail_page.dart';
import '../../../components/_star_rating.dart' show showStarRating;
import '../../../models/Manga.dart';
import '../../../models/Product.dart';
import 'package:get/get.dart';

Widget buildCard(BuildContext context, Manga manga) {
  double screenWidth = MediaQuery.of(context).size.width;
  double cardWidth = screenWidth * 0.35; // Reducir el ancho de la tarjeta
  return GestureDetector(
    onTap: () => Get.to(MangaDetail(manga: manga)),
    child: Padding(
      padding: const EdgeInsets.all(2),
      child: Card(
        elevation: 4,
        child: Container(
          width: cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: imageIcon(manga),
                ),
              ),
              _buildPriceRating(manga),
            ],
          ),
        ),
      ),
    ),
  );
}

Padding _buildPriceRating(Manga manga) {
  return Padding(
    padding: const EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titlePrice(manga),
        SizedBox(height: 8)
        //showStarRating(3.0, product.color)
      ],
    ),
  );
}

Text description(Product product) {
  return Text(
    product.description,
    maxLines: 2,
  );
}

Row _titlePrice(Manga manga) {
  return Row(
    children: [
      Text(
        manga.titulo,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      const Spacer(),
      const Text(
        '\$ 500',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      )
    ],
  );
}

Image imageIcon(Manga manga) {
  return Image.network(
    manga.imagen,
    fit: BoxFit.contain,
  );
}

/*buildCard(Manga manga) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
      elevation: 4,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: imageIcon(manga),
              ),
            ),
            _buildPriceRating(manga),
          ],
        ),
      ),
    ),
  );
}*/