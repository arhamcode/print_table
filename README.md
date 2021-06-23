# print_table

This package forked from [tabulate](https://pub.dev/packages/tabulate)

A simple library to generate text-based table for console-printing

```dart
import 'package:print_table/tabulate.dart';

void main() {
    print(tabulate([['row1-item1','row1-item2'],['row2-item1','row2-item2']], ['header1','header2']));
}
```