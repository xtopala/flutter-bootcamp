import 'dart:convert';
import 'package:http/http.dart' as http;

const HERE_API_KEY = '1lP6WU5ZpfPQjZ7eH3eBmicLhrXc4Q7X6Z_ig2DbCBI';

class LocationHelper {
  static String generateLocationPreviewImage(
      {double longitude, double latitude}) {
    return 'https://image.maps.ls.hereapi.com/mia/1.6/mapview?poilbl=2&style=alps&vt=1&w=600&h=300&c=$latitude,$longitude&z=16&apiKey=$HERE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://revgeocode.search.hereapi.com/v1/revgeocode?at=$lat,$lng&lang=en-US&apiKey=$HERE_API_KEY';
    final res = await http.get(url);
    return json.decode(res.body)['items'][0]['title'];
  }
}
