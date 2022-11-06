import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:live_currency_converter/constants.dart';
import 'package:http/http.dart' as http;
import 'package:live_currency_converter/provider/currencies_provider.dart';
import 'package:live_currency_converter/utils.dart';
import 'package:provider/provider.dart';

class SelectBaseCurrencyScreen extends StatelessWidget {
  const SelectBaseCurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data =
        Provider.of<CurrenciesProvider>(context, listen: false).currencies;
    if (data == null || data.isEmpty) {
      return const Center(
        child: Text('Unable to load data...'),
      );
    }
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Choose Currency',
          style: TextStyle(
            fontSize: 20,
            // fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: kBackgroundColor,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        itemBuilder: (context, i) {
          return ElevatedButton(
            onPressed: () {
              Provider.of<CurrenciesProvider>(context, listen: false)
                  .setSelectedCurrency(data[i].code);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              primary: kLightColor,
            ),
            child: Row(
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 16.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data[i].code,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          data[i].fullName.length > 30
                              ? data[i].fullName.substring(0, 25) + '...'
                              : data[i].fullName,
                          style: const TextStyle(
                            fontSize: 20,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (c, i) => const SizedBox(
          height: 8,
        ),
        itemCount: data.length,
      ),
    );
  }
}
