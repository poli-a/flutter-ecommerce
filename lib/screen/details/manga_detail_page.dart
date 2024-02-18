import 'package:flutter/material.dart';

import '../../constant.dart';
import '../../models/Manga.dart';
import 'component/_build_app_bar.dart';
import 'component/_build_cart_btn.dart';
import 'component/_image_view.dart';
import 'component/_row_price_rating.dart';

class MangaDetail extends StatelessWidget {
  const MangaDetail({
    Key? key,
    required this.manga,
  }) : super(key: key);

  final Manga manga;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: detailAppBar(manga),
      body: Stack(
        children: [
          showImageView(context, manga),
          const SizedBox(height: kSpace),
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //buildRowPriceRating(manga),
                const SizedBox(height: kSpace),
                Text(
                  manga.titulo,
                  textAlign: TextAlign.justify,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 16.0, color: Colors.white),
                  maxLines: 5,
                ),
                const SizedBox(height: 20),
                Center(child: btnAddToCart(context, manga)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
