import 'package:flutter/material.dart';

class TableItem extends StatefulWidget {
  const TableItem({super.key});

  @override
  State<TableItem> createState() => _TableItemState();
}

class _TableItemState extends State<TableItem> {
  late TextEditingController _qtyController;
  late TextEditingController _itemDescController;
  late TextEditingController _priceController;

  @override
  void initState() {
    _qtyController = TextEditingController();
    _itemDescController = TextEditingController();
    _priceController = TextEditingController();
  }

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
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextField(
            decoration:const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Shelf Price',
            ),
            controller: _priceController,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
