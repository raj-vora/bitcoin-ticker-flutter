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

const apiKey = '13C6F4D4-0034-45B8-B953-99520836DAD3';
const coinApiURL = 'https://rest.coinapi.io/v1/exchangerate';

class CoinData {
  Future<String> getCoinData(String currency, String crypto) async {
    http.Response response = await http.get('$coinApiURL/$crypto/$currency?apikey=$apiKey');
    if(response.statusCode == 200) {
      String data = response.body;
      double rate = jsonDecode(data)['rate'];
      return rate.round().toString();
    }else {
      print(response.statusCode);
    }  
  }
}
