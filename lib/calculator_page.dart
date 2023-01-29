import 'package:flutter/material.dart';
import 'package:sales_tax_app/tableItem.dart';

var count = 0;

class Calculator extends StatefulWidget {
  const Calculator({super.key});

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

            const SizedBox(height: 35,),


            ListView.builder(
              shrinkWrap: true,
              itemCount: count,
              itemBuilder: (context, index) {
                return Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Row(
                      children: [
                        Text(
                          "${index+1}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        
                        const Expanded(child: SizedBox()),
                        

                        const Expanded(
                          flex: 8,
                          child: TableItem()
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

            SizedBox(
              height: 25,
            ),

            ElevatedButton(onPressed: () {
              //calculate tax
            }, 
            child: Text('Generate Receipt'),
            ),
          ],
        ),
      ),
    );
  }
}
