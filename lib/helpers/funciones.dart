import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:loginjitsin/helpers/variables.dart';

class Funciones{

  static void onAudioOnlyChanged(bool value) {
       Variables.justAudio.value = value;
       Variables.justAudio.notifyListeners();     
  }

  static void onAudioMutedChanged(bool value) {

      Variables.audioMuted.value = value;
      Variables.audioMuted.notifyListeners();
  
  }

  static void onVideoMutedChanged(bool value) {
    
      Variables.videoMutedNotifier.value = value;
      Variables.videoMutedNotifier.notifyListeners();
    
  }

  static void onConferenceWillJoin(message) {
  }

  static void onConferenceJoined(message) {
  }

  static void onConferenceTerminated(message) {
  }

  static void onError(error) {
  }

 static Map<FeatureFlagEnum, bool>   _verificarIosOrAndroid(){
      Map<FeatureFlagEnum, bool> featureFlags = {
      FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
    };
     if (!kIsWeb) {
      if (Platform.isAndroid) {
        featureFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }
    }
    return featureFlags;
  }

  static void _unirse(  Map<FeatureFlagEnum, bool> featureFlags, String serverUrl ) async {

     var options = JitsiMeetingOptions(room:  Variables.roomText.text)
      ..serverURL = serverUrl
      ..subject = Variables.subjectText.text
      ..userDisplayName = Variables.nameText.text
      ..userEmail = Variables.emailText.text
      ..audioOnly = Variables.isAudioOnly
      ..audioMuted = Variables.isAudioMuted
      ..videoMuted = Variables.isVideoMuted
      ..featureFlags.addAll(featureFlags)
      ..webOptions = {
        "roomName": Variables.roomText.text,
        "width": "100%",
        "height": "100%",
        "enableWelcomePage": false,
        "chromeExtensionBanner": null,
        "userInfo": {"displayName": Variables.nameText.text}
      };
    await JitsiMeet.joinMeeting(
      options,
      listener: JitsiMeetingListener(
          onConferenceWillJoin: (message) {
          },
          onConferenceJoined: (message) {
          },
          onConferenceTerminated: (message) {
          },
          onError: ( x ){

          },
          genericListeners: [
            JitsiGenericListener(
                eventName: 'readyToClose',
                callback: (dynamic message) {
                }),
          ]),
    );

  }

   static joinMeeting() async {
    String serverUrl =  Variables.serverText.text.trim().isEmpty ? null : Variables.serverText.text;

    Map<FeatureFlagEnum, bool>  featureFlags =  _verificarIosOrAndroid();

    _unirse( featureFlags , serverUrl );
    
  }

}