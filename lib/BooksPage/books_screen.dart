import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../Models/ProviderModel/book_provider.dart';
import '../Models/ObjectModels/book.dart';
import 'Widgets/book_item.dart';

class BooksScrenn extends StatefulWidget {
  @override
  State<BooksScrenn> createState() => _BooksScrennState();
}

class _BooksScrennState extends State<BooksScrenn> {
  List<Book> showList;

  @override
  void initState() {
    Provider.of<BookProvider>(context, listen: false).getAllBook();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookProvider>(context);
    showList = bookProvider.allBookList;

    return Scaffold(
      appBar: customAppBar("کتێبخانە"),
      body: GridView.builder(
        itemCount: showList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 5 / 6,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, index) {
          return BookItem(showList[index]);
        },
      ),
    );
  }
}
