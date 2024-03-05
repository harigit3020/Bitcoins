import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/usecases/get_current_price.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'coin_rates_event.dart';
part 'coin_rates_state.dart';

class CoinRatesBloc extends Bloc<CoinRatesEvent, CoinRatesState> {
  final GetCurrentPriceUseCase _getCurrentPriceUseCase;
  CoinRatesBloc(this._getCurrentPriceUseCase) : super(CoinRatesInitial()) {
    on<OnGetBitcoinRates>((event, emit) async {
      emit(CoinRatesLoading());
      final result = await _getCurrentPriceUseCase.execute();
      result.fold((faliure) {
        emit(CoinsRatesLoadFailure(faliure.message));
      }, (data) {
        emit(CoinRatesLoaded(data));
      });
    });
  }
}
