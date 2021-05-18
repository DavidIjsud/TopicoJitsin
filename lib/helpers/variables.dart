

import 'package:flutter/material.dart';

class Variables{

  static ValueNotifier<bool> videoMutedNotifier = ValueNotifier(true);
  static ValueNotifier<bool> audioMuted         = ValueNotifier(true);
  static ValueNotifier<bool> justAudio          = ValueNotifier(true);

 static final serverText = TextEditingController();
 static  final roomText = TextEditingController(text: "David_Room");
 static  final subjectText = TextEditingController(text: "Mi salon de prueba");
 static  final nameText = TextEditingController(text: "Davidijsud");
 static  final emailText = TextEditingController(text: "Davidijsud@gmail.com");

 static bool isAudioOnly = true;
 static  bool isAudioMuted = true;
 static  bool isVideoMuted = true;

}