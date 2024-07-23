import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void emailLaunchUrl(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    debugPrint("Could not launch $uri");
  }
}
