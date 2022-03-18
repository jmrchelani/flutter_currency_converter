import 'package:flutter/material.dart';
import 'package:live_currency_converter/constants.dart';
import 'package:live_currency_converter/provider/currencies_provider.dart';
import 'package:live_currency_converter/screens/currency_convert_screen.dart';
import 'package:live_currency_converter/screens/select_base_currency_screen.dart';
import 'package:provider/provider.dart';

class BaseCurrencyScreen extends StatelessWidget {
  const BaseCurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Provider.of<CurrenciesProvider>(context).selectedCurrency);
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(
              flex: 3,
            ),
            const Text(
              'Base Currency',
              style: TextStyle(
                color: Colors.white,
                fontSize: kTitleSize,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: kDefaultPadding / 2,
            ),
            Text(
              'Select the base currency you want to convert from!',
              style: TextStyle(
                color: Colors.white.withOpacity(0.3),
                fontSize: kSubtitleSize,
              ),
              textAlign: TextAlign.center,
            ),
            Spacer(
                // flex: 2,
                ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 3,
              child: Center(
                child: Image.asset(
                  'assets/images/currencySel.png',
                ),
              ),
            ),
            Spacer(
                // flex: 2,
                ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SelectBaseCurrencyScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: kLightColor,
                // shape: RoundedRectangleBorder(
                //   borderRadius: BorderRadius.circular(15),
                // ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // SizedBox(
                        //   height: 16,
                        //   child: Image.network(
                        //     'https://flagcdn.com/w320/ae.png',
                        //     // height: kDefaultPadding / 2,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: kDefaultPadding,
                        // ),
                        Text(
                          Provider.of<CurrenciesProvider>(context)
                                  .selectedCurrency ??
                              'Select Currency',
                          style: TextStyle(
                            fontSize: 20,
                            // color: kBackgroundColor,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.chevron_right,
                      size: 28,
                      // color: kLightColor,
                    ),
                  ],
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const ConvertCurrencyScreen(),
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
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      color: kBackgroundColor,
                    ),
                  ),
                ),
              ),
            ),
            Spacer(
                // flex: 3,
                ),
          ],
        ),
      ),
    );
  }
}
