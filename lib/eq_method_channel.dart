import 'package:eq/models/band.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'eq_platform_interface.dart';
import 'models/preset.dart';

/// An implementation of [EqPlatform] that uses method channels.
class EqMethodChannel extends EqPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('com.salamay.equalizer/channel');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  Future<void> initEqalizer(int audioSessionId) async {
    await methodChannel.invokeMethod<void>('init', audioSessionId);
  }
  Future<Band> getBandRange()async{
    final bandRange = await methodChannel.invokeMethod('getBandRange');
    return Band.fromJson(bandRange!);
  }
  Future<int> getNoOfEqBand()async{
    final no = (await methodChannel.invokeMethod('getNoOfBand'));
    return no;
  }
  Future<void> setBandLevel(int bandId, int level) async {
    await methodChannel.invokeMethod<void>('setBandLevel', {"band": bandId, "progress": level});
  }
  Future<int> getBandLevel(int bandId) async {
    final level = await methodChannel.invokeMethod('getBandLevel', bandId);
    return level;
  }
  Future<void> setEqEnabled(bool cond) async {
    await methodChannel.invokeMethod<void>('setEqStatus', cond);
  }
  Future<void> setBassLevel(int strength) async {
    await methodChannel.invokeMethod<void>('setBassBoostStrength', strength);
  }
  Future<void> setVirtualizerLevel(int strength) async {
    await methodChannel.invokeMethod<void>('setVirtualizerStrength', strength);
  }
  Future<void> setPreset(int presetId) async {
    await methodChannel.invokeMethod<void>('setPreset', presetId);
  }
  Future<List<Preset>> getPresets() async {
    final presets = await methodChannel.invokeListMethod('getPresets');
    return presets!.map((e) => Preset.fromJson(e)).toList();
  }
}
