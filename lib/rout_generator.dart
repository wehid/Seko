import 'package:flutter/material.dart';

import 'CourseItemPage/course_item_screen.dart';
import 'LoginPage/login_screen.dart';
import 'RegisterPage/register_screen.dart';
import 'MainPage/main_screen.dart';
import 'LessonPage/lesson_screen.dart';
import 'ItemPage/item_screen.dart';
import 'ProfilePage/profile_screen.dart';
import 'EditProfilePage/edit_profile_screen.dart';
import 'ProfilePage/Components/my_courses.dart';
import 'HawkariyiHevalkrdPage/SubPage/wane_detail.dart';


class RoutGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainScreen());
        break;
      case CourseItemScreen.routeName:
        return MaterialPageRoute(builder: (_) => CourseItemScreen());
        break;
      case LoginScreen.routeName:
        return MaterialPageRoute(builder: (_) => LoginScreen());
        break;
      case RegisterScreen.routeName:
        return MaterialPageRoute(builder: (_) => RegisterScreen());
        break;
      case LessonScreen.routeName:
        return MaterialPageRoute(builder: (_) => LessonScreen());
        break;
      case ItemScreen.routeName:
        return MaterialPageRoute(builder: (_) => ItemScreen());
        break;
      case ProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
        break;
      case EditProfileScreen.routeName:
        return MaterialPageRoute(builder: (_) => EditProfileScreen());
        break;
      case MyCourses.routeName:
        return MaterialPageRoute(builder: (_) => MyCourses());
        break;
      case WaneDetail.routeName:
        return MaterialPageRoute(builder: (_) => WaneDetail());
        break;

      //  todo: default: return (_)=> error screen
    }
  }
}