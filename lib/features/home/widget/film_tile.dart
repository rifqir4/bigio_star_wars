import 'package:bigio_swars_app/core/constants/sizes_const.dart';
import 'package:bigio_swars_app/core/model/film.dart';
import 'package:bigio_swars_app/core/provider/bookmark_provider.dart';
import 'package:bigio_swars_app/features/detail/detail_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({
    Key? key,
    required this.film,
  }) : super(key: key);

  final Film film;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => DetailView(film: film))),
          child: Container(
            padding: EdgeInsets.all(SizesConst.defaultpadding),
            margin: EdgeInsets.only(bottom: SizesConst.defaultpadding),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.movie,
                      size: 50,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
                SizedBox(width: SizesConst.defaultpadding),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.calendar_today, size: 12, color: Theme.of(context).primaryColor),
                          SizedBox(width: SizesConst.defaultpadding / 2),
                          Text(
                            film.release,
                            style: TextStyle(fontSize: 12, color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      SizedBox(height: SizesConst.defaultpadding),
                      Text(
                        film.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        "Director: ${film.director}",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -2,
          right: 25,
          child: Consumer<BookmarkProvider>(
            builder: (context, bookmark, _) => GestureDetector(
              onTap: () => bookmark.changeBookmark(film),
              child: Icon(
                Icons.bookmark,
                color: bookmark.isOnBookmark(film) ? Theme.of(context).primaryColor : Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
