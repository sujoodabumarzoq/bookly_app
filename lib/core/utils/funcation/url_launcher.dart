
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

// Future<void> LaunchUrl(context, String url) async {
//   Uri uri = Uri.parse(url);
//   if (await canLaunchUrl(uri)) {
//     await launchUrl(uri);
//   }
//   else{
//     ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('cannot launch')));
//
//
//
//
//   }
// }

Future<void> LaunchUrl(BuildContext context, String url) async {
  if (url != null && url.isNotEmpty) {
    Uri uri = Uri.parse(url);
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Cannot launch the URL')),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Invalid URL')),
    );
  }
}
