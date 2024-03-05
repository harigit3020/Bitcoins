import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/bloc/coin_rates_bloc/coin_rates_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CoinRatesBloc>().add(OnGetBitcoinRates());
    });
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          "Bitcoin Rates",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding:
            const EdgeInsets.only(left: 15, top: 20, bottom: 20, right: 15),
        child: BlocBuilder<CoinRatesBloc, CoinRatesState>(
          builder: (context, state) {
            if (state is CoinRatesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is CoinRatesLoaded) {
              return ListView.separated(
                  key: const Key('coin_rates_list'),
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemCount: state.result.length,
                  itemBuilder: (context, index) {
                    final data = state.result[index];
                    return listItemBuilder(data, context);
                  });
            }
            if (state is CoinsRatesLoadFailure) {
              return Center(
                child: Text(state.message),
              );
            }
            return Container();
          },
        ),
      )),
    );
  }

  Container listItemBuilder(BitcoinRateModel data, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(top: 5, bottom: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.code,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Text(data.symbol) //Just as a placeholder
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          dataTextBuilder(context, title: 'Rate', data: data.rate),
          dataTextBuilder(context, title: 'Rate Float', data: data.rateFloat),
          dataTextBuilder(context, title: 'Description', data: data.description)
        ],
      ),
    );
  }

  RichText dataTextBuilder(BuildContext context,
      {required String title, required dynamic data}) {
    return RichText(
        text: TextSpan(
            text: '$title :   ',
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
          TextSpan(
              text: data.toString(),
              style: Theme.of(context).textTheme.bodyLarge)
        ]));
  }
}
