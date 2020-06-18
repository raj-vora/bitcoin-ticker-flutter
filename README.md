# Bitcoin Ticker 🤑

A new flutter application

## What I tried to create

A crypto currency price checking app. Monitor your bitcoin investents on the move!

![Finished App](https://github.com/londonappbrewery/Images/blob/master/bitcoin-flutter-demo.gif)

## Getting Started
* Install dependencies
```sh
    $ flutter pub get
```

* Add API key  
Go to [CoinApi](https://coinapi.io) and generate your free (100 requests daily) api key.  
Open `coin_data.dart` and replace your api key at  
```
const apiKey = 'ENTER_YOUR_API_KEY';
```

* Start building  
Use emulator or a physical device connected by USB
```sh
    $ flutter run
```

# Note:  
Make sure that device has an active internet connection.

* Create APK
```sh
    $ flutter build apk --split-per-abi
```

### Install for Android
- [64 bit apk](https://www.github.com/raj-vora/bitcoin-ticker-flutter/blob/master/apks/bitcoin-ticker-arm64.apk?raw=true)
- [32 bit apk](https://www.github.com/raj-vora/bitcoin-ticker-flutter/blob/master/apks/bitcoin-ticker-armeabi.apk?raw=true)

>This is a companion project to The App Brewery's Complete Flutter Development Bootcamp, check out the full course at [www.appbrewery.co](https://www.appbrewery.co/)