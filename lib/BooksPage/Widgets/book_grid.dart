import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ObjectModels/book.dart';
import '../../Models/ProviderModel/book_provider.dart';

import 'book_item.dart';

class BookGrid extends StatelessWidget {
  final String categoryType;

  BookGrid(this.categoryType);

  @override
  Widget build(BuildContext context) {
    final BookProvider bookProvider = Provider.of<BookProvider>(context);
    List<Book> bookList = bookProvider.getBookListByType(categoryType);

    return bookProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : GridView.builder(
            itemCount: bookList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 220 / 350,
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, index) {
              return BookItem(bookList[index]);
            },
          );
  }
}
