import 'dart:convert';
import 'postList.dart';
import 'constants.dart';
import 'apiHandler.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PostDetailView extends StatefulWidget {
  final APIStorage apistorage;
  final Map<String,dynamic> currentClub;
  PostDetailView({Key key, @required this.apistorage, @required this.currentClub}) : super(key: key);
  @override
  PostDetailViewState createState() => PostDetailViewState();
}
class PostDetailViewState extends State<PostDetailView> {
  List<dynamic> postDB;
  Map<String,dynamic> club;
  @override
  void initState() {
    super.initState();
    widget.apistorage.readCounter().then((dynamic value) {
      setState(() {
        postDB = value;
      });
    });
    setState((){
      club = widget.currentClub;
    });
  }
  @override
  Widget build(BuildContext context) {
    String clubName = club['name'];
    String clubPicture = club['image'];
    String clubCountry = club['country'];
    String netWorth = (club['value']).toString();
    String europeanTitles = (club['european_titles']).toString();
    String worthLabel = AppLocalizations.of(context).worthLabel;
    String theClubLabel = AppLocalizations.of(context).theClubLabel;
    String fromLabel = AppLocalizations.of(context).fromLabel;
    String worthLabelString = AppLocalizations.of(context).worthLabelString;
    String achievmentLabel = AppLocalizations.of(context).achievmentLabel;
    String euroTitles = AppLocalizations.of(context).euroTitles;
    String infoText = '$theClubLabel $clubName $fromLabel\n$clubCountry $worthLabelString $netWorth\n$worthLabel. $theClubLabel $achievmentLabel\n$europeanTitles $euroTitles.';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: accentColor,
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              '$clubName',
              style: TextStyle(
                color: mainColor,
                fontSize: stdFontSize,
                fontFamily: defaultFont
              ),
            ),
          ]),
          backgroundColor: accentColor
        ),
        backgroundColor: mainColor,
        body: SingleChildScrollView(child: Center(
          child: Column(
            children: <Widget>[
              new Stack(
                children: <Widget>[
                  Image.network(
                    '$clubPicture',
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
                        padding: EdgeInsets.all(stdPadding),
                        child: Text(
                          '$clubCountry',
                          style: TextStyle(
                            color: accentColor,
                            fontWeight: FontWeight.bold,
                            fontSize: postHeadingFontSize,
                            fontFamily: defaultFont
                          ),
                        )
                      )
                    )
                  )
                ]
              ),
              new Padding(
                padding: EdgeInsets.all(stdPadding),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height:stdSpacing),
                    Padding(padding: EdgeInsets.all(stdPadding), child:
                    new Text(
                      '$infoText',
                      style: TextStyle(
                        color: tertiaryColor,
                        fontSize: stdFontSize,
                        fontFamily: defaultFont
                      )
                    ))
                  ]

                )
              ),
            ]
          )
        ))
      );
    }
  }
