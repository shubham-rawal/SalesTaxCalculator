import 'dart:async';
import 'dart:html';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:sales_tax_app/calculateTax.dart';
import 'package:sales_tax_app/calculator_page.dart';
import 'package:sales_tax_app/constants.dart';
import 'package:sales_tax_app/downloadReceipt.dart';
import 'package:sales_tax_app/tableRowWidget.dart';
import 'package:screenshot/screenshot.dart';

class Receipt extends StatefulWidget {
  const Receipt({super.key});

  @override
  State<Receipt> createState() => _ReceiptState();
}

class _ReceiptState extends State<Receipt> {
  var salesTax = calculateTax(itemsList);
  var totalPriceIncludingTax = calculateTotalPriceIncludingTax(itemsList);
  late Uint8List? _imageFile;
  final ScreenshotController _controller = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    return Screenshot(
      controller: _controller,
      child: Scaffold(
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
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "Receipt",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    child: const Text(
                      "Download",
                      style: TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    onTap: () async {
                      //download
                      // _controller
                      //     .capture()
                      //     .then((Uint8List image) {
                      //       //Capture Done
                      //       setState(() {
                      //         _imageFile = image;
                      //       });
                      //     })
                      //     .catchError((onError) {
                      //   print(onError);
                      // });

                      //downloading pdf of screenshot
                      _imageFile = (await _controller.capture());
                      try {
                        getPdf(_imageFile!);
                      } catch (e) {
                        print(e);
                      }
                    },
                  )
                ],
              ),
              DataTable(
                headingTextStyle: const TextStyle(fontWeight: FontWeight.bold),
                columns: const [
                  DataColumn(label: Text("Qty")),
                  DataColumn(label: Text("Item Description")),
                  DataColumn(label: Text("Price")),
                ],
                rows: List<DataRow>.generate(
                  itemsList.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(itemsList[index].qty.toString())),
                      DataCell(Text(itemsList[index].itemDescription)),
                      DataCell(Text(itemsList[index].shelfPrice.toString())),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                const TextSpan(
                  text: "Tax: ",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: "$salesTax"),
              ])),
              const SizedBox(
                height: 30,
              ),
              RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    const TextSpan(
                      text: "Total amount including tax: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: "$totalPriceIncludingTax"),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              InkWell(
                child: const Text(
                  "back",
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Colors.blue,
                  ),
                ),
                onTap: () => Navigator.popUntil(
                    context, ModalRoute.withName(calculator)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
