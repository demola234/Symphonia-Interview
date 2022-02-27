import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CoinModel extends Equatable {
  /// API REQUEST OUTPUT SAMPLE
  /// API => https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=100&page=1&sparkline=false
// {
// "id": "bitcoin",
// "symbol": "btc",
// "name": "Bitcoin",
// "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
// "current_price": 39012,
// "market_cap": 746518072380,
// "market_cap_rank": 1,
// "fully_diluted_valuation": 826462890359,
// "total_volume": 20973459310,
// "high_24h": 39877,
// "low_24h": 38107,
// "price_change_24h": 564.74,
// "price_change_percentage_24h": 1.46886,
// "market_cap_change_24h": 18497066559,
// "market_cap_change_percentage_24h": 2.54073,
// "circulating_supply": 18968643,
// "total_supply": 21000000,
// "max_supply": 21000000,
// "ath": 69045,
// "ath_change_percentage": -43.00021,
// "ath_date": "2021-11-10T14:24:11.849Z",
// "atl": 67.81,
// "atl_change_percentage": 57938.57265,
// "atl_date": "2013-07-06T00:00:00.000Z",
// "roi": null,
// "last_updated": "2022-02-26T08:50:08.004Z"
// }

  String id;
  String name;
  String image;
  double currentPrice;
  double priceChange24H;
  double priceChangePercentage24H;
  double marketCapChangePercentage24H;
  DateTime lastUpdated;

  CoinModel(
    this.id,
    this.name,
    this.image,
    this.currentPrice,
    this.priceChange24H,
    this.priceChangePercentage24H,
    this.marketCapChangePercentage24H,
    this.lastUpdated,
  );

  CoinModel.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        image = json["image"],
        currentPrice = json["current_price"].toDouble(),
        priceChange24H = json["price_change_24h"].toDouble(),
        priceChangePercentage24H =
            json["price_change_percentage_24h"].toDouble(),
        marketCapChangePercentage24H =
            json["market_cap_change_percentage_24h"].toDouble(),
        lastUpdated = DateTime.parse(json["last_updated"]);

  @override
  List<Object> get props => [
        id,
        name,
        image,
        currentPrice,
        priceChange24H,
        priceChangePercentage24H,
        marketCapChangePercentage24H,
        lastUpdated
      ];
}
