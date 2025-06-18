import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_widgetbook_tests/main.directories.g.dart';
import 'package:mocktail_image_network/mocktail_image_network.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  group("Widgetbook golden tests", () {
    // The path is constructed manually instead of using the one in the node to add slashes to the path.
    traverseWidgetbookNodes(List<WidgetbookNode> nodes, String path) {
      for (var node in nodes) {
        if (node is WidgetbookUseCase) {
          // Skip the golden test case if it contains the [skip-golden] tag.
          bool shouldSkip = node.name.contains("[skip-golden]");

          // Golden test case of the story.
          testWidgets(node.name, (widgetTester) async {
            late Widget widgetToTest;
            Widget baseWidget = MaterialApp(
              // Uncomment and set your supported locales if your app uses localization.
              // locale: ...,
              // localizationsDelegates: ...,

              // Uncomment and set your theme if your app uses a custom theme.
              // theme: ...,
              home: Scaffold(
                body: Builder(
                  builder: (context) {
                    widgetToTest = node.builder(context);
                    return widgetToTest;
                  },
                ),
              ),
            );

            await mockNetworkImages(
              () async => await widgetTester.pumpWidget(baseWidget),
            );
            await precacheImagesAndWait(widgetTester);

            await widgetTester.pumpAndSettle();
            await expectLater(
              find.byType(widgetToTest.runtimeType).first,
              matchesGoldenFile("$path/${node.name}.png"),
            );
          }, skip: shouldSkip);
        } else if (node.children != null) {
          group(node.name, () {
            traverseWidgetbookNodes(node.children!, "$path/${node.name}");
          });
        }
      }
    }

    traverseWidgetbookNodes(directories, ".");
  });
}

Future<void> precacheImagesAndWait(WidgetTester widgetTester) async {
  await widgetTester.runAsync(() async {
    // Find all Image widgets and precache their images
    final imageElements = find.byType(Image).evaluate();
    for (var element in imageElements) {
      final Image image = element.widget as Image;
      ImageProvider<Object> provider = image.image;
      if (provider is ResizeImage) {
        provider = provider.imageProvider;
      }
      await precacheImage(provider, element);
    }

    await Future.delayed(const Duration(milliseconds: 100));
  });
}
