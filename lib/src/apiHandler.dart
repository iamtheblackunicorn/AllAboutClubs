import 'constants.dart';
import 'package:dio/dio.dart';
class APIStorage {
  Future<List<dynamic>> get _localFile async {
    try {
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    } catch (e) {
      Response response = await dio.get(
        apiUrl,
        options: Options(
          responseType: ResponseType.json,
          followRedirects: true,
          validateStatus: (status) { return status < 500; }
        ),
      );
      return response.data;
    }
  }
  Future<List<dynamic>> readCounter() async {
    Future<List<dynamic>> data = _localFile;
    return data;
  }
}
