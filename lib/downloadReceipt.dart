// import 'dart:convert';
// import 'dart:html' as html; // or package:universal_html/prefer_universal/html.dart

// final text = 'this is the text file';

// // prepare
// final bytes = utf8.encode(text);
// final blob = html.Blob([bytes]);
// final url = html.Url.createObjectUrlFromBlob(blob);
// final anchor = html.document.createElement('a') as html.AnchorElement
//   ..href = url
//   ..style.display = 'none'
//   ..download = 'receipt.txt';

// // html.document.body.children.add(anchor);
// html.document.body.children.add(anchor);

// // download
// anchor.click();

// // cleanup
// html.document.body.children.remove(anchor);
// html.Url.revokeObjectUrl(url);
import 'dart:io';
import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

Future getPdf(Uint8List screenShot) async {
  pw.Document pdf = pw.Document();
  pdf.addPage(
    pw.Page(
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Expanded(
          child: pw.Image(PdfImage.file(pdf.document, bytes: screenShot) as pw.ImageProvider, fit: pw.BoxFit.contain)
        );
      },
    ),
  );
  File pdfFile = File('receipt.pdf');
  pdfFile.writeAsBytesSync(pdf.save() as List<int>);
}