import 'dart:io';
import 'package:projectify/preference/shared_preference.dart';
import 'package:projectify/rest/model/base_model.dart';
import 'package:dio/dio.dart';

class ApiRequest {
  final String url;
  final dynamic data;
  final dynamic queryParameters;

  ApiRequest({
    required this.url,
    this.data,
    this.queryParameters,
  });

  Future<Dio> _dio() async {
    final preference = await SharedPreferencesClass.getSharePreference();
    final String token = preference?.token ?? '';
    return Dio(BaseOptions(
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        ...token.isNotEmpty
            ? {HttpHeaders.authorizationHeader: "Bearer $token"}
            : {},
      },
      // baseUrl: RestConstants.baseURL,
      followRedirects: true,
      connectTimeout: 60 * 1000, // 60 seconds
      receiveTimeout: 60 * 1000, // 60 seconds
      validateStatus: (status) {
        return status! <= 400;
      },
    ));
  }

  Future<ApiResponseModel> post() async {
    try {
      var resp = await (await _dio()).post(
        url,
        data: data,
      );
      if (resp.statusCode! < 400) {
        return ApiResponseModel(success: true, data: resp.data);
      } else {
        return ApiResponseModel(success: false, error: resp.data);
      }
    } on DioError catch (e) {
      return ApiResponseModel(success: false, error: e.response?.data);
    }
  }

  Future<ApiResponseModel> put() async {
    try {
      var resp = await (await _dio()).put(
        url,
        data: data,
        queryParameters: queryParameters,
      );
      if (resp.statusCode! < 400) {
        return ApiResponseModel(success: true, data: resp.data);
      } else {
        return ApiResponseModel(success: false, error: resp.data);
      }
      ;
    } on DioError catch (e) {
      return ApiResponseModel(success: false, error: e.response?.data);
    }
  }

  Future<ApiResponseModel> get() async {
    try {
      var resp = await (await _dio()).get(url,
          queryParameters: queryParameters,
          options: Options(headers: {
            HttpHeaders.contentTypeHeader: "multipart/form-data",
          }));
      if (resp.statusCode! < 400) {
        return ApiResponseModel(success: true, data: resp.data);
      } else {
        return ApiResponseModel(success: false, error: resp.data);
      }
    } on DioError catch (e) {
      return ApiResponseModel(success: false, error: e.response?.data);
    } catch (e) {
      return ApiResponseModel(success: false, error: {
        "message": e.toString(),
        "status": "error",
        "name": e.toString(),
      });
    }
  }
}
