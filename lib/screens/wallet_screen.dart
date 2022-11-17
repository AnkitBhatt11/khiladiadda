import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/recent_trans.dart';
import 'package:khiladi_adda/widgets/token_profile.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
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
        backgroundColor: Colors.red,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
        title: Text('My Wallet'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications))
        ],
      ),
      body: Column(children: [
        Container(
          color: Colors.red,
          height: _heightScale * 160,
          width: _widthScale * 375,
          child: Padding(
            padding: EdgeInsets.all(18.0 * _widthScale),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Balance',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18 * _widthScale,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.currency_rupee,
                      color: Colors.white,
                    ),
                    Text(
                      '100',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24 * _widthScale,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20 * _heightScale,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 50 * _heightScale,
                      width: 105 * _widthScale,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Deposited',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12 * _widthScale,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '5.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12 * _widthScale,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50 * _heightScale,
                      width: 105 * _widthScale,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Winning',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12 * _widthScale,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '0.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12 * _widthScale,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 50 * _heightScale,
                      width: 105 * _widthScale,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Bonus',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12 * _widthScale,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            '0.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12 * _widthScale,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),

        //white screen
        FutureBuilder(
            future: skills(),
            builder: (context, snap) {
              return Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recent Transactions',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15 * _widthScale,
                              fontWeight: FontWeight.w800),
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                primary: Colors.grey[300]),
                            child: Text(
                              'View All',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12 * _widthScale,
                                  fontWeight: FontWeight.w600),
                            ))
                      ],
                    ),
                    Container(
                        height: 400 * _heightScale,
                        width: 350 * _widthScale,
                        child: ListView.builder(
                            itemCount: res['data']['transactions'] == null
                                ? 0
                                : res['data']['transactions'].length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8.0 * _widthScale),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 80 * _heightScale,
                                    width: 105 * _widthScale,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  left: 8.0 * _widthScale),
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.currency_rupee,
                                                    size: 20 * _widthScale,
                                                  ),
                                                  Text(
                                                    res['data']['transactions']
                                                            [index]['amount']
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize:
                                                            18 * _widthScale,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  EdgeInsets.only(right: 8.0),
                                              child: Text(
                                                res['data']['transactions']
                                                    [index]['type'],
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12 * _widthScale,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          '0.00',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12 * _widthScale,
                                              fontWeight: FontWeight.w600),
                                        )
                                      ],
                                    )),
                              );
                            }))
                  ],
                ),
              );
            })
      ]),
    );
  }
}
