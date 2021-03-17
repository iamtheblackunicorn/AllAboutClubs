import 'postList.dart';
import 'constants.dart';
import 'apiHandler.dart';
import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class PostDetailView extends StatefulWidget {
  final APIStorage apistorage;
  final Map<String, dynamic> clubMap;
  PostDetailView({Key key, @required this.apistorage, @required this.clubMap}) : super(key: key);
  @override
  PostDetailViewState createState() => PostDetailViewState();
}
class PostDetailViewState extends State<PostDetailView> {
  Future<List<dynamic>> postDB;
  Map<String, dynamic> clubData;
  @override
  void initState() {
    super.initState();
    postDB = widget.apistorage.readCounter();
    clubData = widget.clubMap;
  }
  @override
  Widget build(BuildContext context) {
    String errorString = AppLocalizations.of(context).errorLabel;
    return FutureBuilder<List<dynamic>>(
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
            Map<String, dynamic> club = clubData;
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
                  color: mainColor,
                ),
                title: new Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Text(
                      '$clubName',
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
                ],
                backgroundColor: accentColor
              ),
              backgroundColor: mainColor,
              body: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: <Widget>[
                      new Stack(
                        children: <Widget>[
                          Image.network(
                            '$clubPicture',
                            height: bannerImageSize,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                          new Positioned(
                            bottom: stackElevation,
                            left: stackElevation,
                            child: Align(
                              alignment: Alignment((-1 * alignmentConstant), alignmentConstant),
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
                            Padding(
                              padding: EdgeInsets.all(stdPadding),
                              child:new Text(
                                '$infoText',
                                style: TextStyle(
                                  color: tertiaryColor,
                                  fontSize: stdFontSize,
                                  fontFamily: defaultFont
                                )
                              )
                            )
                          ]
                        )
                      ),
                    ]
                  )
                )
              )
            );
          }
        }
      }
    );
  }
}
