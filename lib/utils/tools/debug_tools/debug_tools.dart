import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

void kDebugPrint(data) {
  if (kDebugMode) {
    print(data);
  }
}

void showLog(String msg) {
  if (kDebugMode) {
    log(msg);
  }
}

void launchURLBrowser(String billUrl,String errorLink) async {
  if (billUrl.isNotEmpty) {
    var url = Uri.parse(billUrl);
    try {
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        await launchUrl(Uri.parse(errorLink));
        throw 'Could not launch $url';
      }
    }catch(e){
      await launchUrl(Uri.parse(errorLink));
    }
  }
}
