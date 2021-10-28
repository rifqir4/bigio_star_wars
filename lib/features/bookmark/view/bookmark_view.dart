import 'package:bigio_swars_app/core/constants/sizes_const.dart';
import 'package:bigio_swars_app/core/provider/bookmark_provider.dart';
import 'package:bigio_swars_app/features/home/widget/film_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkView extends StatelessWidget {
  const BookmarkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Bookmark",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(SizesConst.defaultpadding),
        child: Consumer<BookmarkProvider>(
          builder: (context, bookmark, _) => ListView.builder(
            itemCount: bookmark.listBookmark.length,
            itemBuilder: (context, index) => FilmTile(
              film: bookmark.listBookmark[index],
            ),
          ),
        ),
      ),
    );
  }
}
