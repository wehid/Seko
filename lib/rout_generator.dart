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
import 'HawkariyiHevalkrdPage/Components/wane_detail.dart';
import 'HawkariyiHevalkrdPage/Components/forum_detail.dart';
import 'HawkariyiHevalkrdPage/Components/add_forum_post.dart';
import 'HawkariyiHevalkrdPage/Components/add_wane_post.dart';
import 'BooksPage/Componants/show_book_details.dart';
import 'FamilyPage/Components/family_category_details.dart';
import 'FamilyPage/Components/family_item_details.dart';
import 'SquadPage/squad_screen.dart';
import 'UserLogsPage/user_logs_screen.dart';
import 'ChangePasswordPage/change_password_screen.dart';
import 'DeleteAccountPage/delete_account_screen.dart';

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
      case ForumDetail.routeName:
        return MaterialPageRoute(builder: (_) => ForumDetail());
        break;
      case AddForumPost.routeName:
        final args = settings.arguments as String;
        return MaterialPageRoute(builder: (_) => AddForumPost(args));
        break;
      case AddWanePost.routeName:
        return MaterialPageRoute(builder: (_) => AddWanePost());
        break;
      case ShowBookDetails.routeName:
        return MaterialPageRoute(builder: (_) => ShowBookDetails());
        break;
      case FamilyCategoryDetails.routeName:
        return MaterialPageRoute(builder: (_) => FamilyCategoryDetails());
        break;
      case FamilyItemDetails.routeName:
        return MaterialPageRoute(builder: (_) => FamilyItemDetails());
        break;
      case SquadScreen.routeName:
        return MaterialPageRoute(builder: (_) => SquadScreen());
        break;
      case UserLogsScreen.routeName:
        return MaterialPageRoute(builder: (_) => UserLogsScreen());
        break;
      case ChangePasswordScreen.routeName:
        return MaterialPageRoute(builder: (_) => ChangePasswordScreen());
        break;
      case DeleteAccountScreen.routeName:
        return MaterialPageRoute(builder: (_) => DeleteAccountScreen());
        break;

      //  TODO: default: return (_)=> error screen
    }
  }
}
