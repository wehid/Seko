import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Models/ProviderModel/lesson_provider.dart';
import '../../Models/ObjectModels/item.dart';
import '../../Models/ProviderModel/item_provider.dart';
import '../../ItemPage/item_screen.dart';
import '../../constants.dart';
import '../../Models/ProviderModel/user_item_provider.dart';

class ItemTile extends StatelessWidget {
  final Item item;

  ItemTile(this.item);

  @override
  Widget build(BuildContext context) {
    bool isReadedThisItem = Provider.of<UserItemProvider>(context).isItemReaded(item.id);
    Color itemColor = isReadedThisItem?readedItemColor:unReadeItemColor;

    void _openItemScreen() {
      //todo: delete print
      print(
          'tap item. item name is: ${item.title} lessen id is: ${item.lessonID} and item id is: ${item.id}');

      Provider.of<LessonProvider>(context, listen: false)
          .setSelectedLessonByID(item.lessonID);
      Provider.of<ItemProvider>(context, listen: false).setSelectedItem(item);
      Navigator.of(context).pushNamed(ItemScreen.routeName);
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: itemColor),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: ListTile(
        leading: Icon(
          itemIcon(item),
          color: itemColor,
          size: 30,
        ),
        title: Text(item.title),
        trailing: Icon(
          Icons.arrow_right,
          color: itemColor,
          size: 30,
        ),
        onTap: _openItemScreen,
      ),
    );
  }
}
