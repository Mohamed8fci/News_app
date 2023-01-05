import 'package:dio/dio.dart';

class DioHelper{

  static Dio dio = 0 as Dio;
  static init(){
    dio = Dio(
    BaseOptions(
      baseUrl: 'http://newsapi.org/',
      receiveDataWhenStatusError: true,

    ),
    );
  }
   static Future<Response> getData({
      required String url,
      required Map<String,dynamic> query,
    })async{
      return await dio.get(url,queryParameters: query);
    }

  
}
