import 'package:flutter/material.dart';
import 'package:live_currency_converter/utils.dart';

class CurrenciesProvider extends ChangeNotifier {
  List<Currency>? _currencies;
  String? _selectedCurrency;

  List<Currency>? get currencies => _currencies;

  String? get selectedCurrency => _selectedCurrency;

  Future<List<Currency>?> fetchData() async {
    List<Currency> data = await getCurrenciesData();
    if (data.isEmpty) return null;
    // print(data);
    _currencies = data;
    _selectedCurrency = data.first.code;
    return data;
  }

  Future<Map<String, dynamic>?> fetchConversionData(String currency) async {
    Map<String, dynamic> data = await getConversionRates(currency);
    print(data);
    if (data == null || data.isEmpty) return null;
    // _currencies = data;
    // _selectedCurrency = data.keys.first;
    return data;
  }

  setCurrencies(List<Currency>? value) {
    _currencies = value;
    notifyListeners();
  }

  setSelectedCurrency(String? value) {
    _selectedCurrency = value;
    notifyListeners();
  }
}
