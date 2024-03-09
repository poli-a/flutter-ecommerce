import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/Manga.dart';
import 'package:flutter_ecommerce_app/screen/home/components/_body.dart';
import '../../services/manga_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Manga> _mangas;
  late bool _isLoading;

  @override
  void initState() {
    super.initState();
    _mangas = [];
    _isLoading = true;
    _loadMangas();
  }

  Future<void> _loadMangas() async {
    try {
      final mangas = await getMangas();
      setState(() {
        _mangas.addAll(mangas);
        _isLoading = false;
      });
    } catch (error) {
      print('Error loading mangas: $error');
      // Manejar errores de carga de mangas
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _loadMoreMangas() async {
    _loadMangas();
    // Puedes cargar más mangas aquí si es necesario
    // Por ejemplo, puedes llamar a _loadMangas() nuevamente
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade700,
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  double screenWidth = constraints.maxWidth;
                  double padding = screenWidth * 0.1;
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: detailBody(_mangas, context, _loadMoreMangas),
                  );
                },
              ),
            ),
    );
  }
}

/*import 'package:flutter/material.dart';
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
}*/
