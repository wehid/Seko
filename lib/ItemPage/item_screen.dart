import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ObjectModels/lesson.dart';
import '../Models/ProviderModel/lesson_provider.dart';
import '../Models/ProviderModel/item_provider.dart';
import '../Models/ObjectModels/item.dart';
import 'Components/single_item.dart';
import '../Models/ProviderModel/user_item_provider.dart';
import 'Components/bottom_buttons.dart';
import '../Models/ProviderModel/course_learner_provider.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../Models/RequestModels/create_user_item.dart';
import '../constants.dart';
import '../Models/ProviderModel/item_comments_provider.dart';

class ItemScreen extends StatefulWidget {
  static const routeName = "/item_screen";

  @override
  _ItemScreenState createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  Item _item;
  Lesson _selectedLesson;
  PageController _itemPageController;
  String courseLearnerId;
  String userToken;
  final Duration _duration = Duration(milliseconds: 500);
  final Curve _curve = Curves.easeOutBack;

  @override
  Widget build(BuildContext context) {
    final userItemProvider = Provider.of<UserItemProvider>(context);
    bool isReadedThisItem = userItemProvider.isItemReaded(_item.id);

    void _setAsRead() {
      CreateUserItem createUserItem = CreateUserItem(
        itemId: _item.id,
        status: '2',
        courseLearnerId: courseLearnerId,
      );
      userItemProvider.setItemAsReaded(createUserItem, userToken);
    }

    return Scaffold(
      appBar: customAppBar(_selectedLesson.title),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _itemPageController,
              itemCount: _selectedLesson.items.length,
              onPageChanged: (currentPage){
                setState(() {
                  _item = _selectedLesson.items[currentPage];
                  Provider.of<ItemProvider>(context, listen: false).setSelectedItem(_item);
                  Provider.of<ItemCommentsProvider>(context, listen: false).getItemCommentListByItemId(_item.id);
                });
              },
              itemBuilder: (context, index){
                return SingleItem(_selectedLesson.items[index]);
              },
            )
          ),
          userItemProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : BottomButtons(
                  goToPrevious: () {
                    _itemPageController.previousPage(
                        duration: _duration, curve: _curve);
                  },
                  goToNext: () {
                    _itemPageController.nextPage(
                        duration: _duration, curve: _curve);
                  },
                  readingThisItem: _setAsRead,
                  isReadedThisItem: isReadedThisItem,
                ),
        ],
      ),
    );
  }

  @override
  void initState() {
    _item = Provider.of<ItemProvider>(context, listen: false).selectedItem;
    _selectedLesson =
        Provider.of<LessonProvider>(context, listen: false).selectedLesson;
    courseLearnerId = Provider.of<CourseLearnerProvider>(context, listen: false)
        .selectedCourseLearner
        .id;
    userToken = Provider.of<UserProvider>(context, listen: false).token;

    _itemPageController = PageController(
      initialPage: _selectedLesson.items.indexOf(_item),
    );

    super.initState();
  }
}
