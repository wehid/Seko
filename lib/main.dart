import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'MainPage/main_screen.dart';
import 'Models/ProviderModel/internet_check_provider.dart';
import 'Models/ProviderModel/cities_provider.dart';
import 'Models/ProviderModel/courses_provider.dart';
import 'Models/ProviderModel/category_provider.dart';
import 'Models/ProviderModel/week_provider.dart';
import 'Models/ProviderModel/lesson_provider.dart';
import 'Models/ProviderModel/item_provider.dart';
import 'Models/ProviderModel/item_comments_provider.dart';
import 'Models/ProviderModel/user_provider.dart';
import 'Models/ProviderModel/course_learner_provider.dart';
import 'Models/ProviderModel/user_item_provider.dart';
import 'Models/ProviderModel/quiz_provider.dart';
import 'Models/ProviderModel/survey_provider.dart';
import 'Models/ProviderModel/banki_wane_provider.dart';
import 'Models/ProviderModel/news_provider.dart';
import 'Models/ProviderModel/forum_provider.dart';
import 'Models/ProviderModel/forum_comment_provider.dart';
import 'Models/ProviderModel/wane_comment_provider.dart';
import 'Models/ProviderModel/family_provider.dart';
import 'Models/ProviderModel/book_provider.dart';
import 'Models/ProviderModel/squad_provider.dart';
import 'Models/ProviderModel/upload_provider.dart';
import 'rout_generator.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InternetCheckProvider()),
        ChangeNotifierProvider(create: (_) => CitiesProvider()),
        ChangeNotifierProvider(create: (_) => CoursesProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => WeekProvider()),
        ChangeNotifierProvider(create: (_) => LessonProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()),
        ChangeNotifierProvider(create: (_) => ItemCommentsProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CourseLearnerProvider()),
        ChangeNotifierProvider(create: (_) => UserItemProvider()),
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => SurveyProvider()),
        ChangeNotifierProvider(create: (_) => BankiWaneProvider()),
        ChangeNotifierProvider(create: (_) => ForumProvider()),
        ChangeNotifierProvider(create: (_) => ForumCommentProvider()),
        ChangeNotifierProvider(create: (_) => WaneCommentProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
        ChangeNotifierProvider(create: (_) => FamilyProvider()),
        ChangeNotifierProvider(create: (_) => BookProvider()),
        ChangeNotifierProvider(create: (_) => SquadProvider()),
        ChangeNotifierProvider(create: (_) => UploadProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', ''), // English, no country code
      ],
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      initialRoute: MainScreen.routName,
      // initialRoute: AllCategoryScreen.routeName,
      onGenerateRoute: RoutGenerator.generateRoute,
    );
  }
}

// this class is for error of handshak
// HandshakeException: Handshake error in client (OS Error:CERTIFICATE_VERIFY_FAILED: certificate has expired(handshake.cc:359))
// todo: it recomended to solve this with another way befor release

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
