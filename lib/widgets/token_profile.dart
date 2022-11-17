//import 'dart:convert';

import 'dart:convert';

import 'package:khiladi_adda/widgets/token_preference.dart';


TokenProfile? tokenProfile;

class TokenProfile {
  var token;

  TokenProfile.values({
    this.token,
  });

  TokenProfile.fromJson(String value) {
    token = value;
    print('kk${token}');

    tokenPreference.setTokenPreferenceData(json.encode(value));
  }
}
