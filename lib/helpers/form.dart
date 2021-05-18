

import 'package:flutter/material.dart';
import 'package:loginjitsin/helpers/funciones.dart';
import 'package:loginjitsin/helpers/variables.dart';
import './funciones.dart';

class Formulario{


   static List<Widget> CheckOptionsForm(){

      return [
           SizedBox(
            height: 50.0,
          ),
          Center(child: Text("Opciones de video y audio")),
          SizedBox(
            height: 15.0,
          ),
          ValueListenableBuilder<bool>(
               valueListenable: Variables.justAudio,
               builder:  ( _, bool newValue , Widget w ){
                  return CheckboxListTile(
                        title: Text("Solo Audio"),
                        value: ( newValue != null ) ? newValue : Variables.isAudioOnly,
                        onChanged: Funciones.onAudioOnlyChanged  ,
                      );
               },
          ),
          SizedBox(
            height: 14.0,
          ),
          ValueListenableBuilder<bool>(
              valueListenable:  Variables.audioMuted ,
              builder:  ( _ , bool newValue ,  Widget widget){
                  return CheckboxListTile(
                        title: Text("Audio Muted"),
                        value:  ( newValue != null ) ? newValue : Variables.isAudioMuted,
                        onChanged: Funciones.onAudioMutedChanged,
                      );
              },
          ),
          SizedBox(
            height: 14.0,
          ),
          ValueListenableBuilder<bool>(
              valueListenable: Variables.videoMutedNotifier,
              builder: ( BuildContext contexto , bool newValue, Widget w ){
                    return CheckboxListTile(
                        title: Text("Video Muted"),
                        value:  ( newValue != null ) ? newValue : Variables.isVideoMuted ,
                        onChanged: Funciones.onVideoMutedChanged,
                      );
              },
          ),
      ];

   }


   static List<Widget> FormularioTo(){

      

        return [
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller:  Variables.roomText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Salon",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: Variables.subjectText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Subject",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: Variables.nameText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Nombre",
            ),
          ),
          SizedBox(
            height: 14.0,
          ),
          TextField(
            controller: Variables.emailText,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Correo",
            ),
          ),
          Divider(
            height: 48.0,
            thickness: 2.0,
          ),
          SizedBox(
            height: 64.0,
            width: double.maxFinite,
            child: ElevatedButton(
              onPressed: () {
                Funciones.joinMeeting();
              },
              child: Text(
                "Unirse a la sala",
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.green)),
            ),
          ),
          SizedBox(
            height: 48.0,
          ),
        ];

   }

}