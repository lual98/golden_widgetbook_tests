import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: NetworkImage)
Widget buildImageNetworkUseCase(BuildContext context) {
  return Container(
    color: Colors.green,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "https://loremflickr.com/320/240?lock=1",
        fit: BoxFit.cover,
      ),
    ),
  );
}
