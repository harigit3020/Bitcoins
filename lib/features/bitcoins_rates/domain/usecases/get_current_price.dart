import 'package:bitcoins/core/errors/failure.dart';
import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/respositories/coin_rates_respository.dart';
import 'package:dartz/dartz.dart';

class GetCurrentPriceUseCase {
  final CoinRatesRepository coinRatesRepository;
  GetCurrentPriceUseCase(this.coinRatesRepository);

  Future<Either<Failure, List<BitcoinRateModel>>> execute() {
    return coinRatesRepository.getCurrentPrice();
  }
}
