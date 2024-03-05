import 'package:bitcoins/core/errors/failure.dart';
import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/bloc/coin_rates_bloc/coin_rates_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';
import '../../../helpers/test_helpers.mocks.dart';

void main() {
  late MockGetCurrentPriceUseCase mockGetCurrentPriceUseCase;
  late CoinRatesBloc coinRatesBloc;

  setUp(() {
    mockGetCurrentPriceUseCase = MockGetCurrentPriceUseCase();
    coinRatesBloc = CoinRatesBloc(mockGetCurrentPriceUseCase);
  });

  List<BitcoinRateModel> testRatesList = [
    BitcoinRateModel(
        code: "USD",
        symbol: "&#36",
        rate: "64,969,336",
        description: "United States Dollar",
        rateFloat: 64969.3359)
  ];

  test('Initial State should be empty', () {
    expect(coinRatesBloc.state, CoinRatesInitial());
  });

  blocTest<CoinRatesBloc, CoinRatesState>(
    'should emit [CoinRatesInitial,CoinRatesLoaded] when data is gotten successfully',
    build: () {
      when(mockGetCurrentPriceUseCase.execute())
          .thenAnswer((_) async => Right(testRatesList));
      return coinRatesBloc;
    },
    act: (bloc) => bloc.add(OnGetBitcoinRates()),
    expect: () => [CoinRatesLoading(), CoinRatesLoaded(testRatesList)],
  );

  blocTest<CoinRatesBloc, CoinRatesState>(
    'should emit [CoinRatesInitial,CoinRatesLoadFailure] when data is unsuccessful',
    build: () {
      when(mockGetCurrentPriceUseCase.execute())
          .thenAnswer((_) async => const Left(ServerFailure('server failure')));
      return coinRatesBloc;
    },
    act: (bloc) => bloc.add(OnGetBitcoinRates()),
    expect: () =>
        [CoinRatesLoading(), const CoinsRatesLoadFailure('server failure')],
  );
}
