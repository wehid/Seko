import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'MainPage/main_screen.dart';
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
import 'rout_generator.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> CitiesProvider()),
        ChangeNotifierProvider(create: (_)=> CoursesProvider()),
        ChangeNotifierProvider(create: (_)=> CategoryProvider()),
        ChangeNotifierProvider(create: (_)=> WeekProvider()),
        ChangeNotifierProvider(create: (_)=> LessonProvider()),
        ChangeNotifierProvider(create: (_)=> ItemProvider()),
        ChangeNotifierProvider(create: (_)=> ItemCommentsProvider()),
        ChangeNotifierProvider(create: (_)=> UserProvider()),
        ChangeNotifierProvider(create: (_)=> CourseLearnerProvider()),
        ChangeNotifierProvider(create: (_)=> UserItemProvider()),
        ChangeNotifierProvider(create: (_)=> QuizProvider()),
        ChangeNotifierProvider(create: (_)=> SurveyProvider()),
        ChangeNotifierProvider(create: (_)=> BankiWaneProvider()),
        ChangeNotifierProvider(create: (_)=> ForumProvider()),
        ChangeNotifierProvider(create: (_)=> NewsProvider() ),
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
        primarySwatch: Colors.blue,
      ),
      initialRoute: MainScreen.routName,
      // initialRoute: AllCategoryScreen.routeName,
      onGenerateRoute: RoutGenerator.generateRoute,
    );
  }
}
