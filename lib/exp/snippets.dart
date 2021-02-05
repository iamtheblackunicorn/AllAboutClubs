/*new Card(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10.0)),
  child: Column(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      new Text('The Enchanted Nightingale'),
      new Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container (
            margin: EdgeInsets.all(choiceButtonMargin),
            child: new RaisedButton(
              color: accentColor,
              child: Text('Detailansicht',
                style: TextStyle(
                  color:  defaultBackGroundColor,
                  fontSize: defaultFontSize,
              )),
              padding: EdgeInsets.all(choiceButtonPadding),
              onPressed: () {})
          ),
          SizedBox(height: choiceButtonMargin)
        ]
      )
    ]
  )
)*/

/*class ClubOverview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final items = List<String>.generate(10, (i) => "Item $i");
    return Scaffold(
      backgroundColor: defaultBackGroundColor,
      appBar: AppBar(
        title: new Text('Club Uebersicht',
        style: TextStyle(
          color: defaultBackGroundColor,
          fontSize: defaultFontSize)
        ),
        backgroundColor: accentColor
      ),
      body: new ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${items[index]}'),
          );
        },
      ),
    );
  }
}*/




import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ext_storage/ext_storage.dart';
import 'dart:io';
import 'package:permission_handler/permission_handler.dart';

final imgUrl =
    "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf";

var dio = Dio();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void getPermission() async {
    print("getPermission");
    Map<PermissionGroup, PermissionStatus> permissions =
        await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  Future download2(Dio dio, String url, String savePath) async {
    try {
      Response response = await dio.get(
        url,
        onReceiveProgress: showDownloadProgress,
        //Received data with List<int>
        options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            validateStatus: (status) {
              return status < 500;
            }),
      );
      print(response.headers);
      File file = File(savePath);
      var raf = file.openSync(mode: FileMode.write);
      // response.data is List<int> type
      raf.writeFromSync(response.data);
      await raf.close();
    } catch (e) {
      print(e);
    }
  }

  void showDownloadProgress(received, total) {
    if (total != -1) {
      print((received / total * 100).toStringAsFixed(0) + "%");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton.icon(
                onPressed: () async {
                  String path =
                      await ExtStorage.getExternalStoragePublicDirectory(
                          ExtStorage.DIRECTORY_DOWNLOADS);
                  //String fullPath = tempDir.path + "/boo2.pdf'";
                  String fullPath = "$path/test.pdf";
                  print('full path ${fullPath}');

                  download2(dio, imgUrl, fullPath);
                },
                icon: Icon(
                  Icons.file_download,
                  color: Colors.white,
                ),
                color: Colors.green,
                textColor: Colors.white,
                label: Text('Dowload')),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
