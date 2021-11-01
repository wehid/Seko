import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../Models/ProviderModel/courses_provider.dart';
import '../Models/ProviderModel/category_provider.dart';
import 'Components/main_screen_scaffold.dart';
import '../Models/ObjectModels/login.dart';
import '../Services/sql_helper.dart';
import '../Models/ProviderModel/cities_provider.dart';
import '../Models/ProviderModel/lesson_provider.dart';
import '../Models/ProviderModel/item_provider.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../Models/ProviderModel/banki_wane_provider.dart';
import '../Models/ProviderModel/news_provider.dart';

class MainScreen extends StatelessWidget {
  static const routName = '/';
  bool _isFirstLoad = true;

  CoursesProvider _coursesProvider;
  CategoryProvider _categoryProvider;
  UserProvider _userProvider;

  Future<Login> _savedLogin() async {
    print('load _savedLogin method');
    SQLHelper helper = SQLHelper();
    List<Login> savedLoginList = await helper.getLogin();
    return savedLoginList.length > 0 ? savedLoginList[0] : null;
  }

  void _loginSavedUserAndDownloadRelatedObjects(BuildContext context) async {
    Login login = await _savedLogin();
    if (login != null)
      _userProvider
          .login(login.username, login.password)
          .then((_) => downloadAllNeededAfterLogin(context));
  }

  void _firstLoadRun(BuildContext context) {
    _coursesProvider = Provider.of<CoursesProvider>(context);
    _categoryProvider = Provider.of<CategoryProvider>(context);
    Provider.of<CitiesProvider>(context, listen: false);
    Provider.of<LessonProvider>(context, listen: false).getAllLessons();
    Provider.of<ItemProvider>(context, listen: false).getAllItems();
    _userProvider = Provider.of<UserProvider>(context);
    Provider.of<NewsProvider>(context, listen: false).getAllNews();
  }

  bool _isLoadingData() {
    return (_coursesProvider.isLoadData ||
        _categoryProvider.isLoading ||
        _userProvider.isLoading);
  }

  @override
  Widget build(BuildContext context) {
    if (_isFirstLoad) {
      _firstLoadRun(context);
      _loginSavedUserAndDownloadRelatedObjects(context);
      _isFirstLoad = false;
    }

    return _isLoadingData() ? progressPage() : MainScreenScaffold();
  }
}
