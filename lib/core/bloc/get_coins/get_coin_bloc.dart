import 'package:rxdart/subjects.dart';
import 'package:symfonia/core/services/fetch_coins_repo.dart';
import 'package:symfonia/models/coin_response.dart';

class CoinBloc {
  /// Initializing The Network Repository
  final FetchCoinRepositoryImp _fetchCoinRepository = FetchCoinRepositoryImp();
  final BehaviorSubject<CoinResponse> _subject =
      BehaviorSubject<CoinResponse>();

  getCoins() async {
    CoinResponse response = await _fetchCoinRepository.getCoinData();
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<CoinResponse> get subject => _subject;
}

final coinBloc = CoinBloc();
