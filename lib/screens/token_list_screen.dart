import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../data/token_data_grid_source.dart';
import '../data/token_mock_data.dart';
import '../models/token.dart';
import '../utils/app_theme.dart';
import '../widgets/filter_bars.dart';
import '../widgets/top_bar.dart';

class TokenListScreen extends HookWidget {
  const TokenListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedPrimaryTab = useState('热门');
    final selectedTimeFilter = useState('24h');
    final screenWidth = MediaQuery.of(context).size.width;
    const totalFlex = 3 + 3 + 1;

    final tokens = useMemoized(() {
      return List.generate(tokenData.length, (index) {
        final data = tokenData[index];
        return Token(
          iconUrl: data['iconUrl'] as String,
          name: data['name'] as String,
          age: data['age'] as String,
          address: data['address'] as String,
          pool: data['pool'] as String,
          marketCap: data['marketCap'] as String,
          score: data['score'] as int,
          isFavorite: data['isFavorite'] as bool,
          poolStatus: data['poolStatus'] as PoolStatus,
          price: data['price'] as double,
          priceChangePercent: data['priceChangePercent'] as double,
          blueChipIndex: data['blueChipIndex'] as String,
          holders: data['holders'] as String,
          smartMoneyTrades: data['smartMoneyTrades'] as String,
          trades24h: data['trades24h'] as String,
          trades24hSubtitle: data['trades24hSubtitle'] as String,
          volume24h: data['volume24h'] as String,
          priceChange1m: data['priceChange1m'] as String,
        );
      });
    }, const []);

    final tokenDataGridSource = TokenDataGridSource(tokens: tokens);

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: const TopBar(),
      body: Column(
        children: [
          PrimaryHotNewTabBar(
            selectedTab: selectedPrimaryTab.value,
            onTabChanged: (value) => selectedPrimaryTab.value = value,
          ),
          SecondaryFilterBar(
            selectedTimeFilter: selectedTimeFilter.value,
            onTimeFilterChanged: (value) => selectedTimeFilter.value = value,
          ),
          const TertiaryFilterBar(),
          Expanded(
            child: SfDataGridTheme(
              data: SfDataGridThemeData(
                gridLineColor: Colors.transparent,
                headerColor: AppTheme.background,
                frozenPaneLineColor: Colors.transparent,
                frozenPaneLineWidth: 0.0,
              ),
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {},
                dragStartBehavior: DragStartBehavior.down,
                behavior: HitTestBehavior.translucent,
                child: SfDataGrid(
                  source: tokenDataGridSource,
                  frozenColumnsCount: 1,
                  footerFrozenColumnsCount: 1,
                  headerRowHeight: 48,
                  rowHeight: 64,
                  gridLinesVisibility: GridLinesVisibility.horizontal,
                  columns: <GridColumn>[
                    GridColumn(
                      columnName: 'tokenInfo',
                      width: 220,
                      label: _buildHeaderCell('币种'),
                    ),
                    GridColumn(
                      columnName: 'time',
                      width: 80,
                      label: _buildHeaderCell('时间'),
                    ),
                    GridColumn(
                      columnName: 'poolInfo',
                      width: 100,
                      label: _buildHeaderCell('池子'),
                    ),
                    GridColumn(
                      columnName: 'marketCap',
                      width: 100,
                      label: _buildHeaderCell('市值'),
                    ),
                    GridColumn(
                      columnName: 'blueChipIndex',
                      width: 120,
                      label: _buildHeaderCell('蓝筹指数'),
                    ),
                    GridColumn(
                      columnName: 'holders',
                      width: 100,
                      label: _buildHeaderCell('持有者'),
                    ),
                    GridColumn(
                      columnName: 'smartMoneyTrades',
                      width: 120,
                      label: _buildHeaderCell('聪明钱交易数'),
                    ),
                    GridColumn(
                      columnName: 'trades24h',
                      width: 120,
                      label: _buildHeaderCell('24h 交易数'),
                    ),
                    GridColumn(
                      columnName: 'volume24h',
                      width: 120,
                      label: _buildHeaderCell('24h 成交额'),
                    ),
                    GridColumn(
                      columnName: 'price',
                      width: 100,
                      label: _buildHeaderCell('价格'),
                    ),
                    GridColumn(
                      columnName: 'priceChange1m',
                      width: 80,
                      label: _buildHeaderCell('1m%'),
                    ),
                    GridColumn(
                      columnName: 'actions',
                      width: 80,
                      label: Container(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(
    String title, {
    Alignment alignment = Alignment.centerLeft,
  }) {
    return Container(
      alignment: alignment,
      padding: const EdgeInsets.only(right: 16.0, left: 8.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(color: AppTheme.textGray)),
          const SizedBox(width: 4),
          const Icon(Icons.unfold_more, color: AppTheme.textGray, size: 16),
        ],
      ),
    );
  }
}
