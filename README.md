# golden_widgetbook_tests

Automatically generate Flutter golden tests from Widgetbook use cases that were generated using the [widgetbook_generator](https://pub.dev/packages/widgetbook_generator).

## Overview
This project demonstrates how to automate the creation of golden tests for Flutter widgets using Widgetbook use cases auto-generated in the directories file, which is created using the `widgetbook_generator` package by running `dart run build_runner build -d`. The main test runner (`test/widgetbook_test.dart`) traverses these use cases to produce golden files for visual regression testing.

> **Note:** Only auto-generated directories files are supported. Manually editing or creating `main.directories.g.dart` is not intended or supported.

## Features
- **Automatic Golden Test Generation:** All Widgetbook use cases are discovered and tested.
- **Network Image Mocking:** Handles network images for reliable golden tests. You can simulate a network image loading error by using the special URL `"error-network-image"` in your use case. This will trigger the errorBuilder in your widget, allowing you to test error states.
- **Easy Integration:** Just add your Widgetbook use cases and run the tests.
- **Skippable Cases:** Add `[skip-golden]` to a use case name to skip its golden test.

## How It Works
- Widgetbook use cases are defined and auto-generated in the directories file.
- The directories file is generated using the `widgetbook_generator` package:
  ```bash
  dart run build_runner build -d
  ```
- The test runner [test/widgetbook_test.dart](test/widgetbook_test.dart) traverses all use cases and generates golden files for each use case.
- Network images are mocked with `mocktail_image_network` for consistent results.
- To test error handling for network images, use the URL `error-network-image` in your `Image.network` widget. The test runner will mock this URL as a failed image load, so your `errorBuilder` will be triggered. This is useful for verifying error UI in golden tests.

## Getting Started
1. **Install dependencies:**
   ```bash
   flutter pub get
   ```
2. **Generate Widgetbook directories:**
   ```bash
   dart run build_runner build -d
   ```
3. **Update the snapshots of the golden tests:**
   ```bash
   flutter test --update-goldens
   ```
4. **Execute test cases:**
   ```bash
   flutter test
   ```
   Golden images will be generated or compared in the appropriate directories.

## Customization
- To skip a golden test for a specific use case, add `[skip-golden]` to its name.
- Update your Widgetbook use cases as needed; the test runner will pick them up automatically.

## Customizing the Test Runner
If your app uses a custom theme or localization, update the test runner (`test/widgetbook_test.dart`) to ensure golden snapshots reflect your actual UI:

```dart
Widget baseWidget = MaterialApp(
  locale: AppLocalizations.supportedLocales.first,
  localizationsDelegates: AppLocalizations.localizationsDelegates,

  Uncomment and set your theme if your app uses a custom theme.
  theme: Themes.lightTheme,
  home: Scaffold(
    body: Builder(
      builder: (context) {
        widgetToTest = node.builder(context);
        return widgetToTest;
      },
    ),
  ),
);
```

## Contributing
Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## License
[MIT](LICENSE)
