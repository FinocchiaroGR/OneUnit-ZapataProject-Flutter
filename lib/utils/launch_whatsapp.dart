import 'dart:io';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchWhatsapp({
  required BuildContext context,
  required String phone,
  required String text,
}) async {
  var whatsapp = phone; //+92xx enter like this
  var whatsappURlAndroid = "whatsapp://send?phone=$whatsapp&text=$text";
  var whatsappURLIos = "https://wa.me/$whatsapp?text=${Uri.tryParse(text)}";
  if (Platform.isIOS) {
    // for iOS phone only
    if (await canLaunchUrl(Uri.parse(whatsappURLIos))) {
      await launchUrl(Uri.parse(
        whatsappURLIos,
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Whatsapp not installed")));
    }
  } else {
    // android , web
    if (await canLaunchUrl(Uri.parse(whatsappURlAndroid))) {
      await launchUrl(Uri.parse(whatsappURlAndroid));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Whatsapp not installed")));
    }
  }
}
