import 'dart:convert';

import 'package:firebase_remote_config/firebase_remote_config.dart';

Future<Map<String, String>> fetchCountryEndpoints() async {
  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.fetchAndActivate();
  String jsonString = remoteConfig.getString('country_codes');
  Map<String, dynamic> endpointsJson = jsonDecode(jsonString);
  Map<String, String> countryEndpoints = endpointsJson.map((key, value) {
    return MapEntry(key, value.toString());
  });
  return countryEndpoints;
}
