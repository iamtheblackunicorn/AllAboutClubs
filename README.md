<p align="center">
 <img src="https://github.com/iamtheblackunicorn/AllAboutClubs/raw/main/android/app/src/main/res/mipmap-xxxhdpi/ic_launcher.png"/>
</p>

# All About Clubs :soccer:

## About :books:

*All About Clubs* is an app to list football clubs and their respective net worth and number of achieved European titles. This app was a hiring project by All About Apps, an Austrian company I applied to for the position as a Flutter app developer. At the time, I didn't get the job. Now, however, I hope this coding project might help other people who want to learn more about Flutter and how to work with JSON APIs. Explore, download, and enjoy. Tried and tested on Android 6 and Android 10. Development time: 8 hours.

## Download :inbox_tray:

- Version 1.0.0: [Download](https://github.com/iamtheblackunicorn/AllAboutClubs/releases/download/v.1.0.0/AllAboutClubs-v.1.0.0-Release.apk) (17.4 MB)

## Building :hammer:

Make sure that you have the following programs installed:

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
keytool -genkey -v -keystore key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key
```

After having done that, move the keystore to `android/app` and fill in the fields for the keystore password in the file `android/app/key.properties`.

Finally, run these commands:

```bash
$ flutter pub get
$ flutter build apk
```

You have now generated a release build of *All About Clubs*.

## Note :scroll:

- *All About Clubs* by Alexander Abraham a.k.a. :black_heart: *The Black Unicorn* :unicorn:
- licensed under the MIT license
