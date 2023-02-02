import 'package:flutter/material.dart';
import 'package:sales_tax_app/data/models/tableItem.dart';

final List<int> qtyValues = [];
final List<String> itemDescValues = [];
final List<double> priceValues = [];

class TableRowWidget extends StatefulWidget {
  final TextEditingController qtyController;
  final TextEditingController itemDescController;
  final TextEditingController priceController;
  const TableRowWidget(
      {super.key,
      required this.qtyController,
      required this.itemDescController,
      required this.priceController});

  @override
  State<TableRowWidget> createState() =>
      _TableRowWidgetState(qtyController, itemDescController, priceController);
}

class _TableRowWidgetState extends State<TableRowWidget> {
  final _qtyController;
  final _itemDescController;
  final _priceController;

  _TableRowWidgetState(
      this._qtyController, this._itemDescController, this._priceController);
  // @override
  // void initState() {
  //   super.initState();
  //   TableRowWidget._qtyController = TextEditingController();
  //   TableRowWidget._itemDescController = TextEditingController();
  //   TableRowWidget._priceController = TextEditingController();
  // }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   TableRowWidget.qtyController.dispose();
  //   TableRowWidget.itemDescController.dispose();
  //   TableRowWidget.priceController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Row(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Qty',
            ),
            controller: _qtyController,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            // ignore: unnecessary_const
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Item Description',
            ),
            controller: _itemDescController,
            // onSubmitted: (value) => itemDescValues.add(value),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Shelf Price',
            ),
            controller: _priceController,
            // onSubmitted: (value) => priceValues.add(double.parse(value)),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
