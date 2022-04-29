
import 'package:dio/dio.dart';

import '../services/local_storage_service.dart';

Dio _initDio() {
  final headers = <String, dynamic>{};
  final options = BaseOptions(
      baseUrl: 'http://api.commoditygrowth.com/api/v5/',
      headers: headers,
      connectTimeout: 5000,
      receiveTimeout: 10000);
  Dio dio =  Dio(options);
  dio.interceptors.add(_CustomInterceptor(dio));
  return dio;
}

class _CustomInterceptor extends Interceptor {
  final Dio dio;

  _CustomInterceptor(this.dio);

  // @override
  // onRequest(RequestOptions options) async {
  //   final authorization = await localStorageService.getAuthorization();
  //   if (authorization != null) {
  //     options.headers['Authorization'] = authorization;
  //   }
  //   return super.onRequest(options);

  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) async{
    final authrization = await localStorageService.getAuthorization();

    if(authrization != null){
      options.headers['Authorization'] = authrization;
    }
    return super.onRequest(options, handler);
  }
  

  @override

   onResponse(Response response, ResponseInterceptorHandler handler) {
    return super.onResponse(response, handler);
  }
  

  @override

  onError(DioError err, ErrorInterceptorHandler handler)async {
      if (err.response != null &&
        err.response.statusCode == 401 &&
        await localStorageService.getProfile() != null) {
      print('Please handle 401');
      print(err);
    return super.onError(err, handler);
  }

  // @override
  // onResponse(Response response) {
  //   return super.onResponse(response);
  // }

  // @override
  // onError(DioError err) async {
  //   if (err.response != null &&
  //       err.response.statusCode == 401 &&
  //       await localStorageService.getProfile() != null) {
  //     print('Please handle 401');
  //   }
  //   print(err);
  //   return super.onError(err);
  // }
}

}
final Dio dio = _initDio();
