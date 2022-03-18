import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:live_currency_converter/constants.dart';
import 'package:live_currency_converter/provider/currencies_provider.dart';
import 'package:live_currency_converter/screens/base_currency_screen.dart';
import 'package:live_currency_converter/utils.dart';
import 'package:provider/provider.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(
            flex: 2,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Image.asset('assets/images/introBanner.png'),
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 64.0),
            child: Text(
              'Convert local currency into international currencies!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Text(
              'Start converting local currencies into international currencies by entering the amount and selecting the currency you want to convert to.',
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: 15,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          FutureBuilder(
            future: Provider.of<CurrenciesProvider>(context).fetchData(),
            builder: (c, s) {
              if (!s.hasData) {
                return const CircularProgressIndicator(
                  color: kButtonColor,
                );
              }

              return SizedBox(
                width: MediaQuery.of(context).size.width / 2,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const BaseCurrencyScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: kButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Center(
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                          fontSize: 20,
                          color: kBackgroundColor,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
          const Spacer(
            flex: 2,
          ),
        ],
      ),
    );
  }
}
