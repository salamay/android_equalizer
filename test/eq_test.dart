import 'package:flutter_test/flutter_test.dart';
import 'package:eq/eq.dart';
import 'package:eq/eq_platform_interface.dart';
import 'package:eq/eq_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockEqPlatform
    with MockPlatformInterfaceMixin
    implements EqPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final EqPlatform initialPlatform = EqPlatform.instance;

  test('$MethodChannelEq is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelEq>());
  });

  test('getPlatformVersion', () async {
    Eq eqPlugin = Eq();
    MockEqPlatform fakePlatform = MockEqPlatform();
    EqPlatform.instance = fakePlatform;

    expect(await eqPlugin.getPlatformVersion(), '42');
  });
}
