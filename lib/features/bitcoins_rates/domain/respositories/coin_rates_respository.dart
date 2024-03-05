import 'package:bitcoins/core/errors/failure.dart';
import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:dartz/dartz.dart';

abstract class CoinRatesRepository {
  Future<Either<Failure,List<BitcoinRateModel>>> getCurrentPrice();
}
