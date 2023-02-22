import 'dart:io';
import 'package:projectify/rest/model/base_model.dart';
import 'package:projectify/rest/rest_constants.dart';
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

  // Future<void> _getLocalTimeZoneRegion() async {
  //   print('_getLocalTimeZoneRegion()');
  //   try {
  //     _timezone = await FlutterNativeTimezone.getLocalTimezone();
  //     print('Local timezone: $_timezone');
  //   } catch (e) {
  //     print('Could not get the local timezone');
  //   }
  // }

  Dio _dio() {
    return Dio(BaseOptions(
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        // 'Access-Control-Allow-Origin': '*',
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
      var resp = await _dio().post(
        url,
        data: data,
      );
      return ApiResponseModel(success: true, data: resp.data);
    } on DioError catch (e) {
      return ApiResponseModel(success: false, error: e.response?.data);
    }
  }

  Future<ApiResponseModel> get() async {
    try {
      var resp = await _dio().get(
        url,
        queryParameters: queryParameters,
      );
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

  // void post({
  //   RxBool? isLoading,
  //   required Function(dynamic data) onSuccess,
  //   Function(BaseErrorModel error)? onError,
  // }) async {
  //   print("POST $url");

  //   requestApiLogToAnalytics();

  //   print("data : ${data.toString()}");
  //   if(await AppUtils.checkIsNetworkConnected()) {
  //     changeLoadingStatus(isLoading, true);

  //     // await _getLocalTimeZoneRegion();
  //     try {
  //       var resp = await _dio().post(url, data: data,);
  //       changeLoadingStatus(isLoading, false);
  //         if (resp.statusCode == 200){
  //           print("onSuccess ${resp.data}");
  //           onSuccess(resp.data);
  //         }else{
  //             print("errorModel : ${resp.toString()}");
  //             errorApiLogToAnalytics(
  //                 parameters: {
  //                   'statusCode': resp.statusCode,
  //                   // 'status': BaseErrorModel.fromJson(resp.data).status ?? false,
  //                   'message': BaseErrorModel.fromJson(resp.data).message ?? "Something went wrong"}
  //             );
  //             if (onError != null){
  //               onError(BaseErrorModel.fromJson(resp.data));
  //             }else {
  //               DialogUtil.errorAlertDialog(message: BaseErrorModel
  //                   .fromJson(resp.data)
  //                   .message ?? "Something went wrong");
  //             }
  //           // }
  //         }

  //     }on DioError catch (e) {
  //       print("e.message ${e.message}");
  //       changeLoadingStatus(isLoading, false);
  //       errorApiLogToAnalytics(parameters: {'message': e.message});
  //       if(e.response != null && ((e.response?.statusCode ?? 0) <= 500)){
  //         print("e.response ${e.response}");
  //         if(BaseErrorModel.fromJson(e.response?.data).name != "UnauthorizedError" && BaseErrorModel.fromJson(e.response?.data).name != "ForbiddenError") {
  //           if (onError != null) {
  //             print("onError != null");
  //             print("onError ${e.response?.data}");
  //             onError(BaseErrorModel.fromJson(e.response?.data));
  //           } else {
  //             DialogUtil.errorAlertDialog(message: BaseErrorModel
  //                 .fromJson(e.response?.data)
  //                 .message ?? "Something went wrong");
  //           }
  //         }else if(BaseErrorModel.fromJson(e.response?.data).name != "ForbiddenError"){
  //           forBiddenLogoutNow();
  //         }else{
  //           Get.find<DashboardScreenController>().selectedIndex.value = 0;
  //           AppSharedPreferenceUtils.clearDataForLogout();
  //           Get.to(() => LoginScreen(isLoggedOut: true,));
  //         }
  //       }else{
  //         if (onError != null && e.response!= null){
  //           print("onError !null ${e.response?.data.toString()}");
  //           onError(BaseErrorModel(name: "Service", status: "error", message: "Something went wrong."));
  //         }
  //       }
  //     } catch (e) {
  //       print("e.response other catch $e");
  //       if (onError != null){
  //         onError(BaseErrorModel.fromJson(e));
  //       }
  //     }
  //   }else{
  //     changeLoadingStatus(isLoading, false);
  //     if (onError != null) onError(BaseErrorModel(status: "error", name: "NoInternet", message: "Please check your Internet connection"));
  //     AppUtils.showNoInternetDialog();
  //   }
  // }

  // void put({
  //   RxBool? isLoading,
  //   required Function(dynamic data) onSuccess,
  //   Function(BaseErrorModel error)? onError,
  // }) async {
  //   print("PUT $url");

  //   requestApiLogToAnalytics();

  //   print("data : ${data.toString()}");
  //   if(await AppUtils.checkIsNetworkConnected()) {
  //     changeLoadingStatus(isLoading, true);

  //     // await _getLocalTimeZoneRegion();
  //     try {
  //       var resp = await _dio().put(url, data: data,);
  //       changeLoadingStatus(isLoading, false);
  //         if (resp.statusCode == 200){
  //           print("onSuccess ${resp.data}");
  //           // onSuccess(resp.data);
  //           onSuccess("<html>");
  //         }else{
  //             print("errorModel : ${resp.toString()}");
  //             errorApiLogToAnalytics(
  //                 parameters: {
  //                   'statusCode': resp.statusCode,
  //                   // 'status': BaseErrorModel.fromJson(resp.data).status ?? false,
  //                   'message': BaseErrorModel.fromJson(resp.data).message ?? "Something went wrong"}
  //             );
  //             if (onError != null){
  //               onError(BaseErrorModel.fromJson(resp.data));
  //             }else {
  //               DialogUtil.errorAlertDialog(message: BaseErrorModel
  //                   .fromJson(resp.data)
  //                   .message ?? "Something went wrong");
  //             }
  //           // }
  //         }

  //     }on DioError catch (e) {
  //       print("e.message ${e.message}");
  //       changeLoadingStatus(isLoading, false);
  //       errorApiLogToAnalytics(parameters: {'message': e.message});
  //       if(e.response != null && ((e.response?.statusCode ?? 0) <= 500)){
  //         print("e.response ${e.response}");
  //         if(BaseErrorModel.fromJson(e.response?.data).name != "UnauthorizedError" && BaseErrorModel.fromJson(e.response?.data).name != "ForbiddenError") {
  //           if (onError != null){
  //             print("onError != null");
  //             onError(BaseErrorModel.fromJson(e.response?.data));
  //           }else{
  //             DialogUtil.errorAlertDialog(message: BaseErrorModel.fromJson(e.response?.data).message ?? "Something went wrong");
  //           }
  //         }else if(BaseErrorModel.fromJson(e.response?.data).name != "ForbiddenError"){
  //           forBiddenLogoutNow();
  //         }else{
  //           Get.find<DashboardScreenController>().selectedIndex.value = 0;
  //           AppSharedPreferenceUtils.clearDataForLogout();
  //           Get.to(() => LoginScreen(isLoggedOut: true,));
  //         }
  //       }else{
  //         if (onError != null && e.response!= null){
  //           print("onError !null ${e.response?.data.toString()}");
  //           onError(BaseErrorModel(name: "Service", status: "error", message: "Something went wrong."));
  //         }
  //       }
  //     } catch (e) {
  //       print("e.response other catch $e");
  //       if (onError != null){
  //         onError(BaseErrorModel.fromJson(e));
  //       }
  //     }

  //   }else{
  //     changeLoadingStatus(isLoading, false);
  //     if (onError != null) onError(BaseErrorModel(status: "error", name: "NoInternet", message: "Please check your Internet connection"));
  //     AppUtils.showNoInternetDialog();
  //   }
  // }

  // void delete({
  //   RxBool? isLoading,
  //   required Function(dynamic data) onSuccess,
  //   Function(BaseErrorModel error)? onError,
  // }) async {
  //   print("PUT $url");

  //   requestApiLogToAnalytics();

  //   print("data : ${data.toString()}");
  //   if(await AppUtils.checkIsNetworkConnected()) {
  //     changeLoadingStatus(isLoading, true);

  //     // await _getLocalTimeZoneRegion();
  //     try {
  //       var resp = await _dio().delete(url, data: data,);
  //       changeLoadingStatus(isLoading, false);
  //       if (resp.statusCode == 200){
  //         print("onSuccess ${resp.data}");
  //         onSuccess(resp.data);
  //       }else{
  //         print("errorModel : ${resp.toString()}");
  //         errorApiLogToAnalytics(
  //             parameters: {
  //               'statusCode': resp.statusCode,
  //               // 'status': BaseErrorModel.fromJson(resp.data).status ?? false,
  //               'message': BaseErrorModel.fromJson(resp.data).message ?? "Something went wrong"}
  //         );
  //         if (onError != null){
  //           onError(BaseErrorModel.fromJson(resp.data));
  //         }else {
  //           DialogUtil.errorAlertDialog(message: BaseErrorModel
  //               .fromJson(resp.data)
  //               .message ?? "Something went wrong");
  //         }
  //         // }
  //       }

  //     }on DioError catch (e) {
  //       print("e.message ${e.message}");
  //       changeLoadingStatus(isLoading, false);
  //       errorApiLogToAnalytics(parameters: {'message': e.message});
  //       if(e.response != null && ((e.response?.statusCode ?? 0) <= 500)){
  //         print("e.response ${e.response}");
  //         if(BaseErrorModel.fromJson(e.response?.data).name != "UnauthorizedError" && BaseErrorModel.fromJson(e.response?.data).name != "ForbiddenError") {
  //           if (onError != null){
  //             print("onError != null");
  //             print("onError !null ${e.response?.data.toString()}");
  //             onError(BaseErrorModel.fromJson(e.response?.data));
  //           }else{
  //             DialogUtil.errorAlertDialog(message: BaseErrorModel.fromJson(e.response?.data).message ?? "Something went wrong");
  //           }
  //         }else if(BaseErrorModel.fromJson(e.response?.data).name != "ForbiddenError"){
  //           forBiddenLogoutNow();
  //         }else{
  //           Get.find<DashboardScreenController>().selectedIndex.value = 0;
  //           AppSharedPreferenceUtils.clearDataForLogout();
  //           Get.to(() => LoginScreen(isLoggedOut: true,));
  //         }
  //       }else{
  //         if (onError != null && e.response!= null){
  //           print("onError !null ${e.response?.data.toString()}");
  //           onError(BaseErrorModel(name: "Service", status: "error", message: "Something went wrong."));
  //         }
  //       }
  //     } catch (e) {
  //       print("e.response other catch $e");
  //       if (onError != null){
  //         onError(BaseErrorModel.fromJson(e));
  //       }
  //     }

  //   }else{
  //     changeLoadingStatus(isLoading, false);
  //     if (onError != null) onError(BaseErrorModel(status: "error", name: "NoInternet", message: "Please check your Internet connection"));
  //     AppUtils.showNoInternetDialog();
  //   }
  // }

  // void requestApiLogToAnalytics() async {
  //   if(!kIsWeb) {
  //     await AppFirebaseAnalyticsService.onApiRequestCalled(
  //         name: "api_request_${url.substring((url.lastIndexOf('/') + 1), url.length)}",
  //         parameters: data is dio.FormData ? getMapOfFormData((data as dio.FormData)) : data
  //     );
  //   }
  // }

  // Map<String, Object?>? getMapOfFormData(dio.FormData formData){
  //   Map<String, Object?> map = {};

  //   formData.files.asMap().forEach((key, value) {
  //     map[value.key] = value.value.filename;
  //   });

  //   formData.fields.asMap().forEach((key, value) {
  //     map[value.key] = value.value;
  //   });

  //   return map;

  // }

  // void errorApiLogToAnalytics({Map<String, Object?>? parameters}) async {
  //   if(!kIsWeb) {
  //     await AppFirebaseAnalyticsService.onApiRequestCalled(
  //         name: "api_error_${url.substring(
  //             (url.lastIndexOf('/') + 1), url.length)}",
  //         parameters: parameters
  //     );
  //   }
  // }

  // void changeLoadingStatus(RxBool? isLoading,bool status){
  //   if(isLoading != null){
  //     isLoading.value = status;
  //   }
  // }

  // forBiddenLogoutNow(){
  //   UserProfileProvide().userLogout(
  //     onSuccess: (response) {
  //       Get.find<DashboardScreenController>().selectedIndex.value = 0;
  //       AppSharedPreferenceUtils.clearDataForLogout();
  //       Get.to(() => LoginScreen(isLoggedOut: true,));
  //     },
  //     onError: (error) {
  //       print("error-error: ${error.toString()}");
  //       if(error.name == "InternalServerError"){
  //         DialogUtil.errorAlertDialog(message: error.message ?? strSomethingWentWrong);
  //       }
  //     },
  //   );
  // }
}
