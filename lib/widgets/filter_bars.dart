import 'package:flutter/material.dart';
import '../utils/app_theme.dart';

class PrimaryHotNewTabBar extends StatelessWidget {
  final String selectedTab;
  final ValueChanged<String> onTabChanged;

  const PrimaryHotNewTabBar({
    super.key,
    required this.selectedTab,
    required this.onTabChanged,
  });

  @override
  Widget build(BuildContext context) {
    const tabOptions = ['新币', '热门', '追踪', '持仓'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children:
            tabOptions
                .map((tab) {
                  return _TabItem(
                    text: tab,
                    isSelected: selectedTab == tab,
                    onTap: () => onTabChanged(tab),
                  );
                })
                .expand((widget) => [widget, const SizedBox(width: 24)])
                .toList()
              ..removeLast(),
      ),
    );
  }
}

class _TabItem extends StatelessWidget {
  const _TabItem({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textGray,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}

class SecondaryFilterBar extends StatelessWidget {
  final String selectedTimeFilter;
  final ValueChanged<String> onTimeFilterChanged;

  const SecondaryFilterBar({
    super.key,
    required this.selectedTimeFilter,
    required this.onTimeFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    const timeOptions = ['1m', '5m', '1h', '6h', '24h'];
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const _Chip(text: '热门', icon: Icons.sync),
          const SizedBox(width: 8),
          const _Chip(text: '下一个蓝筹', icon: Icons.show_chart),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: AppTheme.darkGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: timeOptions.map((time) {
                return _TimeFilter(
                  text: time,
                  isSelected: selectedTimeFilter == time,
                  onTap: () => onTimeFilterChanged(time),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class TertiaryFilterBar extends StatelessWidget {
  const TertiaryFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.cloud_outlined, color: AppTheme.textGray, size: 20),
          const SizedBox(width: 4),
          const Text('过滤Devs', style: TextStyle(color: AppTheme.textGray)),
          const Icon(Icons.chevron_right, color: AppTheme.textGray),
          const SizedBox(width: 16),
          const Icon(Icons.tune, color: AppTheme.textGray),
          const SizedBox(width: 4),
          const Text('筛选', style: TextStyle(color: AppTheme.textGray)),
          const Spacer(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppTheme.darkGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [
                Icon(Icons.flash_on, color: AppTheme.green, size: 16),
                SizedBox(width: 4),
                Icon(Icons.diamond_outlined, color: Colors.white, size: 16),
                SizedBox(width: 4),
                Text('0'),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: AppTheme.darkGrey,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              children: [Text('P1'), Icon(Icons.arrow_drop_down, size: 20)],
            ),
          ),
          const SizedBox(width: 8),
          const Icon(Icons.donut_large_outlined, color: AppTheme.textGray),
        ],
      ),
    );
  }
}

class _Chip extends StatelessWidget {
  const _Chip({required this.text, this.icon});
  final String text;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppTheme.darkGrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: AppTheme.textGray, size: 16),
            const SizedBox(width: 6),
          ],
          Text(text, style: const TextStyle(color: AppTheme.textGray)),
        ],
      ),
    );
  }
}

class _TimeFilter extends StatelessWidget {
  const _TimeFilter({
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.background : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : AppTheme.textGray,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
