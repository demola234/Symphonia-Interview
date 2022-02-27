import 'package:dio/dio.dart';
import 'package:symfonia/models/coin_response.dart';

class FetchCoinRepository {
  static String mainUrl = "https://api.coingecko.com/api/v3";

  Dio _dio = Dio();
  var getCoinsUrl = "$mainUrl/coins/markets";

  Future<CoinResponse> getCoinData() async {
    var parmas = {
      "vs_currency": "usd",
      "order": "market_cap_desc",
      "per_page": 100,
      "page": 1,
      "sparkline": false
    };
    try {
      _dio.interceptors.clear();
      _dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
        // ignore: deprecated_member_use
        _dio.interceptors.requestLock.unlock();
        return handler.next(options);
      }));
      Response response = await _dio.get(getCoinsUrl, queryParameters: parmas);
      print(response.data);
      return CoinResponse.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return CoinResponse.withError(e.toString());
    }
  }
}
