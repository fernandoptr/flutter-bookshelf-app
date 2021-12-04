// To parse this JSON data, do
//
//     final book = bookFromJson(jsonString);

// import 'dart:convert';

// List<Book> bookFromJson(String str) =>
//     List<Book>.from(json.decode(str).map((x) => Book.fromJson(x)));

// String bookToJson(List<Book> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

import 'package:flutter/cupertino.dart';

class Book {
  Book({
    required this.title,
    required this.meta,
    required this.description,
    required this.category,
    required this.bookCover,
    required this.accentColor,
    required this.progressValue,
    required this.currentPage,
    required this.pages,
  });

  String title;
  String meta;
  String description;
  String category;
  String bookCover;
  String accentColor;
  double progressValue;
  int currentPage;
  int pages;

  factory Book.fromJson(Map<String, dynamic> json) => Book(
        title: json["title"],
        meta: json["meta"],
        description: json["description"],
        category: json["category"],
        bookCover: json["bookCover"],
        accentColor: json["accentColor"],
        progressValue: json["progressValue"].toDouble(),
        currentPage: json["currentPage"],
        pages: json["pages"],
      );

//   Map<String, dynamic> toJson() => {
//         "title": title,
//         "meta": meta,
//         "description": description,
//         "category": category,
//         "bookCover": bookCover,
//         "accentColor": accentColor,
//         "progressValue": progressValue,
//       };
// }
}
