import 'dart:convert';
import 'constants.dart';
import 'apiHandler.dart';
import 'postDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PostOverview extends StatefulWidget {
  final APIStorage apistorage;
  PostOverview({Key key, @required this.apistorage}) : super(key: key);
  @override
  PostOverviewState createState() => PostOverviewState();
}
class PostOverviewState extends State<PostOverview> {
  List<dynamic> postDB;
  @override
  void initState() {
    super.initState();
    widget.apistorage.readCounter().then((var value) {
      setState(() {
        postDB = value;

        if (postDB == null){
          postDB = defaultMap;
        } else {}
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    String worthLabel = AppLocalizations.of(context).worthLabel;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: mainColor,
        ),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            new Text(
              AppLocalizations.of(context).postOverViewScreen,
              style: TextStyle(
                color: accentColor,
                fontSize: stdFontSize,
                fontFamily: defaultFont
              ),
            ),
          ]
        ),
        backgroundColor: mainColor
      ),
      backgroundColor: mainColor,
      body:new ListView.builder(
        itemCount: postDB.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> currentClub = postDB[index];
          String pictureUrl = currentClub['image'];
          String netWorth = (currentClub['value']).toString();
          String clubCountry = currentClub['country'];
          String clubName = currentClub['name'];

          return new SizedBox(width: stdWidth, child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(stdRounding)
            ),
            color: mainColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: EdgeInsets.all(stdPadding),
                      child:new Image.network(
                        pictureUrl,
                        height: 150,
                        width: 150,
                      )
                    ),
                    new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Text(
                            '$clubName',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: accentColor,
                              fontWeight: FontWeight.bold,
                              fontSize: stdFontSize,
                              fontFamily: defaultFont
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Text(
                            '$clubCountry',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: accentColor,
                              fontSize: stdFontSize,
                              fontFamily: defaultFont
                            ),
                          ),
                        ),
                        new Padding(
                          padding: EdgeInsets.all(cardPadding),
                          child: Text(
                            '$netWorth $worthLabel',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              color: accentColor,
                              fontSize: stdFontSize,
                              fontFamily: defaultFont
                            ),
                          ),
                        )
                      ]
                    )
                  ]
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: EdgeInsets.all(cardPadding),
                      child: new RaisedButton(
                        color: accentColor,
                        child: Text(
                          AppLocalizations.of(context).readLabel,
                          style: TextStyle(
                            color: mainColor,
                            fontSize: stdFontSize,
                            fontFamily: defaultFont
                          )
                        ),
                        padding: EdgeInsets.all(stdPadding),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => PostDetailView(apistorage: APIStorage(), currentClub: currentClub)),
                          );
                        }
                      )
                    ),

                    SizedBox(height: stdPadding)
                  ]
                )
              ]
            )
          ));


        },
      ),
    );
  }
}
