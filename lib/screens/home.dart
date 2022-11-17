import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/games.dart';
import 'package:khiladi_adda/screens/game_info.dart';
import 'package:khiladi_adda/screens/game_info_one.dart';
import 'package:khiladi_adda/screens/game_info_two.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

_launchURLApp(var url) async {
  if (await canLaunchUrl(url)) {
    await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    );
  } else {
    throw 'Could not launch $url';
  }
}

class _HomeState extends State<Home> {
  var res;
  var ans;
  skills() async {
    print(tokenProfile?.token);
    res = await getSkills(tokenProfile?.token);
    print('123456ppp$res');
    ans = res['data'];
    print(ans.length);
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return FutureBuilder(
        future: skills(),
        builder: (context, snap) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(),
                  // borderRadius: BorderRadius.all(Radius.circular(15))),
                  // height: 400,
                  // width: 400,
                  child: GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200 * _widthScale,
                          childAspectRatio: 2.5 / 2,
                          crossAxisSpacing: 15 * _widthScale,
                          mainAxisSpacing: 20 * _widthScale),
                      itemCount: ans == null ? 0 : ans.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (() {
                            setState(() {
                              if (index / 2 == 0) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameInfo1()));
                              } else if (index / 2 == 1) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameInfo()));
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => GameInfo2()));
                              }
                              //_launchURLApp(Uri.parse(ans[index]['link']));
                            });
                          }),
                          child: Image.network(
                            ans[index]['image_url'], fit: BoxFit.fill,
                            //style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                ),
              ),
            ],
          );
        });
  }
}
