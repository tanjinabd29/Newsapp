import 'dart:convert';

import 'package:http/http.dart';
import 'package:news/model/article_model.dart';


//Now let's make the HTTP request services
// this class will alows us to make a simple get http request
// from the API and get the Articles and then return a list of Articles

class ApiService {
  //let's add an Endpoint URL, you can check the website documentation
  // and learn about the different Endpoint
  //for this example I'm going to use a single endpoint

  //NOTE: make sure to use your OWN apikey, you can make a free acount and
  // choose a developer option it's FREE
  final endPointUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=f8847796455b48d497e20040b169edde";

  //Now let's create the http request function
  // but first let's import the http package

  Future<List<Article>> getArticles() async {
    try {
      Uri uri = Uri.parse(endPointUrl);
      Response res = await get(uri);

      print('Response status: ${res.statusCode}');
      print('Response body: ${res.body}');

      if (res.body != null && res.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(res.body);

        List<dynamic> body = json['articles'];

        List<Article> articles =
        body.map((dynamic item) => Article.fromJson(item)).toList();

        return articles;
      } else {
        // Handle the case where the response body is null or the status code is not 200
        throw Exception("Can't get the Articles");
      }
    } catch (e) {
      print('Error fetching articles: $e');
      throw Exception("Can't get the Articles");
    }
  }


}
