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

Future<String?> approveOrderPaypal(
  String accessToken,
  String orderID,
  String codigo,
) async {
  // final String sandbox = 'https://api-m.sandbox.paypal.com';
  final String sandbox = 'https://api-m.paypal.com';
  final response =
      await http.post(Uri.parse('$sandbox/v2/checkout/orders/$orderID/capture'),
          headers: {
            'Authorization': 'Bearer $accessToken',
            'Content-Type': 'application/json',
            'PayPal-Request-Id': '$codigo',
          },
          body: jsonEncode({"rel": "capture"}));

  final mensaje = jsonDecode(response.body);

  if (response.statusCode == 201 || response.statusCode == 200) {
    print("Status Code: ${response.statusCode}");
    print("CORRECTO");
    print('Access Token: ${mensaje['access_token']}');

    return "exito";
  } else {
    print("ERROR");
    print("Status Code: ${response.statusCode}");
    print("Detalles de la respuesta: ${response.body}");

    return null;
  }
}
