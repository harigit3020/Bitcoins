import 'dart:convert';

import 'package:bitcoins/features/bitcoins_rates/data/models/bitcoin_rate_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../helpers/json_reader.dart';

List<BitcoinRateModel> testRatesList = [
  BitcoinRateModel(
      code: "USD",
      symbol: "&#36",
      rate: "64,969,336",
      description: "United States Dollar",
      rateFloat: 64969.3359)
];
void main() {
  test('should return a list of valid model of rates form json response',
      () async {
    //arrange
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_rates_response.json'));
    //act
    final result = parseCurrencyResponse(json.encode(jsonMap));
    //assert
    expect(result, isA<List<BitcoinRateModel>>());
  });
}
