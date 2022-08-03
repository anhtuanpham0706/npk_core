import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:npk_core/npk_core.dart';

void main() {
  const MethodChannel channel = MethodChannel('npk_core');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await NpkCore.platformVersion, '42');
  });
}
