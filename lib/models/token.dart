enum PoolStatus { locked, fire, none }

class Token {
  final String iconUrl;
  final String name;
  final String age;
  final String address;
  final String pool;
  final String marketCap;
  final int score;
  final bool isFavorite;
  final PoolStatus poolStatus;
  final double price;
  final double priceChangePercent;
  final String blueChipIndex;
  final String holders;
  final String smartMoneyTrades;
  final String trades24h;
  final String trades24hSubtitle;
  final String volume24h;
  final String priceChange1m;

  Token({
    required this.iconUrl,
    required this.name,
    required this.age,
    required this.address,
    required this.pool,
    required this.marketCap,
    required this.score,
    required this.isFavorite,
    required this.poolStatus,
    required this.price,
    required this.priceChangePercent,
    required this.blueChipIndex,
    required this.holders,
    required this.smartMoneyTrades,
    required this.trades24h,
    required this.trades24hSubtitle,
    required this.volume24h,
    required this.priceChange1m,
  });
}
