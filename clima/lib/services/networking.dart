import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  final String url;

  NetworkHelper(this.url);

  Future getData() async {
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      String data = res.body;

      return jsonDecode(data);
    } else {
      print(res.statusCode);
    }
  }
}
