import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Models/ObjectModels/city.dart';
import 'Models/ProviderModel/cities_provider.dart';
import 'Models/ObjectModels/item.dart';
import 'Models/ProviderModel/course_learner_provider.dart';
import 'Models/ProviderModel/user_item_provider.dart';
import 'Models/RequestModels/search_user_item.dart';
import 'Models/ProviderModel/user_provider.dart';
import 'Models/ProviderModel/quiz_provider.dart';
import 'Models/ProviderModel/survey_provider.dart';

Widget progressPage() {
  return Scaffold(
    appBar: AppBar(
      title: Text(''),
    ),
    body: Center(
      child: CircularProgressIndicator(),
    ),
  );
}

Widget showError(String error) {
  return Scaffold(
    appBar: AppBar(
      title: Text('کێشەیەک ڕووی داوە'),
    ),
    body: Center(
        child: Text(
      error,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    )),
  );
}

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [Image.asset("assets/images/krg_logo.png")],
  );
}

Divider customDivider() {
  return const Divider(color: Colors.blueGrey, thickness: 1.2);
}

TextStyle titleTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
  );
}

String emptyValidatorTFF(String value) {
  if (value == null || value.isEmpty) {
    return "زانیاری داواکراو نابێ بەتاڵ بێت";
  }
  return null;
}

//return selected city id or empty string if not selected
String getSelectedCityId(BuildContext context) {
  City city = Provider.of<CitiesProvider>(context, listen: false).selectedCity;
  return city != null ? city.iD : '';
}

const VIDEO_TYPE = 1;
const ARTICLE_TYPE = 2;
const DISCUSSION_TYPE = 3;
const QUESTION_TYPE = 4;
const SURVEY_TYPE = 5;

const MULTI_CHOICE_ANSWER_TYPE = "1";

const PRSYARXANE = "1";
const PROJESAZ = "2";

final List<IconData> listItemIcon = [
  Icons.local_movies,
  Icons.article,
  Icons.connect_without_contact,
  Icons.check_box,
  Icons.edit,
];
IconData itemIcon(Item item) {
  //item.type is start from 1, but icon list start from 0;
  return listItemIcon[int.parse(item.type) - 1];
}

void downloadAllNeededAfterLogin(BuildContext context) {
  final _userProvider = Provider.of<UserProvider>(context, listen: false);
  Provider.of<CourseLearnerProvider>(context, listen: false)
      .getAllCourseLearners(_userProvider.token);
  Provider.of<UserItemProvider>(context, listen: false).getAllUserItem(
      SearchUserItem(userId: _userProvider.user.id), _userProvider.token);
  Provider.of<QuizProvider>(context, listen: false).getAllQuestions();
  Provider.of<SurveyProvider>(context, listen: false).getAllSurveyQuestion();
  // Provider.of<ItemCommentsProvider>(context, listen: false).getAllItemComments();
}

void showUnAnsweredAlertDialog(
    String unAnsweredQuestions, BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Icon(
        Icons.warning_amber_rounded,
        color: Colors.yellow.shade700,
        size: 100,
      ),
      content: Text(
        'ئەم پرسیارانە وڵان نەدراونەتەوە: $unAnsweredQuestions',
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            'باشە',
            style: TextStyle(fontSize: 18),
          ),
        ),
      ],
    ),
  );
}

void removeAllDownloadedAfterLogout(BuildContext context) {
//  todo: remove downloaded from provider
}

final Color unReadeItemColor = Colors.pinkAccent;
final Color readedItemColor = Colors.green;
final Color questionColor = Color(0xff337ab7);
