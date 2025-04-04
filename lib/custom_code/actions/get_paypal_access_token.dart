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

Future<String?> getPaypalAccessToken() async {
  print("entro cliente produccion");
//PRUEBA SANDBOX ELIOT
  // final String cli =
  //     'ARrnRxJoU6wd4ritxA1NOVKJtqn7-Uyfc6loEeD8uInnRWBRPjVUD660spKPDmNh-h-UWLxzUk7qSgMn';
  // final String secret =
  //     'EG5KFpTa6ylgXoKpnaELD-JDtP-eYR7FBcE1Bvm-76QDzKDVAMyriGl9TynF5gNx_sRc0_MLXeEcGAX0';

  //PRUEBA SANDBOX ELIOT
  // final String cli =
  //     'AUfiRo8X4yswYMqRSvELJPZHl1jJGej7w_Udg4iSdGcxnlB4idP9aIHAxayhrXgK8dStayPyaNSR77tc';
  // final String secret =
  //     'ECDIZFrqH6xKRlk7efasbrBrOq3fx92ptQg4kFRAPMxYmsFouV_al55zHrk3x8be9Qc7AbFljjjbCDgo';

  //ELIOT PRODUCCION
  // final String cli =
  //     'AVlY5feuz7M1ei0qi7ec7lrh_B5GR0UdOv4SO-EX1LLGPNiHynUa10BujMH0hh7AYP4thqBZNWmyrNs6';
  // final String secret =
  //     'EDrk0ix8wGaqLmZClFoxZhxI8fSvsFP4f0NjJDiigsvjJzWWxFCIRxm32PDk5dx5sIVhpLJF6qBIoGrU';

  //CLIENTE PRODUCCION
  final String cli =
      'AWAgMUuYZp43idjv7GDleoDpObPWGWPnIS5-AUMhUdyFUuHWHBMBMSel3FNs_k86liQgcdEHI3au65z3';
  final String secret =
      'EPiBH19cW6bKHiSSPVvhAGSXZfWMqHMIBxwEEmdHtyAEiMYlL7m55lqzr5Sz4WitEDOXFXXR3NnSUgF9';

  //PRUEBA  SANDBOX CLIENTE RISK

  // final String cli =
  //     'AXeBbEawKFZ2IGeUy3tRaDIgoOCjkhZzKdwCG_iCnlVK4Vbl-UfdMkT0hfWhBDGAYwApu1zN1d_DBjHv';
  // final String secret =
  //     'EAKMXKJeVIEqp4nTRyuL6LcWGTnQD9eKy2CBgnAQbdRCzxLnJTtarlbmZK_Uu-7d7VM4IPD5wwSTOYXE';

  //PRUEBA SANDBOX
  // final String cli =
  //     'Aec5Cxzluj9mXt72nTqMHyJ494Bu8PIULLiM2_MMYznbPe2p4kYn0X8tF9r1iP2EydiVeaeuc19PLb4S';
  // final String secret =
  //     'EGOvHdD9pdExlbRCw92i3AbRip4xmhbOEX-rROM3U2hH9vkGEvscHCl2FJiWxJXKqXy_Nwe4M-xBnBc3';

  //PRODUCCION
  // final String cli =
  //     'ARxsGfyUHIreHV4toomoiPlXUHNosd4aO4M67UUbiKcHYImSVOhnTlYivVcX2mijIAmbCkq8SpBaQ9zz';

  // final String secret =
  //     'EPMxpbkLheVCPKt6OG4vQGXmcz6iT_WuoVnvZXuXPSCgdo4Go0ne_f4O_jlspXcMoH2VcmmW6R4dCcY-';

  //SANDBOX
  // final String sandbox = 'https://api-m.sandbox.paypal.com';
  //PRODUCCION
  final String sandbox = 'https://api-m.paypal.com';
  final String credentials = base64Encode(utf8.encode('$cli:$secret'));
  final response = await http.post(
    Uri.parse('$sandbox/v1/oauth2/token'),
    headers: {
      'Authorization': 'Basic $credentials',
      'Content-Type': 'application/x-www-form-urlencoded',
    },
    body: 'grant_type=client_credentials',
  );

  if (response.statusCode == 200) {
    print("finalizado");
    final body = jsonDecode(response.body);
    print("Access token 9 Horas expira: ${body['access_token']}");

    print("$body[access_token]");
    return body['access_token'];
  } else {
    print("ERROR");
    print("Error getPayPalAccessToken: ${response.statusCode}");
    print("Response body: ${response.body}");
    throw Exception('Failed to get access token: ${response.body}');
  }
}
