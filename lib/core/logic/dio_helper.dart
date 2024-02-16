// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class DioHelper {
  static final dio =
      Dio(BaseOptions(baseUrl: "https://thimar.amr.aait-d.com/public/api/"));
  static Future<CustomRespones> SentData(String endpoint,
      {Map<String, dynamic>? data}) async {
    print(data);

    try {
      Response response = await dio.post(endpoint, data: data);
      print(response.data);
      return CustomRespones(
          massage: response.data["massegs"],
          isSuccess: true,
          response: response);
    }
     on DioException catch (ex) {
      print(ex.message);
      print(ex.response?.statusMessage);
      return CustomRespones(
          massage: ex.response?.data?? "", isSuccess: false);
    }
  }
}

class CustomRespones {
  final Response? response;
  final String? massage;
  final bool isSuccess;
  CustomRespones({
    this.response,
    required this.massage,
    required this.isSuccess,
  });
}
