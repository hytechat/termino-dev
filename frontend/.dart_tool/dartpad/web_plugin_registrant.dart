// Flutter web plugin registrant file.
//
// Generated file. Do not edit.
//

// @dart = 2.13
// ignore_for_file: type=lint

import 'package:flutter_tts/flutter_tts_web.dart';
import 'package:fluttertoast/fluttertoast_web.dart';
import 'package:syncfusion_flutter_pdfviewer_web/pdfviewer_web.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void registerPlugins([final Registrar? pluginRegistrar]) {
  final Registrar registrar = pluginRegistrar ?? webPluginRegistrar;
  FlutterTtsPlugin.registerWith(registrar);
  FluttertoastWebPlugin.registerWith(registrar);
  SyncfusionFlutterPdfViewerPlugin.registerWith(registrar);
  registrar.registerMessageHandler();
}
