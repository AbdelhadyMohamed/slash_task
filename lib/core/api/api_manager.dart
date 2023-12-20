import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../utils/constants.dart';

@singleton // used singleton design pattern (injectable package) to create only one object of api manager class
class ApiManager {
  late Dio dio;
  ApiManager() {
    dio = Dio();
  }
  Future<Response> getData(String endPoint) {
    return dio.get(Constants.baseUrl + endPoint);
  }
}
