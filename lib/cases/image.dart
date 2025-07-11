import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;

@widgetbook.UseCase(name: 'Default', type: NetworkImage)
Widget buildImageNetworkUseCase(BuildContext context) {
  return Container(
    color: Colors.green,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        width: double.infinity,
        height: double.infinity,
        "https://loremflickr.com/320/240?lock=1",
        fit: BoxFit.cover,
      ),
    ),
  );
}

@widgetbook.UseCase(name: 'Error', type: NetworkImage)
Widget buildImageNetworkErrorUseCase(BuildContext context) {
  return Container(
    color: Colors.green,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        "error-network-image",
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Center(
            child: Text(
              'Error loading image',
              style: TextStyle(color: Colors.red),
            ),
          );
        },
      ),
    ),
  );
}
