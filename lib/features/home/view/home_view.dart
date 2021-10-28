import 'package:bigio_swars_app/core/constants/route_name_const.dart';
import 'package:bigio_swars_app/core/constants/sizes_const.dart';
import 'package:bigio_swars_app/core/model/film.dart';
import 'package:bigio_swars_app/core/provider/films_provider.dart';
import 'package:bigio_swars_app/core/theme/theme_widget.dart';
import 'package:bigio_swars_app/features/home/widget/film_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late Future<List<Film>> futureFetchFilms;

  String _search = "";

  @override
  void initState() {
    super.initState();
    futureFetchFilms = context.read<FilmsProvider>().loadFilms();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(". .", style: Theme.of(context).textTheme.headline5),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: SizesConst.defaultpadding),
            child: CircleAvatar(
              radius: 20,
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(SizesConst.defaultpadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Explore", style: Theme.of(context).textTheme.headline5),
            Text("Lets check the journey of the star", style: Theme.of(context).textTheme.subtitle1),
            SizedBox(height: SizesConst.defaultpadding),
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: TextFormField(
                    onChanged: (val) => setState(() => _search = val),
                    decoration: ThemeWidget.searchTextInputDecoration,
                  ),
                ),
                Spacer(),
                TextButton.icon(
                  onPressed: () => Navigator.pushNamed(context, RouteName.Bookmark),
                  icon: Icon(Icons.bookmark_border),
                  label: Text("My Bookmark"),
                )
              ],
            ),
            SizedBox(height: SizesConst.defaultpadding),
            Expanded(
              child: FutureBuilder<List<Film>>(
                future: futureFetchFilms,
                builder: (context, snap) {
                  if (snap.connectionState != ConnectionState.done) return Center(child: CupertinoActivityIndicator());
                  List<Film> listfilms = snap.data ?? [];
                  List<Film> _filtered = listfilms.where((element) => element.title.toLowerCase().contains(_search)).toList();
                  return ListView.builder(
                    itemCount: _filtered.length,
                    itemBuilder: (context, index) => FilmTile(film: _filtered[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
