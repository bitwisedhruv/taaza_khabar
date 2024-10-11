// // https://newsapi.org/v2/top-headlines/sources?apiKey=06107a0a39a44e8a8305e88395cdd6ef

// import 'dart:convert';

// import 'package:http/http.dart';

// class FetchNews {
//   static fetchNews() async {
//     Response response = await get(
//       Uri.parse("https://newsapi.org/v2/top-headlines/sources?apiKey=API_KEY"),
//     );
//     Map body = jsonDecode(response.body);
//     print(body);
//   }
// }

import 'dart:convert';

import 'package:http/http.dart';

class FetchNews {
  static fetchNews(String apiEndpoint) async {
    String cleanedEndpoint =
        apiEndpoint.replaceAll(RegExp(r'[\[\]]'), '').trim();

    final response = await get(Uri.parse(cleanedEndpoint));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse['articles'];
    } else {
      throw Exception('Failed to load news');
    }
  }
}
