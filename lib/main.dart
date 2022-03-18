import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_currency_converter/constants.dart';
import 'package:live_currency_converter/provider/currencies_provider.dart';
import 'package:live_currency_converter/screens/base_currency_screen.dart';
import 'package:live_currency_converter/screens/intro_screen.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CurrenciesProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Live Currency Converter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: GoogleFonts.roboto().fontFamily,
        ),
        home: const IntroScreen(),
      ),
    );
  }
}
