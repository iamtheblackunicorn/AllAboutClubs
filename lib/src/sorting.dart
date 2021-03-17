List<dynamic> sortListByValue(List<dynamic> data, String mapKey, bool topToBottom){
  List<dynamic> result = [];
  List<dynamic> imList = [];
  List<dynamic> values = [];
  if (topToBottom == true){
    for (int i = 0; i < data.length; i++){
      var reversed = data[i].map((k, v) => MapEntry(v, k));
      imList.add(reversed);
    }
    for (int x = 0; x < imList.length; x++){
      var myMap = imList[x];
      for (int y = 0; y < myMap.length; y++) {
        var key = myMap.keys.elementAt(y);
        if (myMap[key] == mapKey){
          values.add(key);
        }
        else {}
      }
    }
    values.sort((b, a) => a.compareTo(b));
    for (int z = 0; z < values.length; z++) {
      var value = values[z];
      for (int u = 0; u < imList.length; u++){
        var myMap = imList[u];
        if (myMap.containsKey(value) == true){
          var reversed = myMap.map((k, v) => MapEntry(v, k));
          Map<String, dynamic> resultMap = Map<String, dynamic>.from(reversed);
          result.add(resultMap);
        } else {}
      }
    }
  } else {
    for (int i = 0; i < data.length; i++){
      var reversed = data[i].map((k, v) => MapEntry(v, k));
      imList.add(reversed);
    }
    for (int x = 0; x < imList.length; x++){
      var myMap = imList[x];
      for (int y = 0; y < myMap.length; y++) {
        var key = myMap.keys.elementAt(y);
        if (myMap[key] == mapKey){
          values.add(key);
        }
        else {}
      }
    }
    values.sort();
    for (int z = 0; z < values.length; z++) {
      var value = values[z];
      for (int u = 0; u < imList.length; u++){
        var myMap = imList[u];
        if (myMap.containsKey(value) == true){
          var reversed = myMap.map((k, v) => MapEntry(v, k));
          Map<String, dynamic> resultMap = Map<String, dynamic>.from(reversed);
          result.add(resultMap);
        } else {}
      }
    }
  }
  return result;
}
Future<List<dynamic>> makeFutureList(List<dynamic> myData) async {
  return myData;
}
Future<List<dynamic>> sortListByValues(Future<List<dynamic>> myData, String key, boolHowToSort) async {
  List<dynamic> result = [];
  List<dynamic> input = await myData;
  if (boolHowToSort == true){
    result = sortListByValue(input, key, boolHowToSort);
  } else {
    result = sortListByValue(input, key, boolHowToSort);
  }
  return makeFutureList(result);
}
