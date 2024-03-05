import 'package:bitcoins/core/constants/constants.dart';
import 'package:bitcoins/core/errors/exceptions.dart';
import 'package:bitcoins/features/bitcoins_rates/data/data_sources/remote_data_source.dart';
import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/json_reader.dart';
import '../../../helpers/test_helpers.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  late MockHttpClient mockHttpClient;
  late CoinRatesRemoteDataSourceImpl coinRatesRemoteDataSourceImpl;

  setUp(() {
    mockHttpClient = MockHttpClient();
    coinRatesRemoteDataSourceImpl =
        CoinRatesRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('get list of current prices of bitcoins', () {
    test(
        'should return list of bitcoin rates model when the response code is 200',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.currentPrice()))).thenAnswer(
          (_) async => http.Response(
              readJson('helpers/dummy_data/dummy_rates_response.json'), 200));
      //act
      final result = await coinRatesRemoteDataSourceImpl.getCoinRates();

      //assert
      expect(result, isA<List<BitcoinRateModel>>());
    });

    test(
        'should throw a server exception when the response code is 404 or other',
        () async {
      //arrange
      when(mockHttpClient.get(Uri.parse(Urls.currentPrice())))
          .thenAnswer((_) async => http.Response('Not found', 404));

      //act
      final result = coinRatesRemoteDataSourceImpl.getCoinRates();

      //assert
      expect(result, throwsA(isA<ServerException>()));
    });
  });
}
