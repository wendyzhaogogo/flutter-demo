import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../models/token.dart';
import '../widgets/token_list_item_parts.dart';

class TokenDataGridSource extends DataGridSource {
  TokenDataGridSource({required List<Token> tokens}) {
    _tokens = tokens;
    _buildDataGridRows();
  }

  late List<Token> _tokens;
  List<DataGridRow> _dataGridRows = [];

  void _buildDataGridRows() {
    _dataGridRows = _tokens.map<DataGridRow>((token) {
      return DataGridRow(
        cells: [
          DataGridCell<Token>(columnName: 'tokenInfo', value: token),
          DataGridCell<Token>(columnName: 'time', value: token),
          DataGridCell<Token>(columnName: 'poolInfo', value: token),
          DataGridCell<Token>(columnName: 'marketCap', value: token),
          DataGridCell<Token>(columnName: 'blueChipIndex', value: token),
          DataGridCell<Token>(columnName: 'holders', value: token),
          DataGridCell<Token>(columnName: 'smartMoneyTrades', value: token),
          DataGridCell<Token>(columnName: 'trades24h', value: token),
          DataGridCell<Token>(columnName: 'volume24h', value: token),
          DataGridCell<Token>(columnName: 'price', value: token),
          DataGridCell<Token>(columnName: 'priceChange1m', value: token),
          DataGridCell<Token>(columnName: 'actions', value: token),
        ],
      );
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _dataGridRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final Token token = row.getCells()[0].value;

    return DataGridRowAdapter(
      cells: [
        TokenInfoCell(token: token),
        TimeCell(token: token),
        PoolInfoCell(token: token),
        MarketCapCell(token: token),
        BlueChipIndexCell(token: token),
        HoldersCell(token: token),
        SmartMoneyTradesCell(token: token),
        Trades24hCell(token: token),
        Volume24hCell(token: token),
        PriceCell(token: token),
        PriceChange1mCell(token: token),
        ActionsCell(token: token),
      ],
    );
  }
}
