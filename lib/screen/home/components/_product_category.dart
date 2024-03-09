import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screen/home/components/_body.dart';
import '../../details/manga_detail_page.dart';
import 'package:get/get.dart';

import '_build_category_card.dart';
import '_build_popular_card.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';

class MostPopularCategory extends StatefulWidget {
  final List<Manga> mangas;
  final LoadMoreCallback loadMoreCallback;

  const MostPopularCategory({
    Key? key,
    required this.mangas,
    required this.loadMoreCallback,
  }) : super(key: key);

  @override
  _MostPopularCategoryState createState() => _MostPopularCategoryState();
}

class _MostPopularCategoryState extends State<MostPopularCategory> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      // Llegaste al final del scroll, carga más mangas
      // Aquí debes cargar más mangas en tu lista de mangas
      // Puedes hacer una petición a tu API o cargar datos locales
      // Por ejemplo, puedes llamar a una función como _loadMoreMangas()
      print("scroll");
      widget.loadMoreCallback();
    }
  }

  void _loadMoreMangas() {
    // Aquí deberías cargar más mangas a tu lista de mangas
    // Por ejemplo:
    // setState(() {
    //   widget.mangas.addAll(nuevasMangas);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: _scrollController,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemCount: widget.mangas.length,
      itemBuilder: (context, index) => buildCard(context, widget.mangas[index]),
    );
  }
}

/*import 'package:flutter/material.dart';
import '../../details/manga_detail_page.dart';
import 'package:get/get.dart';

import '_build_category_card.dart';
import '_build_popular_card.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';

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

double getResponsivePadding(BuildContext context) {
  // Obtener el ancho de la pantalla
  double screenWidth = MediaQuery.of(context).size.width;
  // Definir el espaciado en relación con el ancho de la pantalla
  double defaultPadding =
      screenWidth * 0.02; // Por ejemplo, 5% del ancho de la pantalla
  return defaultPadding;
}*/

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
