import 'package:flutter/material.dart';
import 'package:khiladi_adda/screens/invite_friends.dart';

class Referrals extends StatefulWidget {
  const Referrals({Key? key}) : super(key: key);

  @override
  State<Referrals> createState() => _ReferralsState();
}

class _ReferralsState extends State<Referrals> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      backgroundColor: Colors.grey[350],
      body: Center(
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 30 * _heightScale,
              ),
              Text(
                'REFER & EARN',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30 * _widthScale,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          height: 520 * _heightScale,
          width: 275 * _widthScale,
          decoration: BoxDecoration(color: Color.fromARGB(228, 194, 31, 19)),
        ),
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
               Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  InviteFriends()));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text('Next'), Icon(Icons.arrow_forward)],
          ),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            fixedSize: MaterialStateProperty.all(Size(120, 40)),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red))),
          )
          // fixedSize: Size(120, 40),
          // primary: Colors.red,
          //padding: EdgeInsets.symmetric(horizontal: 50 * _widthScale)
          ),
    );
    //   );
  }
}
