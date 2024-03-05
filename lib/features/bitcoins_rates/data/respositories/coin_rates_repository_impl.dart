import 'package:bitcoins/core/errors/exceptions.dart';
import 'package:bitcoins/core/errors/failure.dart';
import 'package:bitcoins/features/bitcoins_rates/data/data_sources/remote_data_source.dart';
import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/respositories/coin_rates_respository.dart';
import 'package:dartz/dartz.dart';

class CoinRatesRepositoryImpl extends CoinRatesRepository {
  final CoinRatesRemoteDataSource coinRatesRemoteDataSource;

  CoinRatesRepositoryImpl({required this.coinRatesRemoteDataSource});

  @override
  Future<Either<Failure, List<BitcoinRateModel>>> getCurrentPrice() async {
    try {
      final result = await coinRatesRemoteDataSource.getCoinRates();
      return Right(result);
    } on ServerException {
      return const Left(
          ServerFailure('An error occurred while connecting to the server'));
    } on SocketException {
      return const Left(ConnectionFailure('Failed to connect to network'));
    }
  }
}
