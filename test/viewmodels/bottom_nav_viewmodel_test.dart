import 'package:flutter_test/flutter_test.dart';
import 'package:wise/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('BottomNavViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}