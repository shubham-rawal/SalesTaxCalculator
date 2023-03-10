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
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sales_tax_app/data/models/tableItem.dart';
import 'package:open_filex/open_filex.dart';

void downloadFile(DataTable dataTable) async {
  if (!kIsWeb) {
    if (Platform.isIOS || Platform.isAndroid || Platform.isMacOS) {
      bool status = await Permission.storage.isGranted;

      if (!status) await Permission.storage.request();
    }
  }

  String text = "";

  final Map<int, dynamic> map;

  List<String> tableRows = [];

  for (var i = 0; i < dataTable.rows.length; i++) {
    for (var j = 0; j < dataTable.rows[i].cells.length; j++) {
      tableRows.add(dataTable.rows[i].cells[j].child.key.toString());
    }
  }

  text = tableRows.toString();

  final bytes = utf8.encode(text);
  final uint8bytes = Uint8List.fromList(bytes);
  MimeType type = MimeType.TEXT;
  String path = await FileSaver.instance
      .saveFile("receipt", uint8bytes, "txt", mimeType: type);
  print(path);
}
