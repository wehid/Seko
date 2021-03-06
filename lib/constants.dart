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
import 'Models/ProviderModel/internet_check_provider.dart';
import 'Models/ProviderModel/squad_provider.dart';

final String BASE_URL = 'e-rahenan.krd';

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
    appBar: customAppBar('کێشەیەک ڕووی داوە'),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            Icons.warning_amber_rounded,
            color: Colors.yellow.shade700,
            size: 100,
          ),
          Text(
            error,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    ),
  );
}

Future checkInternetAndOpenPage(BuildContext context, String routName) {
  InternetCheckProvider internetCheckProvider =
      Provider.of<InternetCheckProvider>(context);
  internetCheckProvider.checkInternetConnection();
}

AppBar customAppBar(String title) {
  return AppBar(
    title: Text(title),
    centerTitle: true,
    actions: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset("assets/images/krg_logo.png"),
      ),
    ],
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

const FAMILY_VIDEO_TYPE = '2';
const FAMILY_TEXT_TYPE = '1';
const FAMILY_POSTER_TYPE = '4';

const TEXT_BOOK_TYPE = "1";
const VIDEO_BOOK_TYPE = "2";
const AUDIO_BOOK_TYPE = "3";

const UNSEEN_LOG = "0";

const List<IconData> BOOK_CATEGORY_ICON = [
  null,
  Icons.library_books,
  Icons.videocam,
  Icons.headphones
];

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
      .getMyCourseLearners(_userProvider.token, _userProvider.user.id);
  Provider.of<UserItemProvider>(context, listen: false).getAllUserItem(
      SearchUserItem(userId: _userProvider.user.id), _userProvider.token);
  Provider.of<QuizProvider>(context, listen: false).getAllQuestions();
  Provider.of<SurveyProvider>(context, listen: false).getAllSurveyQuestion();
  Provider.of<SquadProvider>(context, listen: false)
      .getUserSquad(_userProvider.user);
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
        'ئەم پرسیارانە وڵام نەدراونەتەوە: $unAnsweredQuestions',
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

Future<void> showWarningAlertDialog(String warning, BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Icon(
        Icons.warning_amber_rounded,
        color: Colors.yellow.shade700,
        size: 100,
      ),
      content: Text(
        'کێشەیەک ڕووی داوە. $warning',
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

Color getColorCode(String colorString) {
  return Color(int.parse("0xff$colorString"));
}

String makeYoutubeUrlFromYoutubeBe(String url) {
  // youtube video in this part back in formate "https://youtu.be/weDVEn0u7EY"
  // and i have to change it to standard format

  String videoId = url.split('/').last;
  print("the video id is: $videoId");
  return "https://www.youtube.com/watch?v=$videoId";
}

final Color unReadeItemColor = Colors.pinkAccent;
final Color readedItemColor = Colors.green;
final Color questionColor = Color(0xff337ab7);
