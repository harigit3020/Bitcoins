
import 'package:bitcoins/core/constants/constants.dart';
import 'package:bitcoins/core/errors/exceptions.dart';
import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:http/http.dart' as http;

abstract class CoinRatesRemoteDataSource {
  Future<List<BitcoinRateModel>> getCoinRates();
}

class CoinRatesRemoteDataSourceImpl extends CoinRatesRemoteDataSource {
  final http.Client client;
  CoinRatesRemoteDataSourceImpl({required this.client});

  @override
  Future<List<BitcoinRateModel>> getCoinRates() async {
    final response = await client.get(Uri.parse(Urls.currentPrice()));
    if (response.statusCode == 200) {
      return parseCurrencyResponse(response.body);
    } else {
      throw ServerException();
    }
  }
}
