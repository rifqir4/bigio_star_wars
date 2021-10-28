import 'package:bigio_swars_app/core/model/film.dart';
import 'package:flutter/cupertino.dart';

class BookmarkProvider extends ChangeNotifier {
  List<Film> listBookmark = [];

  void changeBookmark(Film data) {
    List result = listBookmark.where((element) => element.id == data.id).toList();
    if (result.length > 0) {
      List<Film> templist = listBookmark;
      templist.removeWhere((element) => element.id == data.id);
      print(templist);
      listBookmark = templist;
    } else {
      listBookmark.add(data);
    }
    notifyListeners();
  }

  bool isOnBookmark(Film data) {
    List result = listBookmark.where((element) => element.id == data.id).toList();

    return result.length > 0 ? true : false;
  }
}
