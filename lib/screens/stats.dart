import 'package:flutter/material.dart';

class stats extends StatefulWidget {
  const stats({Key? key}) : super(key: key);

  @override
  State<stats> createState() => _statsState();
}

class _statsState extends State<stats> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return Scaffold(
      bottomSheet: SizedBox(
        height: 120 * _heightScale,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 10 * _heightScale,
              ),
              Text(
                'Click here to redeem voucher',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              Text('Voucher code & pin required to avail the offer'),
              SizedBox(
                height: 10 * _heightScale,
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
                        'REDEEM VOUCHER',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16 * _widthScale),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    fixedSize: MaterialStateProperty.all(
                        Size(290 * _widthScale, 40 * _heightScale)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            side: BorderSide(color: Colors.red))),
                  )
                  // fixedSize: Size(120, 40),
                  // primary: Colors.red,
                  //padding: EdgeInsets.symmetric(horizontal: 50 * _widthScale)
                  ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('My Stats & Voucher'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          // height: 400,
          // width: 400,
          child: GridView.builder(
              shrinkWrap: true,
              //  physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200 * _widthScale,
                  childAspectRatio: 1.5 / 2,
                  crossAxisSpacing: 15 * _widthScale,
                  mainAxisSpacing: 18 * _widthScale),
              itemCount: 20,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => IndividualPage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(2))),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Logo.png', fit: BoxFit.cover,
                          height: 130 * _heightScale,
                          width: 130 * _widthScale,
                          //style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Contests',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16 * _widthScale),
                        ),
                        Text('0'),
                        SizedBox(
                          height: 10 * _heightScale,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'Wins',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16 * _widthScale,
                                      color: Colors.green),
                                ),
                                Text('0'),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'Losses',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16 * _widthScale,
                                      color: Colors.red),
                                ),
                                Text('0'),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
