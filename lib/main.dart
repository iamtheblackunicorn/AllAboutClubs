import 'dart:io';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// Main entry point for the App.
void main() {
  runApp(MaterialApp(
    title: 'All About Clubs',
    home: AllAboutClubs(),
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: [const Locale('de', ''), const Locale('en', '')],
  ));
}

// API URL
String fileUrl = 'https://public.allaboutapps.at/hiring/clubs.json';
String fileName = 'clubs.json';

// Color variables
Color accentColor = Color(0xFF01C13B);
Color defaultBackGroundColor = Color(0xFFFFFFFF);
Color tertiaryAccentColor = Color(0xFF000000);

// Font size variables
double insetPadding = 20;
double titleFontSize = 30;
double defaultFontSize = 14;
double headingFontSize = 25;
double defaultComponentSpacing = 20;
double titleSpacing = 50;
double titleImageSpacing = 10;
double choiceButtonMargin = 10;
double choiceButtonPadding = 7;
double cardPadding = 8;
double listFontheadingSize = 15;
double clubNameheading = 25;

// To download a file. Doesn't work on Android locally.
downloadFile(String url, String fileName) async {
  final request = await HttpClient().getUrl(Uri.parse(url));
  final response = await request.close();
  response.pipe(File(fileName).openWrite());
}

// Return a map of the JSON API.
Map<String, dynamic> getFileMap(String filePath) {
  var fileContents = new File(filePath).readAsStringSync();
  var jsonResult = json.decode(fileContents);
  return jsonResult;
}

// "Home" Screen
class AllAboutClubs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: defaultBackGroundColor,
        body: Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          new Image(image: AssetImage('assets/images/logo.png')),
          SizedBox(height: titleImageSpacing),
          new Text('All About Clubs',
              textAlign: TextAlign.center,
              style: TextStyle(color: accentColor, fontSize: titleFontSize)),
          SizedBox(height: titleSpacing),
          new RaisedButton(
              color: accentColor,
              child: Text(AppLocalizations.of(context).overViewLabel,
                  style: TextStyle(
                    color: defaultBackGroundColor,
                    fontSize: defaultFontSize,
                  )),
              padding: EdgeInsets.all(insetPadding),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ClubOverview()),
                );
              }),
          SizedBox(height: defaultComponentSpacing),
          new RaisedButton(
              color: accentColor,
              child: Text(AppLocalizations.of(context).updateDatabaseString,
                  style: TextStyle(
                    color: defaultBackGroundColor,
                    fontSize: defaultFontSize,
                  )),
              padding: EdgeInsets.all(insetPadding),
              onPressed: () async {
                var tempDir = await getTemporaryDirectory();
                var tempDirPath = tempDir.path;
                var filePath = '$tempDirPath/$fileName';
                downloadFile(fileUrl, fileName);
                print(getFileMap(filePath));
              }),
          SizedBox(height: defaultComponentSpacing),
          new RaisedButton(
              color: accentColor,
              child: Text(AppLocalizations.of(context).endAppMessage,
                  style: TextStyle(
                    color: defaultBackGroundColor,
                    fontSize: defaultFontSize,
                  )),
              padding: EdgeInsets.all(insetPadding),
              onPressed: () {
                try {
                  exit(0);
                } catch (e) {}
              })
        ])));
  }
}

// Overview of all the clubs.
class ClubOverview extends StatefulWidget {
  @override
  ClubOverviewState createState() => new ClubOverviewState();
}

class ClubOverviewState extends State<ClubOverview> {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10, (i) => "Item $i");
    return Scaffold(
      backgroundColor: defaultBackGroundColor,
      appBar: AppBar(
          title: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Text(AppLocalizations.of(context).overViewLabel,
                    style: TextStyle(
                        color: defaultBackGroundColor,
                        fontSize: defaultFontSize)),
                SizedBox(width: 164),
                IconButton(
                  onPressed: () {
                    setState(() {
                      // change sorting order
                    });
                  },
                  icon: Icon(
                    Icons.sort,
                    color: defaultBackGroundColor,
                  ),
                  iconSize: 20.0,
                ),
              ]),
          backgroundColor: accentColor),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: new Image(
                              image: AssetImage('assets/images/ajax.png'),
                              width: 125)),
                      new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Padding(
                              padding: EdgeInsets.all(cardPadding),
                              child: Text(
                                'Ajax',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tertiaryAccentColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: listFontheadingSize),
                              ),
                            ),
                            new Padding(
                              padding: EdgeInsets.all(cardPadding),
                              child: Text(
                                'Niederlande',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: tertiaryAccentColor,
                                    fontSize: defaultFontSize),
                              ),
                            )
                          ])
                    ]),
                new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      new Container(
                          margin: EdgeInsets.all(choiceButtonMargin),
                          child: new RaisedButton(
                              color: accentColor,
                              child: Text(
                                  AppLocalizations.of(context)
                                      .detailViewMessage,
                                  style: TextStyle(
                                    color: defaultBackGroundColor,
                                    fontSize: defaultFontSize,
                                  )),
                              padding: EdgeInsets.all(choiceButtonPadding),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ClubDetailView()),
                                );
                              })),
                      SizedBox(height: choiceButtonMargin)
                    ])
              ]));
        },
      ),
    );
  }
}

// Detailed info about a club!
class ClubDetailView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String worthTemplateText = AppLocalizations.of(context).worthTemplateText;
    String currencyLabel = AppLocalizations.of(context).currencyLabel;
    String achievedMessage = AppLocalizations.of(context).achievedMessage;
    String titleMessage = AppLocalizations.of(context).titleMessage;
    return Scaffold(
        backgroundColor: defaultBackGroundColor,
        appBar: AppBar(
            title: new Text('Ajax Amsterdam',
                style: TextStyle(
                    color: defaultBackGroundColor, fontSize: defaultFontSize)),
            backgroundColor: accentColor),
        body: Center(
            child: Column(children: <Widget>[
          new Stack(children: <Widget>[
            Image(
              image: AssetImage('assets/images/ajax.png'),
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            new Positioned(
                bottom: 0.2,
                left: 0.2,
                child: Align(
                    alignment: Alignment(-0.8, 0.8),
                    child: Padding(
                        padding: EdgeInsets.all(cardPadding),
                        child: Text(
                          'Ajax Amsterdam',
                          style: TextStyle(
                              color: tertiaryAccentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: clubNameheading),
                        ))))
          ]),
          new Padding(
              padding: EdgeInsets.all(cardPadding),
              child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Text('$worthTemplateText 442 $currencyLabel',
                        style: TextStyle(
                            color: tertiaryAccentColor,
                            fontSize: defaultFontSize)),
                    new Text('Ajax Amsterdam $achievedMessage 4 $titleMessage',
                        style: TextStyle(
                            color: tertiaryAccentColor,
                            fontSize: defaultFontSize))
                  ])),
        ])));
  }
}
