// To parse this JSON data, do
//
//     final bitcoinRateModel = bitcoinRateModelFromJson(jsonString);

import 'dart:convert';

BitcoinRateModel bitcoinRateModelFromJson(String str) =>
    BitcoinRateModel.fromJson(json.decode(str));

String bitcoinRateModelToJson(BitcoinRateModel data) =>
    json.encode(data.toJson());

class BitcoinRateModel {
  String code;
  String symbol;
  String rate;
  String description;
  double rateFloat;

  BitcoinRateModel({
    required this.code,
    required this.symbol,
    required this.rate,
    required this.description,
    required this.rateFloat,
  });

  factory BitcoinRateModel.fromJson(Map<String, dynamic> json) =>
      BitcoinRateModel(
        code: json["code"],
        symbol: json["symbol"],
        rate: json["rate"],
        description: json["description"],
        rateFloat: json["rate_float"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "symbol": symbol,
        "rate": rate,
        "description": description,
        "rate_float": rateFloat,
      };
}

List<BitcoinRateModel> parseCurrencyResponse(String responseBody) {
  final parsed = json.decode(responseBody);
  Map<String, dynamic> data = parsed['bpi'];
  List<BitcoinRateModel> currencies = [];

  data.forEach((key, value) {
    currencies.add(BitcoinRateModel.fromJson(value));
  });

  return currencies;
}
