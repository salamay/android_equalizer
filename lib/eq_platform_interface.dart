import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'eq_method_channel.dart';

abstract class EqPlatform extends PlatformInterface {
  /// Constructs a EqPlatform.
  EqPlatform() : super(token: _token);

  static final Object _token = Object();

  static EqPlatform _instance = EqMethodChannel();

  /// The default instance of [EqPlatform] to use.
  ///
  /// Defaults to [MethodChannelEq].
  static EqPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EqPlatform] when
  /// they register themselves.
  static set instance(EqPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
