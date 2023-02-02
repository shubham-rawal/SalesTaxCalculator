import 'package:flutter/material.dart';
import 'package:money_converter/Currency.dart';
import 'package:sales_tax_app/core/constants.dart';
import 'package:sales_tax_app/data/models/tableItem.dart';
import '../widgets/tableRowWidget.dart';

var count = 0;
final List<TableItem> itemsList = [];
// final List<TableRowWidget> widgetsList = [];
final List<TextEditingController> _quantityControllers = [];
final List<TextEditingController> _itemDescControllers = [];
final List<TextEditingController> _priceControllers = [];

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  static List<TextEditingController> getQuantityControllers() {
    return _quantityControllers;
  }

  static List<TextEditingController> getItemDescControllers() {
    return _itemDescControllers;
  }

  static List<TextEditingController> getPriceControllers() {
    return _priceControllers;
  }

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sales Tax Calculator",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: mediaQuery.width * 0.06,
          vertical: mediaQuery.height * 0.08,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //heading
            Text(
              "Item Details",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: mediaQuery.width * 0.02,
              ),
            ),

            const SizedBox(
              height: 35,
            ),

            ListView.builder(
              shrinkWrap: true,
              itemCount: count,
              itemBuilder: (context, index) {
                _quantityControllers.add(TextEditingController());
                _itemDescControllers.add(TextEditingController());
                _priceControllers.add(TextEditingController());
                return Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      children: [
                        Text(
                          "${index + 1}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Expanded(child: SizedBox()),
                        Expanded(
                          flex: 8,
                          child: TableRowWidget(
                            qtyController: _quantityControllers[index],
                            itemDescController: _itemDescControllers[index],
                            priceController: _priceControllers[index],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                );
              },
            ),

            ElevatedButton(
              onPressed: () {
                setState(() {
                  count++;
                });
              },
              child: const Text("Add Item"),
            ),

            const SizedBox(
              height: 25,
            ),

            ElevatedButton(
              onPressed: () {
                //calculate tax
                //when this button is tapped, it should take the values of all text fields and create objects.
                //then tax is to be calculated.
                for (var i = 0; i < count; i++) {
                  itemsList.add(
                    TableItem(
                      qty: int.parse(_quantityControllers[i].text),
                      itemDescription: _itemDescControllers[i].text,
                      shelfPrice: double.parse(_priceControllers[i].text),
                    ),
                  );
                }

                // print(itemsList[0].shelfPrice);
                // print(itemsList[1].shelfPrice);

                Navigator.pushNamed(context, receipt);
              },
              child: const Text('Generate Receipt'),
            ),
          ],
        ),
      ),
    );
  }
}
