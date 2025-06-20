import 'package:flutter/material.dart';
import '../models/token.dart';
import '../utils/app_theme.dart';

class TokenInfoCell extends StatelessWidget {
  final Token token;
  const TokenInfoCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        children: [
          Icon(
            token.isFavorite ? Icons.star : Icons.star_border,
            color: token.isFavorite ? Colors.yellow : AppTheme.textGray,
            size: 20,
          ),
          const SizedBox(width: 8),
          CircleAvatar(
            backgroundImage: NetworkImage(token.iconUrl),
            radius: 10,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      token.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      Icons.search,
                      color: AppTheme.textGray,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        token.address,
                        style: const TextStyle(
                          color: AppTheme.textGray,
                          fontSize: 12,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(Icons.copy, color: AppTheme.textGray, size: 12),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TimeCell extends StatelessWidget {
  final Token token;
  const TimeCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(token.age, style: const TextStyle(color: Colors.white)),
    );
  }
}

class PoolInfoCell extends StatelessWidget {
  final Token token;
  const PoolInfoCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(token.pool, style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 4),
          _getPoolStatusIcon(),
        ],
      ),
    );
  }

  Widget _getPoolStatusIcon() {
    switch (token.poolStatus) {
      case PoolStatus.locked:
        return const Icon(Icons.lock, color: AppTheme.textGray, size: 16);
      case PoolStatus.fire:
        return const Icon(
          Icons.local_fire_department,
          color: Colors.orange,
          size: 16,
        );
      case PoolStatus.none:
      default:
        return const SizedBox.shrink();
    }
  }
}

class MarketCapCell extends StatelessWidget {
  final Token token;
  const MarketCapCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(token.marketCap, style: const TextStyle(color: Colors.white)),
    );
  }
}

class BlueChipIndexCell extends StatelessWidget {
  final Token token;
  const BlueChipIndexCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          const Icon(Icons.show_chart, color: AppTheme.textGray, size: 16),
          const SizedBox(width: 4),
          Text(
            token.blueChipIndex,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class HoldersCell extends StatelessWidget {
  final Token token;
  const HoldersCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(token.holders, style: const TextStyle(color: Colors.white)),
    );
  }
}

class SmartMoneyTradesCell extends StatelessWidget {
  final Token token;
  const SmartMoneyTradesCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(
        token.smartMoneyTrades,
        style: const TextStyle(color: AppTheme.textGray),
      ),
    );
  }
}

class Trades24hCell extends StatelessWidget {
  final Token token;
  const Trades24hCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(token.trades24h, style: const TextStyle(color: Colors.white)),
          Text(
            token.trades24hSubtitle,
            style: const TextStyle(color: AppTheme.textGray, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class Volume24hCell extends StatelessWidget {
  final Token token;
  const Volume24hCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(token.volume24h, style: const TextStyle(color: Colors.white)),
    );
  }
}

class PriceCell extends StatelessWidget {
  final Token token;
  const PriceCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(
        '\$${token.price}',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

class PriceChange1mCell extends StatelessWidget {
  final Token token;
  const PriceChange1mCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    final isPositive = !token.priceChange1m.startsWith('-');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      alignment: Alignment.centerLeft,
      child: Text(
        token.priceChange1m,
        style: TextStyle(color: isPositive ? AppTheme.green : AppTheme.red),
      ),
    );
  }
}

class ActionsCell extends StatelessWidget {
  final Token token;
  const ActionsCell({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        style: IconButton.styleFrom(
          backgroundColor: AppTheme.green.withOpacity(0.2),
        ),
        icon: const Icon(Icons.flash_on, color: AppTheme.green, size: 20),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('尝试交易'),
              duration: Duration(seconds: 2),
            ),
          );
        },
      ),
    );
  }
}
