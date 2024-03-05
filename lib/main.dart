import 'package:bitcoins/core/services/injection_container.dart';
import 'package:bitcoins/core/utils/splash_screen.dart';
import 'package:bitcoins/core/utils/theme/theme.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/bloc/coin_rates_bloc/coin_rates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => locator<CoinRatesBloc>())],
      child: MaterialApp(
        title: 'Bitcoins',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const SplashScreen(),
      ),
    );
  }
}
