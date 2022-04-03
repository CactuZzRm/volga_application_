class Stock {
  final String name;
  double price;
  double lastPrice = 0.0;

  Stock({
    required this.name,
    required this.price,
  });
}