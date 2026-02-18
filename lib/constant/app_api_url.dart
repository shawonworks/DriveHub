import 'dart:developer';
import 'package:flutter/foundation.dart';

String _getDomain() {
  // String serverDomain = "http://92.205.234.255:5000"; //////////// live server
  // String localDomain = "http://92.205.234.255:5000"; ///////// local server
  String serverDomain = "http://10.10.7.46:5001"; ///////// local server
  // "http://10.0.70.188:5001"; //////////// live server
  String localDomain = "http://10.10.7.46:5001"; ///////// local server
  try {
    if (kReleaseMode) {
      return serverDomain;
    } else {
      return localDomain;
    }
  } catch (e) {
    log("_getDomain $e");
    return serverDomain;
  }
}

class AppApiUrl {
  AppApiUrl._();

  //////////////////////////////////////  base
  static const String localDomain = "http://92.205.234.255:5000"; ///////// local server
  static const String serverDomain =
      "http://92.205.234.255:5000"; //////////// live server
  static final String domain = _getDomain();

  // static final String domain = serverDomain;
  static final String baseUrl = "$domain/api/v1";
  static final String donationUrl =
      'https://www.paypal.com/donate/?hosted_button_id=SYW5E7ZJMN982';
}
