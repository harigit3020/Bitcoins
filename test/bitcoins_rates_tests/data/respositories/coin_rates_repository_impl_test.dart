import 'package:bitcoins/core/errors/exceptions.dart';
import 'package:bitcoins/core/errors/failure.dart';
import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/data/respositories/coin_rates_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockCoinRatesRemoteDataSource mockCoinRatesRemoteDataSource;
  late CoinRatesRepositoryImpl coinRatesRepositoryImpl;

  setUp(() {
    mockCoinRatesRemoteDataSource = MockCoinRatesRemoteDataSource();
    coinRatesRepositoryImpl = CoinRatesRepositoryImpl(
        coinRatesRemoteDataSource: mockCoinRatesRemoteDataSource);
  });

  List<BitcoinRateModel> testRatesList = [
    BitcoinRateModel(
        code: "USD",
        symbol: "&#36",
        rate: "64,969,336",
        description: "United States Dollar",
        rateFloat: 64969.3359)
  ];

  group('get current bitcoin rates', () {
    test(
        'should return list of bitcoin rates model when a call to data source is successful',
        () async {
      //arrange
      when(mockCoinRatesRemoteDataSource.getCoinRates())
          .thenAnswer((_) async => testRatesList);

      //act
      final result = await coinRatesRepositoryImpl.getCurrentPrice();

      //assert
      expect(result, equals(Right(testRatesList)));
    });

    test(
        'should return server failure when a call to data source is unsuccessful',
        () async {
      //arrange
      when(mockCoinRatesRemoteDataSource.getCoinRates())
          .thenThrow(ServerException());

      //act
      final result = await coinRatesRepositoryImpl.getCurrentPrice();

      //assert
      expect(
          result,
          equals(const Left(ServerFailure(
              'An error occurred while connecting to the server'))));
    });

    test(
        'should return connection failure when the device has no internet connection',
        () async {
      //arrange
      when(mockCoinRatesRemoteDataSource.getCoinRates())
          .thenThrow(SocketException());

      //act
      final result = await coinRatesRepositoryImpl.getCurrentPrice();

      //assert
      expect(
          result,
          equals(
              const Left(ConnectionFailure('Failed to connect to network'))));
    });
  });
}
