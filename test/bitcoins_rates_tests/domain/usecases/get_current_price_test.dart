import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/usecases/get_current_price.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helpers.mocks.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  GetCurrentPriceUseCase? getCurrentPriceUseCase;
  MockCoinRatesRepository? mockCoinRatesRepository;

  setUp(() {
    mockCoinRatesRepository = MockCoinRatesRepository();
    getCurrentPriceUseCase = GetCurrentPriceUseCase(mockCoinRatesRepository!);
  });

  List<BitcoinRateModel> testRatesList = [
    BitcoinRateModel(
        code: "USD",
        symbol: "&#36",
        rate: "64,969,336",
        description: "United States Dollar",
        rateFloat: 64969.3359)
  ];

  test('should get the list of current rates from the repository', () async {
    //arrange
    when(mockCoinRatesRepository!.getCurrentPrice())
        .thenAnswer((_) async => Right(testRatesList));
    //act
    final result = await getCurrentPriceUseCase!.execute();
    //assert
    expect(result, Right(testRatesList));
  });
}
