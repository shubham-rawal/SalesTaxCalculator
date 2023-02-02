import 'package:money_converter/Currency.dart';
import 'package:money_converter/money_converter.dart';
import 'package:sales_tax_app/constants.dart';

const List<String> currencies = currenciesList;

class TableItem {
  final int qty;
  final String itemDescription;
  final double shelfPrice;

  TableItem({
    required this.qty,
    required this.itemDescription,
    required this.shelfPrice,
  });


//TODO: API Key not working...
  Future<double> convertToCurrency(var shelfPrice, String currency) async {
    if (currency == currenciesList[0]) {
    } else if (currency == currenciesList[1]) {
      shelfPrice = await MoneyConverter.convert(
          Currency(Currency.EUR, amount: shelfPrice), Currency(Currency.INR));
    } else {
      shelfPrice = await MoneyConverter.convert(
          Currency(Currency.EUR, amount: shelfPrice), Currency(Currency.USD));
    }

    return shelfPrice;
  }
}
