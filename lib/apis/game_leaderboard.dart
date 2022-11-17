
import 'dart:convert';

//import 'package:heybuddy/api/signin_api.dart';
import 'package:http/http.dart' as http;

//var tokens = tokenProfile?.token;
Future getLeaderBoard(token , month) async {
  http.Response res = await http.get(
    Uri.parse('https://webarbiter.in/khiladi-adda/public/api/game-leaderboard/1?range=$month'),
    headers: {'Authorization': "Bearer " + token
     },
  );
 // http.MultipartFile.fromPath(, filePath)
  var share1 = json.decode(res.body);
  if (res.statusCode == 200) {
    print("skills.............");
   
    print('mioio$share1');
    print(res);
    return share1;
  } else {
    return 'pp';
  }
  //return {"statusCode": res.statusCode, "response": share1};
}
