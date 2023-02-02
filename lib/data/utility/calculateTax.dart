import '../models/tableItem.dart';

double calculateTax(List<TableItem> itemsList) {
  double tax = 0.0;
  double rate = 0.1;
  double rateForImported = 0.05;
  for (var item in itemsList) {
    if (!(item.itemDescription.contains("book")) &&
        !(item.itemDescription.contains("food")) &&
        !(item.itemDescription.contains("medicine"))) {
      tax += ((rate * (item.qty * item.shelfPrice)) * 20).round() / 20.0;
    }

    if (item.itemDescription.contains("imported")) {
      tax += ((rateForImported * (item.qty * item.shelfPrice)) * 20)
              .round() / 20.0;
    }
  }

  return tax;
}

double calculateTotalPriceIncludingTax(List<TableItem> itemsList) {
  double salesTax = calculateTax(itemsList);
  double totalPriceWithoutTax = 0.0;
  for (var item in itemsList) {
    totalPriceWithoutTax += item.qty * item.shelfPrice;
  }

  return totalPriceWithoutTax + salesTax;
}
