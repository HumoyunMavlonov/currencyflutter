import 'package:dio/dio.dart';

import '../model/currency_model.dart';

abstract class ApiService{
  Future<List<CurrencyModel>> getCurrency();
}

class ApiServiceImpl extends ApiService{
  final _dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: 'https://cbu.uz',
        contentType: 'application/json',
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        // headers: {'Bearer token':'srafsfasrfgrsagdrhrther654r5h4d'},
        //    queryParameters: {'dfsd':'sdfds'}
      )
  );


  Future<List<CurrencyModel>> getCurrency() async {
    try {
      final response = await _dio.get('/uz/arkhiv-kursov-valyut/json/');
      print("#####################${(response.data as List).length}");
      return (response.data as List).map((e) => CurrencyModel.fromJson(e)).toList();
    } on DioException catch(e){
      return  [];
    }
  }

}