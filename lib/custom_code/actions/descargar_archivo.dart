// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

Future descargarArchivo(String urlArchivo, String nombreArchivo) async {
  try {
    // Solicitar permisos para acceder al almacenamiento (si es necesario)
    var status = await Permission.storage.request();
    if (!status.isGranted) {
      print('Permiso denegado');
      return;
    }

    // Realizar la solicitud HTTP para obtener el archivo
    final response = await http.get(Uri.parse(urlArchivo));

    if (response.statusCode == 200) {
      // Obtener el directorio donde guardar el archivo
      Directory directory = await getApplicationDocumentsDirectory();
      String filePath =
          '${directory.path}/$nombreArchivo'; // Usar el nombre del archivo proporcionado

      // Guardar el archivo en el directorio
      File file = File(filePath);
      await file.writeAsBytes(response.bodyBytes);

      print('Archivo descargado exitosamente en: $filePath');
    } else {
      print(
          'Error al descargar el archivo. Código de respuesta: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
