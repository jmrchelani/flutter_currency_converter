import 'package:flutter/material.dart';
import 'package:live_currency_converter/constants.dart';
import 'package:live_currency_converter/provider/currencies_provider.dart';
import 'package:provider/provider.dart';

class ConvertCurrencyScreen extends StatelessWidget {
  const ConvertCurrencyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Converter'),
        backgroundColor: kBackgroundColor,
        centerTitle: true,
      ),
      backgroundColor: kBackgroundColor,
      body: FutureBuilder(
        future: Provider.of<CurrenciesProvider>(context).fetchConversionData(
            Provider.of<CurrenciesProvider>(context).selectedCurrency!),
        builder: (c, s) {
          if (!s.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            );
          }
          print(s.data);
          return ConverterPage(data: s.data);
        },
      ),
    );
  }

  //   // )));
  //   return ['1', '2', '3', '4', '5', '6', '7', '8', '9', '.', '0', 'x']
  //       .map(
  //         (e) => Padding(
  //           padding: const EdgeInsets.all(16.0),
  //           child: ElevatedButton(
  //             onPressed: () {},
  //             child: Text(e),
  //           ),
  //         ),
  //       )
  //       .toList();
  // }
}

class ConverterPage extends StatefulWidget {
  ConverterPage({
    Key? key,
    required this.data,
  }) : super(key: key);

  final data;
  String input = '', output = '';
  bool hasPoint = false;
  String convertTo = '';

  @override
  State<ConverterPage> createState() => _ConverterPageState();
}

class _ConverterPageState extends State<ConverterPage> {
  @override
  Widget build(BuildContext context) {
    print(widget.data);
    print(widget.input);
    print(widget.output);
    if (widget.convertTo == '') widget.convertTo = widget.data.keys.first;
    var border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: kLightColor,
      ),
    );
    return Column(
      children: [
        Expanded(
          // flex: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row(
                //   children: const [
                //     Text(
                //       'From:',
                //       style: TextStyle(
                //         fontSize: 20.0,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.white,
                    //   width: 1.0,
                    // ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: kLightColor,
                    // bord
                  ),
                  child: Column(
                    children: [
                      // ElevatedButton(
                      //   onPressed: () {
                      //     // Navigator.of(context).pop();
                      //   },
                      //   style: ElevatedButton.styleFrom(
                      //     primary: kLightColor,
                      //     shape: RoundedRectangleBorder(
                      //       // side: BorderSide(
                      //       //   color: kLightColor,
                      //       //   width: 1.0,
                      //       // ),
                      //       borderRadius: BorderRadius.only(
                      //         topLeft: Radius.circular(10),
                      //         topRight: Radius.circular(10),
                      //       ),
                      //     ),
                      //   ),
                      //   child: DefaultTextStyle(
                      //     style: TextStyle(
                      //       overflow: TextOverflow.ellipsis,
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(8.0),
                      //       child: Row(
                      //         mainAxisAlignment:
                      //             MainAxisAlignment.spaceBetween,
                      //         children: [
                      //           Text(
                      //             'USD',
                      //             style: TextStyle(
                      //               fontSize: 20.0,
                      //               color: Colors.white,
                      //             ),
                      //           ),
                      //           // const SizedBox(width: 8.0),
                      //           Icon(Icons.arrow_drop_down),
                      //         ],
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kLightColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Stack(
                                  children: [
                                    Text(
                                      widget.input != ''
                                          ? widget.input.length > 20
                                              ? widget.input.substring(0, 20)
                                              : widget.input
                                          : '0',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      // right: 0,
                                      // top: 10,
                                      child: InkWell(
                                        onTap: () {
                                          widget.input = '';
                                          widget.hasPoint = false;
                                          _onChanged();
                                        },
                                        child: Icon(
                                          Icons.close,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        indent: 16,
                        endIndent: 16,
                        color: kLightColor,
                      ),
                    ),
                    Text(
                      'to',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        height: 2,
                        thickness: 2,
                        indent: 16,
                        endIndent: 16,
                        color: kLightColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    // border: Border.all(
                    //   color: Colors.white,
                    //   width: 1.0,
                    // ),
                    borderRadius: BorderRadius.circular(10.0),
                    color: kLightColor,
                    // bord
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (c) => AlertDialog(
                              title: Text('Select Currency'),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: _dialogBtns(),
                                ),
                              ),
                              actions: [
                                // ElevatedButton(
                                //   child: Text('Cancel'),
                                //   onPressed: () {
                                //     Navigator.of(context).pop();
                                //   },
                                // ),
                                ElevatedButton(
                                  child: Text('OK'),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            ),
                          ).then((value) => print(value));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: kLightColor,
                          shape: RoundedRectangleBorder(
                            // side: BorderSide(
                            //   color: kLightColor,
                            //   width: 1.0,
                            // ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: DefaultTextStyle(
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.convertTo,
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  // const SizedBox(width: 8.0),
                                  Icon(Icons.arrow_drop_down),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 12),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: kLightColor,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  widget.output != '' ? widget.output : '0',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          // flex: 3,
          child: Container(
            decoration: BoxDecoration(
              // border: Border.all(
              //   color: Colors.white,
              //   width: 1.0,
              // ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: kLightColor,
            ),
            child: Column(
              children: [
                Spacer(),
                getChildrens(),
                Spacer(),
              ],
            ),
            // child: GridView.count(
            //   shrinkWrap: true,
            //   crossAxisCount: 3,
            //   children: getChildrens(),
            //   physics: const NeverScrollableScrollPhysics(),
            //   padding: const EdgeInsets.all(8.0),
            //   // mainAxisSpacing: 16.0,
            //   // crossAxisSpacing: 16.0,
            //   childAspectRatio: 1.3,
            // ),
          ),
        ),
      ],
    );
  }

  _dialogBtns() {
    List<Widget> btns = [];
    for (var i in widget.data.keys) {
      btns.add(
        ListTile(
          title: Text(i),
          onTap: () {
            _onDialogListClick(i);
            Navigator.of(context).pop();
            _onChanged();
          },
        ),
      );
    }
    return btns;
  }

  _onDialogListClick(e) {
    setState(() {
      widget.convertTo = e;
      print(e);
    });
  }

  _onDelete() {
    setState(() {
      if (widget.input != '') {
        if (widget.input.split('').last == '.') {
          widget.hasPoint = false;
        }
        widget.input = widget.input.substring(0, widget.input.length - 1);
        if (widget.input == '0') {
          widget.input = '';
        }
      }
    });
    _onChanged();
  }

  _onChanged() {
    setState(() {
      print('w.in=${widget.input}');
      if (widget.input != '') {
        widget.output = (double.parse(widget.input) *
                widget.data[widget.convertTo] as double)
            .toStringAsFixed(2);
        print(widget.output);
        print(widget.input + '--' + widget.data[widget.convertTo].toString());
      } else {
        widget.output = '';
      }
    });
  }

  _onPressed(e) {
    setState(() {
      if (e == '.') {
        if (!widget.hasPoint) {
          if (widget.input == '') {
            widget.input = '0';
          }
          widget.input += e;
          widget.hasPoint = true;
        }
      } else {
        widget.input += e;
      }
    });
    _onChanged();
  }

  dynamic getChildrens() {
    return Column(
      children: [
        ['1', '2', '3'],
        ['4', '5', '6'],
        ['7', '8', '9'],
        ['.', '0', 'x']
      ]
          .map(
            (e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: e
                    .map(
                      (e) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: kLightColor,
                          shadowColor: Colors.transparent,
                          elevation: 0,
                        ),
                        onPressed: () {
                          (e == 'x') ? _onDelete() : _onPressed(e);
                          print(widget.input);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: (e == 'x')
                              ? Icon(
                                  Icons.backspace,
                                  size: 16,
                                )
                              : Text(
                                  e,
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: (e == '.' && widget.hasPoint)
                                        ? kLightColor
                                        : Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          )
          .toList(),
    );
  }
}
