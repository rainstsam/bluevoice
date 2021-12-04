
import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart' show Level;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:intl/intl.dart';

enum MediaStorage {
  /// The media is stored in a local file
  file,

  /// The media is stored in a in memory buffer
  buffer,

  /// The media is stored in an asset.
  asset,

  /// The media is being streamed
  stream,

  /// The media is a remote sample file.
  remoteExampleFile,
}
/// Factory used to track what codec is currently selected.
class ActiveCodec {
  static final ActiveCodec _self = ActiveCodec._internal();

  Codec? _codec = Codec.aacADTS;
  bool? _encoderSupported = false;
  bool _decoderSupported = false;

  ///
  FlutterSoundRecorder? recorderModule;

  /// Factory to access the active codec.
  factory ActiveCodec() {
    return _self;
  }
  ActiveCodec._internal();

  /// Set the active code for the the recording and player modules.
  void setCodec({required bool withUI, Codec? codec}) async {
    var player = FlutterSoundPlayer(logLevel: Level.nothing);
    if (withUI) {
      await player.openAudioSession(
          focus: AudioFocus.requestFocusAndDuckOthers, withUI: true);
      _encoderSupported = await recorderModule!.isEncoderSupported(codec!);
      _decoderSupported = await player.isDecoderSupported(codec);
    } else {
      await player.openAudioSession(
          focus: AudioFocus.requestFocusAndDuckOthers);
      _encoderSupported = await recorderModule!.isEncoderSupported(codec!);
      _decoderSupported = await player.isDecoderSupported(codec);
    }
    _codec = codec;
  }

  /// `true` if the active coded is supported by the recorder
  bool? get encoderSupported => _encoderSupported;

  /// `true` if the active coded is supported by the player
  bool get decoderSupported => _decoderSupported;

  /// returns the active codec.
  Codec? get codec => _codec;
}

/// get the duration for the media with the given codec.
// Future<Duration?>? getDuration(Codec? codec) async {
//   Future<Duration?>? duration;
//   switch (MediaPath().media) {
//     case MediaStorage.file:
//     case MediaStorage.buffer:
//       duration = flutterSoundHelper.duration(MediaPath().pathForCodec(codec!)!);
//       break;
//     case MediaStorage.asset:
//       duration = null;
//       break;
//     case MediaStorage.remoteExampleFile:
//       duration = null;
//       break;
//     case MediaStorage.stream:
//       duration = null;
//       break;
//     default:
//       duration = null;
//   }
//   return duration;
// }

/// formats a duration for printing.
///  mm:ss
String formatDuration(Duration duration) {
  var date =
      DateTime.fromMillisecondsSinceEpoch(duration.inMilliseconds, isUtc: true);
  return DateFormat('mm:ss', 'en_GB').format(date);
}

/// the set of samples availble as assets.


/// Checks if the past file exists
bool fileExists(String path) {
  return File(path).existsSync();
}

/// checks if the given directory exists.
bool directoryExists(String path) {
  return Directory(path).existsSync();
}

/// In this simple example, we just load a file in memory.
/// This is stupid but just for demonstration  of startPlayerFromBuffer()
Future<Uint8List?> makeBuffer(String path) async {
  try {
    if (!fileExists(path)) return null;
    var file = File(path);
    file.openRead();
    var contents = await file.readAsBytes();
    print('The file is ${contents.length} bytes long.');
    return contents;
  } on Object catch (e) {
    print(e.toString());
    return null;
  }
}
