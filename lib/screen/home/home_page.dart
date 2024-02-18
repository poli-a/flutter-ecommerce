import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';
import 'package:flutter_ecommerce_app/screen/home/components/_body.dart';
import '../../services/manga_services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Manga>>(
      future: getMangas(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final List<Manga>? mangas = snapshot.data;
          return Scaffold(
            backgroundColor: Colors.grey.shade700,
            body: SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double padding = screenWidth * 0.1;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: detailBody(mangas ?? [], context),
                  );
                },
              ),
            ),
          );
        }
      },
    );
  }
}
