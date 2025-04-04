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

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:html' as html;

Future<String> downloadAndSaveCertificatePDF(
    String title,
    String modality,
    int hours,
    String emissionDate,
    String name,
    String code,
    double grade) async {
  Map<String, dynamic> jsonData = {
    "title": title,
    "modality": modality,
    "hours": hours,
    "emission_date": emissionDate,
    "name": name,
    "code": code,
    "grade": grade
  };

  String jsonString = jsonEncode(jsonData);
  final url = 'https://reportebongourmet.xentrics.ai/generate_certificate_pdf';

  try {
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      body: jsonString,
    );

    if (response.statusCode == 200) {
      final storageRef = FirebaseStorage.instance.ref().child(
          'certificates/certificate_${DateTime.now().millisecondsSinceEpoch}.pdf');
      final uploadTask = storageRef.putData(response.bodyBytes);

      final snapshot = await uploadTask;
      final downloadURL = await snapshot.ref.getDownloadURL();

      return downloadURL;
    } else {
      return 'Documento no existente';
    }
  } catch (e) {
    return 'Documento no existente';
  }
}
