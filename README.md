<p align="center">
 <img src="https://github.com/iamtheblackunicorn/AllAboutClubs/raw/main/assets/images/banner.png"/>
</p>

# All About Clubs :soccer:

*A Flutter app about football clubs.* :soccer:

## About :books:

*All About Clubs* is an app to list football clubs and their respective net worth and number of achieved European titles. I hope this coding project might help people who want to learn more about Flutter and how to work with JSON APIs. Explore, download, and enjoy.

## Download :inbox_tray:

- Version 1.0.0: 
  - [Download for Android](https://github.com/iamtheblackunicorn/AllAboutClubs/releases/download/v.1.0.0/AllAboutClubs-v.1.0.0-Release.apk) (17.4 MB)

- Version 1.1.0: 
  - [Download for Android](https://github.com/iamtheblackunicorn/AllAboutClubs/releases/download/v.1.1.0/AllAboutClubs-v.1.1.0-Release.apk) (17.2 MB)

## Building :hammer:

Make sure that you have the following programmes installed:

- Flutter SDK
- Dart SDK
- Android Studio
- Android SDK
- Java JDK
- Xcode
- Make
- Git

After you have installed these, run this command to generate a keystore for the app.

```bash
$ keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the generated Java keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *All About Clubs*.

## Extending the supported languages :book:

*All About Clubs* is localized for German and English. To add a language, simply create a filed called `app_languagecode.arb` in `lib/l10n` where `languagecode` represents the languagecode for the language you want to add. If it were Spanish for example, you would create a file called `app_es.arb`.
Copy and paste the contents from one of the other `*.arb` files and edit the strings accordingly.
Finally, add this line to the list `supportedLocales` in the file `lib/main.dart`.

```dart
const Locale('languagecode', ''),
```

`languagecode` represents the language you are translating for.

## Changelog :scroll:

### Version 1.0.0: The Overhaul

- upload to GitHub
- initial release

### Version 1.1.0: The Smoothness Update

- massive performance fixes
- loading animation for fetching content
- content-sorting and content-updating functionality
- shrunk down the code to the bare minimum
- modularity
- speed improvements

## Note :scroll:

- *All About Clubs :soccer:* by Alexander Abraham :black_heart: a.k.a. *"The Black Unicorn" :unicorn:*
- Licensed under the MIT license.
