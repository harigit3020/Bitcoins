part of 'coin_rates_bloc.dart';

sealed class CoinRatesEvent extends Equatable {
  const CoinRatesEvent();

  @override
  List<Object> get props => [];
}

class OnGetBitcoinRates extends CoinRatesEvent {}
