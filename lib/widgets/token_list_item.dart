import 'package:flutter/material.dart';
import '../models/token.dart';
import '../utils/app_theme.dart';

class TokenListItem extends StatelessWidget {
  final Token token;

  const TokenListItem({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.borderGray)),
      ),
      child: Row(
        children: [
          _buildTokenInfo(),
          _buildPoolInfo(),
          _buildPriceChart(),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildTokenInfo() {
    return Expanded(
      flex: 5,
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
                    Text(
                      token.age,
                      style: const TextStyle(
                        color: AppTheme.textGray,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      token.address,
                      style: const TextStyle(
                        color: AppTheme.textGray,
                        fontSize: 12,
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

  Widget _buildPoolInfo() {
    return Expanded(
      flex: 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
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

  Widget _buildPriceChart() {
    // Placeholder for the price chart
    return Expanded(
      flex: 3,
      child: Container(
        height: 30,
        alignment: Alignment.center,
        child: Text(
          'Chart for ${token.price}',
          style: TextStyle(
            color: token.priceChangePercent >= 0
                ? AppTheme.green
                : AppTheme.red,
          ),
        ),
      ),
    );
  }

  Widget _buildActions() {
    return Expanded(
      flex: 1,
      child: Container(
        alignment: Alignment.centerRight,
        child: CircleAvatar(
          radius: 18,
          backgroundColor: AppTheme.green.withOpacity(0.2),
          child: const Icon(Icons.flash_on, color: AppTheme.green, size: 20),
        ),
      ),
    );
  }
}
