import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  final String url;

  Network(this.url);

  Future<dynamic> get() async {
    http.Response res = await http.get(url);

    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else {
      print(res.statusCode);
    }
  }
}
