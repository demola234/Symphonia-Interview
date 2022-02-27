import 'package:symfonia/models/coin_model.dart';

class CoinResponse {
  final List<CoinModel> coins;
  final String error;

  CoinResponse(this.coins, this.error);

  CoinResponse.fromJson(List json)
      : coins = json.map((e) => CoinModel.fromJson(e)).toList(),
        error = "";

  CoinResponse.withError(String error)
      : coins = [],
        error = error;
}
