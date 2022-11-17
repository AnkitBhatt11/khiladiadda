import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/recent_trans.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';

class InviteFriends extends StatefulWidget {
  const InviteFriends({Key? key}) : super(key: key);

  @override
  State<InviteFriends> createState() => _InviteFriendsState();
}

class _InviteFriendsState extends State<InviteFriends> {
  var res;
  var ans;
  skills() async {
    print(tokenProfile?.token);
    res = await getRecentTransaction(tokenProfile?.token);
    print('123456ppp${res['data']['transactions'].length}');

    return ans;
  }

  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 226, 33, 20),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('Invite Friends'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Column(children: [
        Container(
            color: Color.fromARGB(255, 226, 33, 20),
            height: _heightScale * 200,
            width: _widthScale * 375,
            child: Row(
              children: [
                Image.asset(
                    'assets/WhatsApp Image 2022-09-08 at 4.17.05 PM.jpeg'),
                SizedBox(
                  width: 10 * _widthScale,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Refer Friends ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      ' and ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Earn 5 coins ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      ' for each ',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      ' referral',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                )
              ],
            )),
        SizedBox(
          height: 15 * _heightScale,
        ),
        Text(
          'Your Invite Code is ',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          'I7eoro2f ',
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 25 * _widthScale),
        ),
        SizedBox(
          height: 35 * _heightScale,
        ),
        ElevatedButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => InviteFriends()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.group_add,
                ),
                Text(
                  'INVITE VIA WHATSAPP',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13 * _widthScale),
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green),
              fixedSize: MaterialStateProperty.all(Size(200, 40)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.green))),
            )
            // fixedSize: Size(120, 40),
            // primary: Colors.red,
            //padding: EdgeInsets.symmetric(horizontal: 50 * _widthScale)
            ),
        SizedBox(
          height: 11 * _heightScale,
        ),
        ElevatedButton(
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => InviteFriends()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.share,
                ),
                Text(
                  'MORE SHARE OPTIONS',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 13 * _widthScale),
                ),
              ],
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red),
              fixedSize: MaterialStateProperty.all(Size(200, 40)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.red))),
            )
            // fixedSize: Size(120, 40),
            // primary: Colors.red,
            //padding: EdgeInsets.symmetric(horizontal: 50 * _widthScale)
            ),
        SizedBox(
          height: 15 * _heightScale,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Total Friends Joined',
              style: TextStyle(
                  fontWeight: FontWeight.w500, fontSize: 14 * _widthScale),
            ),
            ElevatedButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => InviteFriends()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'VIEW',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16 * _widthScale),
                    ),
                  ],
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                  fixedSize: MaterialStateProperty.all(Size(90, 40)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.red))),
                )
                // fixedSize: Size(120, 40),
                // primary: Colors.red,
                //padding: EdgeInsets.symmetric(horizontal: 50 * _widthScale)
                ),
          ],
        ),
        //white screen
      ]),
    );
  }
}
