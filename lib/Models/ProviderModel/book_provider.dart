import 'package:flutter/material.dart';
import 'dart:convert';

import '../../Services/api.dart';

import '../ObjectModels/book.dart';
import '../RequestModels/search_book.dart';

class BookProvider with ChangeNotifier {
  static const String _TEXT_BOOK_TYPE = "1";
  static const String _VIDEO_BOOK_TYPE = "2";
  static const String _AUDIO_BOOK_TYPE = "3";

  bool _isLoading = false;
  Book _selectedBook;
  List<Book> _bookList = [];

  Future getAllBook() async {
    SearchBook searchAllBook = SearchBook();
    return getBook(searchAllBook);
  }

  Future getBook(SearchBook searchBook) async {
    _isLoading = true;
    List<Book> response = [];

    try {
      String bookListString = await Api().getBooks(searchBook);
      Iterable iterable = json.decode(bookListString)["Data"];
      response = iterable.map((element) => Book.fromJson(element)).toList();

      // TODO: delete print
      print('in get books, number of book liset is:${response.length}');

      _bookList = response;
      _isLoading = false;
      notifyListeners();
    } catch (error) {
      print('in get books, error is: $error');
      throw error;
    }
  }

  void setSelectedBook(Book selectedBook) {
    _selectedBook = selectedBook;
    notifyListeners();
  }

  List<Book> get textBookList =>
      _bookList.where((element) => element.type == _TEXT_BOOK_TYPE).toList();
  List<Book> get videoBookList =>
      _bookList.where((element) => element.type == _VIDEO_BOOK_TYPE).toList();
  List<Book> get audioBookList =>
      _bookList.where((element) => element.type == _AUDIO_BOOK_TYPE).toList();

  bool get isLoading => _isLoading;
  Book get selectedBook => _selectedBook;
  List<Book> get allBookList => _bookList;
}
