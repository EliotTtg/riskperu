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

import 'package:url_launcher/url_launcher.dart';

Future<void> redirectToPaypalURLPage(String orderID) async {
  final url = 'https://www.paypal.com/checkoutnow?token=$orderID';

  if (await canLaunch(url)) {
    await launch(
      url,
      webOnlyWindowName:
          '_self', // Esto asegura que se abra en la misma pestaña
    );
  } else {
    throw 'No se pudo lanzar la URL';
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
