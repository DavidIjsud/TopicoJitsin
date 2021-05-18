import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:loginjitsin/helpers/form.dart';
import 'package:loginjitsin/helpers/funciones.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MeetingState createState() => _MeetingState();
}

class _MeetingState extends State<MyHomePage> {
  

  @override
  void initState() {
    super.initState();
    JitsiMeet.addListener(JitsiMeetingListener(
        onConferenceWillJoin:  Funciones.onConferenceWillJoin, ///_onConferenceWillJoin,
        onConferenceJoined: Funciones.onConferenceJoined,
        onConferenceTerminated: Funciones.onConferenceTerminated,
        onError: Funciones.onError));
  }

  @override
  void dispose() {
    super.dispose();
    JitsiMeet.removeAllListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jitsin y Topico Avanzado'),
        ),
        drawer:  Drawer(
             child:  ListView(
                 padding: EdgeInsets.zero,
                 children:  Formulario.CheckOptionsForm() ,
             ) ,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child:  meetConfig(),
        ),
      );
  }

  Widget meetConfig() {
    return SingleChildScrollView(
      child: Column(
        children: Formulario.FormularioTo(),
      ),
    );
  }



}