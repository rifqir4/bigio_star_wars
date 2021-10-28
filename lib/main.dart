import 'package:bigio_swars_app/core/constants/route_const.dart';
import 'package:bigio_swars_app/core/provider/bookmark_provider.dart';
import 'package:bigio_swars_app/core/provider/films_provider.dart';
import 'package:bigio_swars_app/core/theme/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FilmsProvider()),
        ChangeNotifierProvider(create: (_) => BookmarkProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            elevation: 0,
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: Colors.white),
            titleTextStyle: TextStyle(color: Colors.white),
            brightness: Brightness.dark,
          ),
          scaffoldBackgroundColor: Color(0xFF0B090A),
          primarySwatch: Colors.grey,
          primaryColor: ThemeColor.primary,
          textTheme: TextTheme(
            headline5: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            headline6: TextStyle(color: Colors.black),
            subtitle1: TextStyle(color: Colors.white.withOpacity(0.7)),
          ),
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
