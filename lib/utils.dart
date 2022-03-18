import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:live_currency_converter/constants.dart';

class Currency {
  final String code, fullName;

  Currency(this.code, this.fullName);

  @override
  String toString() {
    return '[$code - $fullName]';
  }
}

Future<List<Currency>> getCurrenciesData() async {
  var response = await http.get(
    Uri.parse(
      'http://' + BASE_URL + '/' + API_KEY + '/' + CURRENCIES_CODES_ENDPOINT,
    ),
  );
  // print(response.body);
  var jsonData = jsonDecode(response.body);
  var data = jsonData['supported_codes'];
  // print(data);
  List<Currency> currencies = [];
  data.forEach((element) => currencies.add(Currency(element[0], element[1])));

  return currencies;
}

Future<Map<String, dynamic>> getConversionRates(String currency) async {
  var response = await http.get(
    Uri.parse(
      'http://' +
          BASE_URL +
          '/' +
          API_KEY +
          '/' +
          RATES_ENDPOINT +
          '/' +
          currency,
    ),
  );
  var jsonData = jsonDecode(response.body);
  print(currency);
  return jsonData['conversion_rates'];
}
