import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/ProviderModel/user_provider.dart';
import '../Models/ProviderModel/user_item_file_provider.dart';
import '../Models/ObjectModels/user_item_file.dart';

import 'Components/homework_gride.dart';

class MyHomeworkScreen extends StatefulWidget {
  static const routeName = '/my-homewirk-screen';

  @override
  _MyHomeworkScreenState createState() => _MyHomeworkScreenState();
}

class _MyHomeworkScreenState extends State<MyHomeworkScreen> {
  String userId;

  @override
  void initState() {
    super.initState();
    userId = Provider.of<UserProvider>(context, listen: false).user.id;
    Provider.of<UserItemFileProvider>(context, listen: false)
        .SearchMyItemFiles(userId);
  }

  @override
  Widget build(BuildContext context) {
    final userItemFileProvider = Provider.of<UserItemFileProvider>(context);
    final List<UserItemFile> myHomeworks = userItemFileProvider.userItemFiles;
    return userItemFileProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : myHomeworks.length == 0
            ? Center(
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    "مامۆستای هێژا! تا ئێستا هیچ ئەرکێکتان بەرز نەکردۆتەوە!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              )
            : HomeworkGride(myHomeworks);
  }
}
