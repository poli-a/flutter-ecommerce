import 'package:flutter/material.dart';
import '../../details/manga_detail_page.dart';
import 'package:get/get.dart';

import '_build_category_card.dart';
import '_build_popular_card.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';

ListView category(productList) {
  return ListView.builder(
      padding: const EdgeInsets.only(left: 0),
      itemCount: productList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => {Get.to(MangaDetail)},
          child: buildPopularCard(productList[index]),
        );
      });
}

/*GridView mostPopularCategory(context, mangas) {
  return GridView.count(
    crossAxisCount: 5,
    children: List.generate(mangas.length, (index) {
      return GestureDetector(
        onTap: () => Get.to(MangaDetail(manga: mangas[index])),
        child: buildCard(mangas[index]),
      );
    }),
  );
}*/
GridView mostPopularCategory(BuildContext context, List<Manga> mangas) {
  return GridView.builder(
    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300, // Establece el ancho máximo de cada elemento
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      childAspectRatio: 0.75,
    ),
    itemCount: mangas.length,
    itemBuilder: (context, index) => buildCard(context, mangas[index]),
  );
}

double getResponsivePadding(BuildContext context) {
  // Obtener el ancho de la pantalla
  double screenWidth = MediaQuery.of(context).size.width;
  // Definir el espaciado en relación con el ancho de la pantalla
  double defaultPadding =
      screenWidth * 0.02; // Por ejemplo, 5% del ancho de la pantalla
  return defaultPadding;
}
