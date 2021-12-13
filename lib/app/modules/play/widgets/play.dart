/*
 * Copyright 2018, 2019, 2020, 2021 Dooboolab.
 *
 * This file is part of Flutter-Sound.
 *
 * Flutter-Sound is free software: you can redistribute it and/or modify
 * it under the terms of the Mozilla Public License version 2 (MPL2.0),
 * as published by the Mozilla organization.
 *
 * Flutter-Sound is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * MPL General Public License for more details.
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/.
 */

import 'dart:async';
// import 'dart:typed_data';
import 'package:bluevoice/app/modules/play/index.dart';
// import 'package:bluevoice/app/modules/play/widgets/slider.dart';
import 'package:bluevoice/common/utils/utils.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
// import 'package:flutter/material.dart' show Column;
// import 'package:flutter/services.dart';
import 'package:flutter_sound/flutter_sound.dart';
// import 'package:flutter_sound/public/util/flutter_sound_helper.dart';
// import 'package:flutter_sound_platform_interface/flutter_sound_recorder_platform_interface.dart';
import 'package:get/get.dart';
// import 'package:moor/moor.dart';
// import 'package:permission_handler/permission_handler.dart';

/*
 * This is an example showing how to record to a Dart Stream.
 * It writes all the recorded data from a Stream to a File, which is completely stupid:
 * if an App wants to record something to a File, it must not use Streams.
 *
 * The real interest of recording to a Stream is for example to feed a
 * Speech-to-Text engine, or for processing the Live data in Dart in real time.
 *
 */

///
typedef _Fn = void Function();

/* This does not work. on Android we must have the Manifest.permission.CAPTURE_AUDIO_OUTPUT permission.
 * But this permission is _is reserved for use by system components and is not available to third-party applications._
 * Pleaser look to [this](https://developer.android.com/reference/android/media/MediaRecorder.AudioSource#VOICE_UPLINK)
 *
 * I think that the problem is because it is illegal to record a communication in many countries.
 * Probably this stands also on iOS.
 * Actually I am unable to record DOWNLINK on my Xiaomi Chinese phone.
 *
 */
//const theSource = AudioSource.voiceUpLink;
//const theSource = AudioSource.voiceDownlink;

// const theSource = AudioSource.microphone;

/// Example app.
class SimplePlay extends StatefulWidget {
  @override
  _SimplePlayState createState() => _SimplePlayState();
}

class _SimplePlayState extends State<SimplePlay> {
  final Controller = Get.put(PlayController());
  final FlutterSoundPlayer _mPlayer = FlutterSoundPlayer();
  bool _mPlayerIsInited = false;
  StreamSubscription? _mPlayerSubscription;

  @override
  void initState() {
    super.initState();
    init().then((value) {
      setState(() {
        _mPlayerIsInited = true;
      });
    });
  }

  @override
  void dispose() {
    cancelPlayerSubscriptions();
    _mPlayer.closeAudioSession();
    super.dispose();
  }

  Future<void> init() async {
    await _mPlayer.openAudioSession();
    await _mPlayer.setSubscriptionDuration(Duration(milliseconds: 50));
    _mPlayerSubscription = _mPlayer.onProgress!.listen((e) {
      setPos(e.position.inSeconds);
      setState(() {});
    });
  }

  void cancelPlayerSubscriptions() {
    if (_mPlayerSubscription != null) {
      _mPlayerSubscription!.cancel();
      _mPlayerSubscription = null;
    }
  }

  Future<void> seek(double d) async {
    await _mPlayer.seekToPlayer(Duration(milliseconds: d.floor()));
    setPos(d.floor());
  }

  void setPos(int d) {
    if (d > Controller.state.duration) {
      d = Controller.state.duration;
    }
    Controller.state.pos = d;
  }

  void play() async {
    print('11111111111' + Controller.state.file);
    setPos(0);
    var _date = await readFile(Controller.state.file);
    var _file = Controller.state.file;
    var _duration = await flutterSoundHelper.duration(_file);
    await _mPlayer.setSubscriptionDuration(Duration(milliseconds: 50));
    _mPlayerSubscription = _mPlayer.onProgress!.listen((e) {
      setPos(e.position.inMilliseconds);
      // setState(() {});
    });
    Controller.state.duration = _duration!.inMilliseconds;
    await _mPlayer.startPlayer(
        fromDataBuffer: _date,
        // fromURI: _file,
        codec: Codec.aacADTS,
        whenFinished: () {
          stopPlayer();
          int index = Controller.state.files.indexOf(Controller.state.file);
          index++;
          if (index == Controller.state.files.length) {
            Controller.state.file = Controller.state.files[0];
          } else {
            Controller.state.file = Controller.state.files[index];
            play();
          }
        });
    //     .then((value) {
    //   setState(() {});
    // });
  }

  void stopPlayer() {
    _mPlayer.stopPlayer().then((value) {
      cancelPlayerSubscriptions();
      setState(() {});
    });
  }

// ----------------------------- UI --------------------------------------------

  _Fn? getPlaybackFn() {
    // if (!_mPlayerIsInited || !_mplaybackReady) {
    //   return null;
    // }
    return _mPlayer.isStopped ? play : stopPlayer;
  }

  @override
  Widget build(BuildContext context) {
    var intduration = Controller.state.duration;
    var pos = Controller.state.pos;
    var spos = pos ~/ 1000;
    var sintduration = intduration ~/ 1000;

    // var stream = _mPlayer!.dispositionStream()!;
    Widget makeBody() {
      return Column(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Color(0xFFFAF0E6),
            ),
            child: Row(children: [
              ElevatedButton(
                onPressed: getPlaybackFn(),
                //color: Colors.white,
                //disabledColor: Colors.grey,
                child: Text(_mPlayer.isPlaying ? '停止' : '播放'),
              ),
              SizedBox(
                width: 10,
              ),
              _mPlayer.isPlaying
                  ? Column(
                      children: [
                        Text(Controller.state.file
                            .substring(Controller.state.file.length - 23)),
                        Row(children: [
                          Slider(
                            value: pos + 0.0,
                            min: 0.0,
                            max: intduration + 0.0,
                            onChanged: seek,
                            // autofocus: true,
                            // divisions: 100
                          ),
                          Text('$spos/$sintduration秒'),
                        ]),
                      ],
                    )
                  : Text('未开始'),
            ]),
          ),
        ],
      );
    }

    return makeBody();
  }
}
