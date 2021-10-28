import 'package:flutter/material.dart';

class ThemeWidget {
  static final searchTextInputDecoration = InputDecoration(
    prefixIcon: Icon(Icons.search, size: 25, color: Colors.white.withOpacity(0.2)),
    prefixIconConstraints: BoxConstraints(minWidth: 50),
    hintStyle: TextStyle(color: Colors.white.withOpacity(0.2)),
    hintText: "Search...",
    filled: true,
    fillColor: Colors.white.withOpacity(0.1),
    isDense: true,
    contentPadding: const EdgeInsets.symmetric(vertical: 12),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );
}
