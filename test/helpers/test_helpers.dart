import 'package:bitcoins/features/bitcoins_rates/data/data_sources/remote_data_source.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/respositories/coin_rates_respository.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/usecases/get_current_price.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

@GenerateMocks(
    [CoinRatesRepository, CoinRatesRemoteDataSource, GetCurrentPriceUseCase],
    customMocks: [MockSpec<http.Client>(as: #MockHttpClient)])
void main() {}
