part of 'coin_rates_bloc.dart';

sealed class CoinRatesState extends Equatable {
  const CoinRatesState();

  @override
  List<Object> get props => [];
}

class CoinRatesInitial extends CoinRatesState {}

class CoinRatesLoading extends CoinRatesState {}

class CoinRatesLoaded extends CoinRatesState {
  final List<BitcoinRateModel> result;
  const CoinRatesLoaded(this.result);

  @override
  List<Object> get props => [result];
}

class CoinsRatesLoadFailure extends CoinRatesState {
  final String message;
  const CoinsRatesLoadFailure(this.message);

  @override
  List<Object> get props => [message];
}
