
import 'dart:developer';

import 'eq_method_channel.dart';
import 'models/band.dart';
import 'models/preset.dart';

class SalamayEqualizer {

  static final EqMethodChannel _eqChannel = EqMethodChannel();


  static Future<void> init(int audioSessionId) async {
    await _eqChannel.initEqalizer(audioSessionId);
  }
  Future<void> setBandLevel(int band, int progress) async {
    await _eqChannel.setBandLevel(band, progress);
  }
  Future<int> getEqBandLevel(int band) async {
    int level= await _eqChannel.getBandLevel(band);
    log("Flutter: Band $band level $level");
    return level;
  }
  Future<void> setEqEnabled(bool cond) async {
    await _eqChannel.setEqEnabled(cond);
  }
  Future<Band> getBandRange() async {
    Band band= await _eqChannel.getBandRange();
    log("Flutter: Band range min: ${band.min} max:${band.max}");
    return band;
  }
  Future<int> getNoOfBand() async {
    int no= await _eqChannel.getNoOfEqBand();
    log("Flutter: No of band $no");
    return no;
  }
  Future<void> setBassStrength(int strength) async {
    await _eqChannel.setBassLevel(strength);
  }
  Future<void> setVirtualizerStrength(int strength) async {
    await _eqChannel.setVirtualizerLevel(strength);
  }
  Future<void> usePreset(int presetId) async {
    await _eqChannel.setPreset(presetId);
  }
  Future<List<Preset>> getPresets() async {
    List<Preset> presets= await _eqChannel.getPresets();
    log("Flutter: Presets ${presets.length}");
    return presets;
  }

}
