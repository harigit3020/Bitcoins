import 'dart:io';

import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/bloc/coin_rates_bloc/coin_rates_bloc.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/pages/home_page.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

class MockCoinRatesBloc extends MockBloc<CoinRatesEvent, CoinRatesState>
    implements CoinRatesBloc {}

void main() {
  late MockCoinRatesBloc mockCoinRatesBloc;

  setUp(() {
    mockCoinRatesBloc = MockCoinRatesBloc();
    HttpOverrides.global = null;
  });

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<CoinRatesBloc>(
      create: (context) => mockCoinRatesBloc,
      child: MaterialApp(
        home: body,
      ),
    );
  }

  List<BitcoinRateModel> testRatesList = [
    BitcoinRateModel(
        code: "USD",
        symbol: "&#36",
        rate: "64,969,336",
        description: "United States Dollar",
        rateFloat: 64969.3359)
  ];

  testWidgets('should show progress indicator when state is loading',
      (widgetTester) async {
    //arrange
    when(() => mockCoinRatesBloc.state).thenReturn(CoinRatesLoading());

    //act
    await widgetTester.pumpWidget(_makeTestableWidget(const HomePage()));

    //assert
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets(
      'shold show a listview widget contain list of bitcoin rates when state is loaded',
      (widgetTester) async {
    //arrange
    when(() => mockCoinRatesBloc.state)
        .thenReturn(CoinRatesLoaded(testRatesList));

    //act
    await widgetTester.pumpWidget(_makeTestableWidget(const HomePage()));

    //assert
    expect(find.byKey(const Key('coin_rates_list')), findsOneWidget);
  });

  testWidgets(
      'shold show a test widget contain error message when state is loaded failure',
      (widgetTester) async {
    //arrange
    when(() => mockCoinRatesBloc.state)
        .thenReturn(const CoinsRatesLoadFailure('Error while fetching data'));

    //act
    await widgetTester.pumpWidget(_makeTestableWidget(const HomePage()));

    //assert
    expect(find.text('Error while fetching data'), findsOne);
  });
}
