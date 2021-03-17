import 'constants.dart';
import 'apiHandler.dart';
import 'postDetailView.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PostOverview extends StatefulWidget {
  final APIStorage apistorage;
  PostOverview({Key key, @required this.apistorage}) : super(key: key);
  @override
  PostOverviewState createState() => PostOverviewState();
}
class PostOverviewState extends State<PostOverview> {
  Future<List<dynamic>> postDB;
  bool sorted;
  @override
  void initState() {
    super.initState();
    postDB = widget.apistorage.readCounter();
    setState((){
      bool sorted = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    String worthLabel = AppLocalizations.of(context).worthLabel;
    String errorString = AppLocalizations.of(context).errorLabel;
    return FutureBuilder<List<dynamic>> (
      future: postDB,
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting){
          return  Scaffold(
            appBar:AppBar(
              iconTheme: IconThemeData(
                color: mainColor,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    AppLocalizations.of(context).postOverViewScreen,
                    style: TextStyle(
                      color: mainColor,
                      fontSize: stdFontSize,
                      fontFamily: defaultFont
                    ),
                  ),
                ]
              ),
              backgroundColor: accentColor
            ),
            backgroundColor: mainColor,
            body: Center(
              child: Column(
                children: <Widget> [
                  new SizedBox(
                    height: miscScreenSpacing
                  ),
                  new LoadingBouncingGrid.circle(
                    size: miscScreenIconSize,
                    backgroundColor: accentColor,
                  )
                ]
              )
            )
          );
        }
        else {
          if (snapshot.hasError) {
            return  Scaffold(
              appBar:AppBar(
                iconTheme: IconThemeData(
                  color: mainColor,
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      AppLocalizations.of(context).postOverViewScreen,
                      style: TextStyle(
                        color: mainColor,
                        fontSize: stdFontSize,
                        fontFamily: defaultFont
                      ),
                    ),
                  ]
                ),
                backgroundColor: accentColor
              ),
              backgroundColor: mainColor,
              body: Center(
                child: Column(
                  children: <Widget> [
                    new SizedBox(
                      height: miscScreenSpacing
                    ),
                    new Icon(
                      Icons.warning,
                      color: accentColor,
                      size: miscScreenIconSize,
                    ),
                    new Text(
                      '$errorString',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.bold,
                        fontSize: stdFontSize,
                        fontFamily: defaultFont
                      ),
                    )
                  ]
                )
              )
            );
          }
          else {
            List<dynamic> newData = snapshot.data;
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
                      color: mainColor,
                      fontSize: secondaryHeadingFontSize,
                      fontFamily: defaultFont
                    ),
                  ),
                ]
              ),
              actions: <Widget>[
                  new Padding(
                    padding: EdgeInsets.only(right: stdPadding),
                    child: IconButton(
                      icon: Icon(
                        Icons.sync_sharp,
                        color: mainColor,
                        size: stdIconSize,
                      ),
                      onPressed: () {
                        setState((){
                          postDB = widget.apistorage.readCounter();
                        });
                      },
                    ),
                  ),
                  new Padding(
                    padding: EdgeInsets.only(right: stdPadding),
                    child: IconButton(
                      icon: Icon(
                        Icons.unfold_more_outlined,
                        color: mainColor,
                        size: stdIconSize,
                      ),
                      onPressed: () {
                        //changeSortedStatus(sorted);
                      },
                    ),
                  )
                ],
              backgroundColor: accentColor
            ),
            backgroundColor: mainColor,
            body:new ListView.builder(
              itemCount: newData.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> currentClub = newData[index];
                String pictureUrl = currentClub['image'];
                String netWorth = (currentClub['value']).toString();
                String clubCountry = currentClub['country'];
                String clubName = currentClub['name'];
                return new SizedBox(
                  width:
                  stdWidth,
                  child: Card(
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
                                height: iconImageSize,
                                width: iconImageSize,
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
                                    color: tertiaryColor,
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
                                    color: tertiaryColor,
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
                                    color: tertiaryColor,
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
                                  MaterialPageRoute(builder: (context) => PostDetailView(apistorage: APIStorage(), clubMap: currentClub)),
                                );
                              }
                            )
                          ),
                          SizedBox(height: stdPadding)
                        ]
                      )
                    ]
                  )
                )
              );
            },
          ),
        );
      }
    }
  }
);}}
