import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/book.dart';

class MockBookshelfService {
  // Get the sample recipe json to display in ui
  Future<List<Book>> getBookData() async {
    // Simulate api request wait time
    await Future.delayed(const Duration(milliseconds: 1000));
    // Load json from file system
    final dataString = await _loadAsset('json/books.json');
    // Decode to json
    final Map<String, dynamic> json = jsonDecode(dataString);

    // Go through each recipe and convert json to SimpleRecipe object.
    if (json['books'] != null) {
      final books = <Book>[];
      json['books'].forEach((v) {
        books.add(Book.fromJson(v));
      });
      return books;
    } else {
      return [];
    }
  }

  // Loads sample json data from file system
  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}
