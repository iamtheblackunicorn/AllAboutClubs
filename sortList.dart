List<dynamic> testData = [
  {
    "id": "e06096c1-73d7-4d0a-91ee-dc095aa4e743",
    "name": "Bayern München",
    "country": "Deutschland",
    "value": 760,
    "image": "https://public.allaboutapps.at/hiring/images/bayern-munich.png",
    "european_titles": 5,
    "stadium": {
      "size": 75021,
      "name": "Allianz Arena"
    },
    "location": {
      "lat": 48.21891,
      "lng": 11.62459
    }
  },
  {
    "id": "98c62c76-09f5-4a7b-a16a-08d6694a84a9",
    "name": "Real Madrid",
    "country": "Spanien",
    "value": 1023,
    "image": "https://public.allaboutapps.at/hiring/images/real-madrid.png",
    "european_titles": 13,
    "stadium": {
      "size": 81044,
      "name": "Estadio Santiago Bernabéu"
    },
    "location": {
      "lat": 40.4530512,
      "lng": -3.6875463
    }
  }
];

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
          result.add(reversed);
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
          result.add(reversed);
        } else {}
      }
    }
  }
  return result;
}

void main(){
  String keyOne = 'value';
  String keyTwo = 'name';
  print(sortListByValue(testData,keyOne, true));
  print(sortListByValue(testData,keyTwo, false));
}
