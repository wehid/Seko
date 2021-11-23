import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:seko/constants.dart';

import '../Models/ProviderModel/book_provider.dart';
import '../Models/ObjectModels/book.dart';
import 'Widgets/book_grid.dart';

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

  // TODO: add this type of choose category

  // Widget categoriesGrid() {
  //   return GridView.builder(
  //     itemCount: _bookCategories.length,
  //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
  //       childAspectRatio: 1,
  //       crossAxisCount: 3,
  //       crossAxisSpacing: 0,
  //       mainAxisSpacing: 0,
  //     ),
  //     itemBuilder: (ctx, index) {
  //       BookCategory thisCategory = _bookCategories[index];
  //       return CategoryItem(
  //         thisCategory,
  //         thisCategory.type == selectedCategories
  //             ? Colors.white
  //             : thisCategory.color,
  //         () => _changeCategories(thisCategory),
  //       );
  //     },
  //   );
  // }

  // void _changeCategories(BookCategory category) {
  //   setState(() {
  //     selectedCategories = category.type;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // final bookProvider = Provider.of<BookProvider>(context);
    // showList = bookProvider.allBookList;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("کتێبخانە"),
          centerTitle: true,
          actions: [Image.asset("assets/images/krg_logo.png")],
          bottom: TabBar(
            tabs: [
              Tab(text: 'کتێب / تێکست'),
              Tab(text: 'ڤیدیۆ'),
              Tab(text: 'دەنگەکتێب'),
            ],
          ),
        ),
        body: TabBarView(children: [
          BookGrid(TEXT_BOOK_TYPE),
          BookGrid(VIDEO_BOOK_TYPE),
          BookGrid(AUDIO_BOOK_TYPE),
        ],)
      ),
    );
  }
}
