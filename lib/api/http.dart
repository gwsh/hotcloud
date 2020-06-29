import 'package:dio/dio.dart';
import 'package:dio_log/interceptor/dio_log_interceptor.dart';
import 'package:hotcloud/common/urls.dart';

typedef Success = void Function(dynamic json);

typedef Fail = void Function(String reason, int code);

typedef After = void Function();

class Http {
  static Dio _dio;
  static Http https = Http();

  static Http getInstance() {
    return https;
  }

  Http() {
    if (_dio == null) {
      _dio = createDio();
    }
  }

  /// 简单dio 配置封装
  Dio createDio() {
    var dio = Dio(BaseOptions(
        connectTimeout: 30000,
        receiveTimeout: 30000,
        sendTimeout: 30000,
        baseUrl: Urls.BASE_URL,
        // TODO 后续 自定义选择
        responseType: ResponseType.json,
        headers: {
          "token": "12312",
        }));
    dio.interceptors.add(DioLogInterceptor());

    /// 拦截器
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      // 在请求被发送之前做一些事情
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (Response response) async {
      // 在返回响应数据之前做一些预处理
    }, onError: (DioError e) async {
      // 当请求失败时做一些预处理
    }));
    return dio;
  }

  /// get 请求
  Future<void> get(String uri, Map<String, dynamic> params,
      {Success success, Fail fail, After after}) {
    _dio.get(uri, queryParameters: params).then((resp) {
      if (resp.statusCode == 200) {
        if (success != null) {
          success(resp.data);
        }
      } else {
        if (fail != null) {
          fail(resp.statusMessage, resp.statusCode);
        }
      }
      if (after != null) {
        after();
      }
    });
    return Future.value();
  }
}
