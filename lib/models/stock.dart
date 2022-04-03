import 'dart:ffi';

class Stock {
  final String name;
  double price = 0.0;
  double lastPrice = 0.0;

  Stock({
    required this.name,
    this.price = 0.0,
  });
}