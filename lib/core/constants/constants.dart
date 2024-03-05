class Urls {
  static const String baseUrl = "https://api.coindesk.com";
  
  static String currentPrice() => '$baseUrl/v1/bpi/currentprice.json';
}
