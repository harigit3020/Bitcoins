import 'package:bitcoins/features/bitcoins_rates/data/data_sources/remote_data_source.dart';
import 'package:bitcoins/features/bitcoins_rates/data/respositories/coin_rates_repository_impl.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/respositories/coin_rates_respository.dart';
import 'package:bitcoins/features/bitcoins_rates/domain/usecases/get_current_price.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/bloc/coin_rates_bloc/coin_rates_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final locator = GetIt.instance;

void setUpLocator() {
  //bloc
  locator.registerFactory(() => CoinRatesBloc(locator()));

  //usecase
  locator.registerLazySingleton(() => GetCurrentPriceUseCase(locator()));

  //respository
  locator.registerLazySingleton<CoinRatesRepository>(
      () => CoinRatesRepositoryImpl(coinRatesRemoteDataSource: locator()));

  //data source
  locator.registerLazySingleton<CoinRatesRemoteDataSource>(
      () => CoinRatesRemoteDataSourceImpl(client: locator()));

  //external
  locator.registerLazySingleton(() => http.Client());
}
