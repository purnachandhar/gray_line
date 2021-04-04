import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import '../model/form.dart';

/// FormController is a class which does work of saving FeedbackForm in Google Sheets using
/// HTTP GET request on Google App Script Web URL and parses response and sends result callback.
class FormController {

  // Google App Script Web URL.
  // static const String URL = "https://script.google.com/macros/s/AKfycbxQDuWTNTpqPXLhn6qpOMjmMMWBe6xsJ6Hewjvuwj4bZ-oI84RL3VZvT5tysUbA1I-g/exec";
  // static const String URL = "https://script.google.com/macros/s/AKfycbzXZ2YAWO4s8jV6lI55dBjiLPaBxKoQfD-1v5vCYxRBu_ciXTk6HaAQLweKTVBep-o/exec";
  //static const String URL = "https://script.google.com/macros/s/AKfycbwudR6OmIUj0Z8XZPPctHMRg8Hlqk-zgBl_TX1fa3QcA4Mrwtvxr4zkyGd4VADXcUY/exec";
  //static const String URL = "https://script.google.com/macros/s/AKfycbxhtWVx7VyaHw7f6mb0-xaMdg98sqi-0gh-yZvhfP0-zSiZmZSbsCp4bdD5YFYibxhn/exec";
  static const String URL = "https://script.google.com/macros/s/AKfycbxQkHHrGCJ9PaO61KjfAakpkFePS60dA3IWiHor897rdkHHgXT2fMO9DjqjlITcb8WF/exec";

  // Success Status Message
  static const STATUS_SUCCESS = "SUCCESS";

  /// Async function which saves feedback, parses [feedbackForm] parameters
  /// and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(FeedbackForm feedbackForm,
      void Function(String) callback) async {
    try {
      await http.post(URL, body: feedbackForm.toJson()).then((response) async {
        if (response.statusCode == 302) {
          var url = response.headers['location'];
          await http.get(url).then((response) {
            callback(convert.jsonDecode(response.body)['status']);
          });
        } else {
          callback(convert.jsonDecode(response.body)['status']);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}