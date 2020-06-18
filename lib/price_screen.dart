import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency='USD';
  Map<String, String> prices = {
    'BTC': '?',
    'ETH': '?',
    'LTC': '?'
  };

  void initState() {
    super.initState();
    getRate();
  }

  Future getRate() async {
    for(String crypto in cryptoList){
      String price = await CoinData().getCoinData(selectedCurrency ,crypto);
      setState(() {
        prices[crypto] = price;
      });
    }
  }

  DropdownButton<String> androidDropdown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: currenciesList.map((currency) {
        return DropdownMenuItem(
          child: Text(currency),
          value: currency,
        );
      }).toList(),
      onChanged: (value){
        setState(() {
          selectedCurrency = value;
          getRate();
        });
      }
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for(String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }
    
    return CupertinoPicker(
      backgroundColor: Colors.lightBlue,
      itemExtent: 30.0, 
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex]; 
          getRate(); 
        });
      }, 
      children: pickerItems,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(
            crypto: 'BTC',
            coinValue: prices['BTC'], 
            selectedCurrency: selectedCurrency
          ),
          CryptoCard(
            crypto: 'ETH',
            coinValue: prices['ETH'], 
            selectedCurrency: selectedCurrency
          ),
          CryptoCard(
            crypto: 'LTC',
            coinValue: prices['LTC'], 
            selectedCurrency: selectedCurrency
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}

class CryptoCard extends StatelessWidget { 
  final String coinValue, selectedCurrency, crypto;

  CryptoCard({@required this.crypto, @required this.coinValue, @required this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlueAccent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            '1 $crypto = $coinValue $selectedCurrency',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}