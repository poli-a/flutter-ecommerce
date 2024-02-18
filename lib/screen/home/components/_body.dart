import 'package:flutter/material.dart';
import '../../../constant.dart';
//import '../../../models/Product.dart';
import '../../../models/Manga.dart';
import '_action_bar.dart';
import '_categories.dart';
import '_product_category.dart';
import '_search_filter_view.dart';

Column detailBody(List<Manga> mangas, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildActionBar(),
      const SizedBox(height: kSpace),
      buildSearchRow(),
      const SizedBox(height: kSpace),
      section('Categories'),
      const SizedBox(height: kSpace),
      /*SizedBox(
        height: 140,
        child: category(products),
      ),*/
      const SizedBox(height: kSpace),
      section('Most popular'),
      const SizedBox(height: kSpace),
      Expanded(child: mostPopularCategory(context, mangas))
    ],
  );
}
/*import 'package:flutter/material.dart';
import '../../../constant.dart';
import '../../../models/Manga.dart';
import '_action_bar.dart';
import '_categories.dart';
import '_product_category.dart';
import '_search_filter_view.dart';

Column detailBody(List<Manga> mangas, BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      buildActionBar(),
      const SizedBox(height: kSpace),
      buildSearchRow(),
      const SizedBox(height: kSpace),
      section('Categories'),
      const SizedBox(height: kSpace),
      // SizedBox(
      //   height: 140,
      //   child: category(products),
      // ),
      const SizedBox(height: kSpace),
      section('Most popular'),
      const SizedBox(height: kSpace),
      Expanded(child: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double itemWidth = screenWidth * 0.3; // Ajusta según sea necesario
          return mostPopularCategory(context, mangas, itemWidth);
        },
      ))
    ],
  );
}*/
