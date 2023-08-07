import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:marriage_story_mobile/utils/storage.dart';
import 'package:marriage_story_mobile/constants/string.dart';

class BaseService extends GetConnect implements GetxService {
  @override
  void onInit() {
    final token = Storage.getValue(storageToken);

    httpClient.baseUrl = baseURLAPI;
    // httpClient.defaultContentType = "application/json";
    httpClient.timeout = const Duration(seconds: 8);

    httpClient.addRequestModifier((Request request) {
      request.headers['Authorization'] = "Bearer $token";
      return request;
    });

    var headers = {'Authorization': "Bearer $token"};

    httpClient.addAuthenticator((Request request) async {
      request.headers.addAll(headers);
      return request;
    });

    httpClient.maxAuthRetries = 3;
    super.onInit();
  }
}