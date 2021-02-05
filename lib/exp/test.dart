import 'dart:io';
import 'dart:convert';
Map<String,dynamic> getFileContents(String filePath) {
  var fileContents = new File(filePath).readAsStringSync();
  var jsonResult = json.decode(fileContents);
  return jsonResult;
}
void main(){
  print(getFileContents('test.json'));
}
