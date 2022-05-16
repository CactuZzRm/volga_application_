class Stock {
  final String name;
  double price = 0.0;
  double lastPrice = 0.0;
  bool favorite = false;

  Stock({
    required this.name,
  });

  void isFavorite() {
    favorite = !favorite;
  }
}