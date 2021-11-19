import 'package:flutter/material.dart';
import 'package:seko/MainPage/Components/categories.dart';

import '../../constants.dart';

class BookCategory {
  final String imagePath;
  final String name;
  final Color color;
  final String type;

  BookCategory({
     this.color,
     this.imagePath,
     this.name,
     this.type,
  });

  List<BookCategory> _allCategories = [
    BookCategory(
        color: Colors.green,
        imagePath: "assets/images/book-text.jpg",
        name: "کتێب / تێکست",
        type: TEXT_BOOK_TYPE),
    BookCategory(
        color: Colors.blue.shade600,
        imagePath: "assets/images/book-video.jpg",
        name: "ڤیدیۆ",
        type: VIDEO_BOOK_TYPE),
    BookCategory(
        color: Colors.amber.shade600,
        imagePath: "assets/images/book-audio.jpg",
        name: "دەنگە کتێب",
        type: AUDIO_BOOK_TYPE),
  ];

  List<BookCategory> get allCategories => _allCategories;
}
