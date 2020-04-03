import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'E16E06A0-F346-4384-BF48-B616726742B9';
const coinUrl = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future get(String selectedCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      String reqURL = '$coinUrl/$crypto/$selectedCurrency?apikey=$apiKey';
      http.Response response = await http.get(reqURL);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double lastPrice = data['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with the get request';
      }
    }
    return cryptoPrices;
  }
}
