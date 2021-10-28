import 'package:bigio_swars_app/core/constants/route_name_const.dart';
import 'package:bigio_swars_app/features/bookmark/view/bookmark_view.dart';
import 'package:bigio_swars_app/features/home/view/home_view.dart';

final routes = {
  '/': (_) => HomeView(),
  RouteName.Home: (_) => HomeView(),
  RouteName.Bookmark: (_) => BookmarkView(),
};
