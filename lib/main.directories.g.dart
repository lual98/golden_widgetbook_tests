// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:golden_widgetbook_tests/cases/image.dart' as _i2;
import 'package:golden_widgetbook_tests/cases/sized_box.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookFolder(
    name: 'painting',
    children: [
      _i1.WidgetbookComponent(
        name: 'NetworkImage',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Default',
            builder: _i2.buildImageNetworkUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Error',
            builder: _i2.buildImageNetworkErrorUseCase,
          ),
        ],
      ),
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'widgets',
    children: [
      _i1.WidgetbookComponent(
        name: 'SizedBox',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Blue',
            builder: _i3.buildBlueSizedBoxUseCase,
          ),
          _i1.WidgetbookUseCase(
            name: 'Red',
            builder: _i3.buildRedSizedBoxUseCase,
          ),
        ],
      ),
    ],
  ),
];
