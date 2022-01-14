import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:seko/Models/ObjectModels/forum_comment.dart';

import '../Models/RequestModels/search_item_comments.dart';
import '../Models/RequestModels/search_course_by_category.dart';
import '../Models/RequestModels/search_week_by_course.dart';
import '../Models/RequestModels/search_lesson.dart';
import '../Models/RequestModels/search_item.dart';
import '../Models/RequestModels/search_course_learner.dart';
import '../Models/RequestModels/create_user_item.dart';
import '../Models/RequestModels/search_user_item.dart';
import '../Models/RequestModels/search_question.dart';
import '../Models/RequestModels/search_survey_question.dart';
import '../Models/RequestModels/search_quiz.dart';
import '../Models/RequestModels/search_survey.dart';
import '../Models/RequestModels/search_banki_wane.dart';
import '../Models/RequestModels/search_news.dart';
import '../Models/RequestModels/search_forum.dart';
import '../Models/RequestModels/search_forum_comment.dart';
import '../Models/RequestModels/search_wane_comment.dart';
import '../Models/RequestModels/search_book.dart';
import '../Models/RequestModels/search_family_item.dart';
import '../Models/RequestModels/search_user_log.dart';
import '../Models/RequestModels/search_squad_activity.dart';
import '../Models/ObjectModels/user.dart';
import '../Models/ObjectModels/course_learner.dart';
import '../Models/ObjectModels/quiz.dart';
import '../Models/ObjectModels/survey.dart';
import '../Models/ObjectModels/item_comment.dart';
import '../Models/ObjectModels/forum_post.dart';
import '../Models/ObjectModels/wane_comment.dart';
import '../Models/ObjectModels/wane.dart';

class Api {
  // this part is define base url for all api
  final String _BASE_URL = 'szm.one';

  Map<String, String> securityHeader(String userToken) {
    return {"Token": userToken};
  }

//  ------------------ get all category ------------------------------

  Future<String> getAllCategory() async {
    final String _METHOD_URL = 'api/category/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

//  ------------------ get all course in category ------------------------------

  Future<String> getCoursesInCategory(
      SearchCourseByCategory searchCourse) async {
    final String _METHOD_URL = '/api/course/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String searchRequestBody = json.encode(searchCourse.toJson());

    try {
      var response = await http.post(url, body: searchRequestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

//  ------------------ get all course ------------------------------

  Future<String> getAllCourses() async {
    final String _METHOD_URL = 'api/course/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get all week ------------------------------

  Future<String> getAllWeek() async {
    final String _METHOD_URL = 'api/course/week/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get all week in course ------------------------------

  Future<String> getAllWeekInCourses(
      SearchWeekByCourse searchWeekByCourse) async {
    final String _METHOD_URL = 'api/course/week/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String searchRequestBody = json.encode(searchWeekByCourse.toJson());

    try {
      var response = await http.post(url, body: searchRequestBody);
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get all lesson in week and course ------------------------------

  Future<String> getLessonsBySearch(SearchLesson searchLesson) async {
    final String _METHOD_URL = 'api/course/lesson/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String searchRequestBody = json.encode(searchLesson.toJson());

    try {
      var response = await http.post(url, body: searchRequestBody);
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get all Lesson ------------------------------

  Future<String> getAllLessons() async {
    final String _METHOD_URL = 'api/course/lesson/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ Item ------------------------------
  ///  ------------------ Item ------------------------------

  //  ------------------ get all items in lesson ------------------------------

  Future<String> getItemsBySearch(SearchItem searchItem) async {
    final String _METHOD_URL = 'api/course/item/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String searchRequestBody = json.encode(searchItem.toJson());

    try {
      var response = await http.post(url, body: searchRequestBody);
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get all Items ------------------------------

  Future<String> getAllItems() async {
    final String _METHOD_URL = 'api/course/item/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ set Item As Read ------------------------------

  Future<String> setItemAsReaded(
      CreateUserItem createUserItem, String userToken) async {
    final String _METHOD_URL = 'api/learn/useritem/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(createUserItem.toJson());

    try {
      var response = await http.post(url,
          body: requestBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get All User Item ------------------------------

  Future<String> getAllUserItem(
      SearchUserItem searchUserItem, String userToken) async {
    final String _METHOD_URL = 'api/learn/useritem/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchUserItem.toJson());

    try {
      var response = await http.post(url,
          body: requestBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ Item Comment ------------------------------
  ///  ------------------ Item Comment ------------------------------

  //  ------------------ Search Item Comment ------------------------------
  Future<String> searchItemComments(
      SearchItemComments searchItemComments) async {
    final String _METHOD_URL = 'api/learn/itemcomment/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String searchRequestBody = json.encode(searchItemComments.toJson());

    try {
      var response = await http.post(url, body: searchRequestBody);
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ Send Item Comment ------------------------------
  Future<String> sendItemComments(ItemComment comment, String userToken) async {
    final String _METHOD_URL = 'api/learn/itemcomment/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String sendCommentBody = json.encode(comment.toJson());

    try {
      var response = await http.post(url,
          body: sendCommentBody, headers: securityHeader(userToken));
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get all city ------------------------------

  Future<String> getAllCity() async {
    final String _METHOD_URL = 'api/city/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Course Learner ------------------------------

  Future<String> getCourseLearner(
      SearchCourseLearner searchCourseLearner, String userToken) async {
    final String _METHOD_URL = 'api/learn/courselearner/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String searchRequestBody = json.encode(searchCourseLearner.toJson());

    try {
      var response = await http.post(url,
          body: searchRequestBody, headers: securityHeader(userToken));
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Course Learner ------------------------------

  Future<String> createCourseLearner(
      CourseLearner courseLearner, String userToken) async {
    final String _METHOD_URL = 'api/learn/courselearner/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(courseLearner.toJson());

    try {
      var response = await http.post(url,
          body: requestBody, headers: securityHeader(userToken));
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ Quiz ------------------------------
  ///  ------------------ Quiz ------------------------------

  //  ------------------ Quiz Question ------------------------------

  Future<String> getQuestions(SearchQuestion searchQuestion) async {
    final String _METHOD_URL = 'api/quiz/question/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchQuestion.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ Quiz ------------------------------

  Future<String> getQuiz(SearchQuiz searchQuiz, String userToken) async {
    final String _METHOD_URL = 'api/quiz/quiz/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchQuiz.toJson());

    try {
      var response = await http.post(url,
          body: requestBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      //todo: delete after debugging
      print('in get quiz, error is: $error');
      throw error;
    }
  }

  //  ------------------ Send Answer Of Quiz ------------------------------

  Future<String> sendQuizAnswer(Quiz answerQuiz, String userToken) async {
    final String _METHOD_URL = 'api/quiz/quiz/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(answerQuiz.toJson());

    try {
      var response = await http.post(url,
          body: requestBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      print('in send quiz answer, error is: $error');
      throw error;
    }
  }

  ///  ------------------ Survey ------------------------------
  ///  ------------------ Survey ------------------------------

  //  ------------------ Survey Question ------------------------------

  Future<String> getSurveyQuestion(
      SearchSurveyQuestion searchSurveyQuestion) async {
    final String _METHOD_URL = 'api/survey/question/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchSurveyQuestion.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ Survey ------------------------------

  Future<String> getSurvey(SearchSurvey searchSurvey, String userToken) async {
    final String _METHOD_URL = 'api/survey/survey/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchSurvey.toJson());

    try {
      var response = await http.post(url,
          body: requestBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      print('in get survey, error is: $error');
      throw error;
    }
  }

  //  ------------------ Send Answer Of Survey ------------------------------

  Future<String> sendSurveyAnswer(Survey answerSurvey, String userToken) async {
    final String _METHOD_URL = 'api/survey/survey/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(answerSurvey.toJson());

    try {
      var response = await http.post(url,
          body: requestBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      //todo: delete after debugging
      print('in send survey answer, error is: $error');
      throw error;
    }
  }

  ///  ------------------ User ------------------------------
  ///  ------------------ User ------------------------------

  //  ------------------ Login ------------------------------

  Future<String> login(User user) async {
    final String _METHOD_URL = 'api/user/login.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String loginRequestBody = json.encode(user.toJson());

    try {
      var response = await http.post(url, body: loginRequestBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print('in login api, response status code is: ${response.statusCode}');
        print('in login api, response body is: ${response.body}');
        throw response.statusCode;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ Register ------------------------------

  Future<String> register(User user) async {
    final String _METHOD_URL = 'api/user/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String loginRequestBody = json.encode(user.toJson());

    try {
      var response = await http.post(url, body: loginRequestBody);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(
            'in register api, response status code is: ${response.statusCode}');
        print('in register api, response body is: ${response.body}');
        throw response.statusCode;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ Update ------------------------------

  Future<String> update(User user) async {
    final String _METHOD_URL = 'api/user/update.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String loginRequestBody = json.encode(user.toJson());

    try {
      var response = await http.post(url,
          body: loginRequestBody, headers: securityHeader(user.token));
      return response.body;
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ Hawkari Hevalkrd ------------------------------
  ///  ------------------ Hawkari Hevalkrd ------------------------------

  //  ------------------ send Wane Post ------------------------------

  Future<String> sendWanePost(Wane post, String userToken) async {
    final String _METHOD_URL = 'api/upload/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String sendWanePostBody = json.encode(post.toJson());

    try {
      var response = await http.post(
        url,
        body: sendWanePostBody,
        headers: securityHeader(userToken),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Banki Wane ------------------------------

  Future<String> getBankiWane(SearchBankiWane searchBankiWane) async {
    final String _METHOD_URL = 'api/upload/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchBankiWane.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Wane Group ------------------------------

  Future<String> getAllWaneGroup() async {
    final String _METHOD_URL = 'api/upload/group/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Banki Wane Comment ------------------------------

  Future<String> getWaneCommet(SearchWaneComment searchWaneComment) async {
    // ignore: non_constant_identifier_names
    final String _METHOD_URL = 'api/upload/comment/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchWaneComment.toJson());

    // todo: delete print
    print('in get wane comments, url is: $url');

    print('in get wane comments, request body is: $requestBody');

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ send Banki Wane Comment ------------------------------

  Future<String> sendWaneCommet(WaneComment comment, String userToken) async {
    final String _METHOD_URL = 'api/upload/comment/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String sendCommentBody = json.encode(comment.toJson());

    try {
      var response = await http.post(url,
          body: sendCommentBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ send Forum Post ------------------------------

  Future<String> sendForumPost(ForumPost post, String userToken) async {
    final String _METHOD_URL = 'api/forum/entry/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String sendForumPostBody = json.encode(post.toJson());

    try {
      var response = await http.post(url,
          body: sendForumPostBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get all Forums ------------------------------

  Future<String> getAllForum() async {
    final String _METHOD_URL = 'api/forum/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Forum post ------------------------------

  Future<String> getForum(SearchForum searchForum) async {
    // ignore: non_constant_identifier_names
    final String _METHOD_URL = 'api/forum/entry/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchForum.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ send Forum Comment ------------------------------

  Future<String> sendForumCommet(ForumComment comment, String userToken) async {
    final String _METHOD_URL = 'api/forum/reply/create.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String sendCommentBody = json.encode(comment.toJson());

    try {
      var response = await http.post(url,
          body: sendCommentBody, headers: securityHeader(userToken));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Forum Comment ------------------------------

  Future<String> getForumCommet(SearchForumComment searchComment) async {
    // ignore: non_constant_identifier_names
    final String _METHOD_URL = 'api/forum/reply/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchComment.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // todo: handle if status code is not 200 or 201
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ News ------------------------------
  ///  ------------------ News ------------------------------

  //  ------------------ get News ------------------------------

  Future<String> getNews(SearchNews searchNews) async {
    final String _METHOD_URL = 'api/headline/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchNews.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ Family ------------------------------
  ///  ------------------ Family ------------------------------

  //  ------------------ get Family Categories ------------------------------

  Future<String> getFamilyCategories() async {
    final String _METHOD_URL = 'api/family/cat/getall.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    try {
      var response = await http.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ get Family Categories ------------------------------

  Future<String> getFamilyItem(SearchFamilyItem searchFamilyItem) async {
    final String _METHOD_URL = 'api/family/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchFamilyItem.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ Book ------------------------------
  ///  ------------------ Book ------------------------------

  //  ------------------ get Books ------------------------------

  Future<String> getBooks(SearchBook searchBook) async {
    final String _METHOD_URL = 'api/book/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchBook.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ User Log ------------------------------
  ///  ------------------ User Log ------------------------------

  //  ------------------ get User Log ------------------------------

  Future<String> getUserLogs(SearchUserLog searchUserLog) async {
    final String _METHOD_URL = 'api/log/user/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);
    String requestBody = json.encode(searchUserLog.toJson());

    try {
      var response = await http.post(url, body: requestBody);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        return response.body;
      }
    } catch (error) {
      throw error;
    }
  }

  ///  ------------------ Squad ------------------------------
  ///  ------------------ Squad ------------------------------

  //  ------------------ get Squad by user id ------------------------------

  Future<String> searchSquadForUser(User user) async {
    final String _METHOD_URL = 'api/squad/find.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    String squadSearchBody = json.encode({"MemberID": user.id});

    try {
      var response = await http.post(url,
          body: squadSearchBody, headers: securityHeader(user.token));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // TODO: handle if status code is not 200 or 201
        throw (response.statusCode);
      }
    } catch (error) {
      throw error;
    }
  }

  //  ------------------ search Squad activity ------------------------------

  Future<String> searchSquadActivity(
      SearchSquadActivity searchSquadActivity, String userToken) async {
    final String _METHOD_URL = 'api/squad/activity/search.php';

    // to make url for api call from base url and method url.
    var url = Uri.https(_BASE_URL, _METHOD_URL);

    String squadSearchBody = json.encode(searchSquadActivity.toJson());

    try {
      var response = await http.post(url,
          body: squadSearchBody, headers: securityHeader(userToken));

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        print(response.statusCode);
        // TODO: handle if status code is not 200 or 201
        throw (response.statusCode);
      }
    } catch (error) {
      throw error;
    }
  }
}
