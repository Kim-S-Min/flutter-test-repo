import 'dart:convert';
import 'package:http/http.dart' as http;

class Http {
  /**
   * HTTP GET 요청
   */
  static get(url) async {
    var headers = getConfig();
    var response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      return json.decode(response as String);
    } else {
      throw Error();
    }
  }

  /**
   * HTTP POST 요청
   */
  static post(url, data) async {
    var headers = getConfig();
    var response = await http.post(Uri.parse(url), headers: headers, body: data);

    if (response.statusCode == 200) {
      return json.decode(response as String);
    } else {
      throw Error();
    }
  }
}

Map<String, String> getConfig () {
    String? accessToken = '';

    Map<String, String> headers = {
        'Content-Type': 'application/json',
    };

    if (accessToken.isNotEmpty) {
      headers!["Access-Token"] = accessToken;
    }

    return headers;
}