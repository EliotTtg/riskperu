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

Future<String> createPaypalOrder(
    String token,
    String urlDinamico,
    String codigo,
    double monto,
    double cambioDolar,
    String urlDinamicoAprobado) async {
  print(
      "-------------------------------------------------------------------------------------------------------------");
  double montoConvertido = 1 * cambioDolar;
  montoConvertido = (montoConvertido * 100).round() / 100;
  print("este es el monto convertido: $montoConvertido");

  // final String sandbox = 'https://api-m.sandbox.paypal.com';
  final String sandbox = 'https://api-m.paypal.com';
  final response = await http.post(
    Uri.parse('$sandbox/v2/checkout/orders'),
    headers: {
      'Content-Type': 'application/json',
      'PayPal-Request-Id': '$codigo',
      'Authorization': 'Bearer $token',
    },
    body: jsonEncode({
      'intent': 'CAPTURE',
      'purchase_units': [
        {
          'amount': {
            'currency_code': 'USD',
            'value': montoConvertido.toString(),
          }
        }
      ],
      "payment_source": {
        "paypal": {
          "experience_context": {
            "payment_method_preference": "IMMEDIATE_PAYMENT_REQUIRED",
            "brand_name": "Risk Peru",
            "locale": "es-PE",
            "landing_page": "LOGIN",
            "user_action": "PAY_NOW",
            "return_url": "$urlDinamicoAprobado?Codigo=$codigo",
            "cancel_url": "$urlDinamico"
          }
        }
      }
    }),
  );
  print(response.statusCode);
  String status = response.statusCode.toString();
  if (response.statusCode == 200) {
    print("CORRECTO");
    final order = jsonDecode(response.body);
    return order['id'];
  } else {
    print('Failed to create PayPals order: ${response.body}');
    return 'Error: $status';
  }
}
