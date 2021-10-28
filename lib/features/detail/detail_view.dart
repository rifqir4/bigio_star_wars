import 'package:bigio_swars_app/core/constants/sizes_const.dart';
import 'package:bigio_swars_app/core/model/film.dart';
import 'package:bigio_swars_app/core/provider/films_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailView extends StatelessWidget {
  final Film film;
  DetailView({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Film Detail",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Icon(Icons.movie, color: Theme.of(context).primaryColor, size: 80),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(45),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(50))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(film.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
                  Text("Director : " + film.director, style: TextStyle(fontSize: 14, color: Colors.black54)),
                  Expanded(
                    child: FutureBuilder<Map>(
                      future: context.read<FilmsProvider>().loadFilmDetail(film.detailUrl),
                      builder: (context, snap) {
                        if (snap.connectionState != ConnectionState.done)
                          return Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [CupertinoActivityIndicator(), Text("Loading detail...")],
                            ),
                          );
                        Map data = snap.data ?? {};
                        return SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: SizesConst.defaultpadding),
                              Text("Producer : " + data['producer'], style: TextStyle(fontSize: 14, color: Colors.black54)),
                              SizedBox(height: SizesConst.defaultpadding * 2),
                              Text(data['opening_crawl'].toString().replaceAll("\r\n", " "), style: TextStyle(fontSize: 16, height: 2)),
                              SizedBox(height: SizesConst.defaultpadding),
                              Text("Characters", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                              SizedBox(height: SizesConst.defaultpadding),
                            ],
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
