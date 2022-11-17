import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
//import 'package:mybud/widgets/token_profile.dart';

class SignUp {
  static Future signUp(
       var phoneno) async {
 
 
    print('SignUp');
    var dio = Dio();

    FormData formData = FormData.fromMap({
      'mobile': phoneno,
    });
    // var _url =
    //     Uri.parse('https://sheltered-earth-76230.herokuapp.com/user/signup');

    var response = await dio.post(
      'https://webarbiter.in/khiladi-adda/public/api/register_otp',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
      ),
    );
    
    print('${response.toString()}');
    
    if (response.statusCode == 200) {
      print('Response data : ${response.data}');
      return response.data ; 
      //  tokenProfile =
      //     TokenProfile.fromJson(json.decode('"${response.data['data']}"'));
      // return json.decode(response.data);
    } else if (response.statusCode == 400) {
      print('Error code : ${response.statusCode}');
      return response.data['error'];
      //  print('message of signup - ${json.decode(response.data)['error']}');
      // return json.decode(response.data);
    } else {
      return null;
    }
  }
}
