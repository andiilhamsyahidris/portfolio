import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void intentLaunchUrl(Uri uri) async {
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  } else {
    debugPrint("Could not launch $uri");
  }
}

String? encodeQueryParameters(Map<String, String> params) {
  return params.entries
      .map((MapEntry<String, String> e) =>
          '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
      .join('&');
}
