import 'package:flutter/material.dart';

class AcceptScreen extends StatefulWidget {
  const AcceptScreen({Key? key}) : super(key: key);

  @override
  State<AcceptScreen> createState() => _AcceptScreenState();
}

class _AcceptScreenState extends State<AcceptScreen> {
  @override
  Widget build(BuildContext context) {
    double kDesignWidth = 375;
    double kDesignHeight = 812;
    final double _widthScale = MediaQuery.of(context).size.width / kDesignWidth;
    final double _heightScale =
        MediaQuery.of(context).size.height / kDesignHeight;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 200 * _heightScale,

          leading: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Icon(Icons.arrow_back),
            ),
          ),
          //  title: Text('App Bar!'),
          flexibleSpace: Image(
            image: AssetImage('assets/Logo.png'),
            fit: BoxFit.cover,
          ),
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              color: Color.fromARGB(255, 169, 162, 162),
              height: 40 * _heightScale,
              child: Text(
                'Rules/How To Play',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'WeaponLess Survival Battle Only Loot Drop + BGMI Event Gun (BRDM Not Allowed, Low Level Not Allowed ,Cash Prize Upto 12 RANKS , 60% Bonus Usable)',
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                '22 Sep 10:00 AM',
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 10 * _heightScale,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(Icons.exit_to_app_outlined),
                      Text('Entry Fee')
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.person),
                      Text('Participant', style: TextStyle(color: Colors.blue))
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.leaderboard),
                      Text(
                        'Winning',
                        style: TextStyle(color: Colors.orange),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10 * _heightScale,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'You will get',
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                      Text(
                        '0.00 coins per ',
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                      Text(
                        '1 Kill',
                        style: TextStyle(color: Colors.green, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Mode',
                        // style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        'TPP ',
                        //  style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Bonus',
                        style: TextStyle(color: Colors.orange),
                      ),
                      Text(
                        'B60 ',
                        style: TextStyle(color: Colors.orange),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Map',
                        // style: TextStyle(color: Colors.green),
                      ),
                      Text(
                        'ERANGEL ',
                        //  style: TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10 * _heightScale,
            ),
            Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Prize Pool BreakUp',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  height: 28.25 * _heightScale,
                  width: kDesignWidth / 2 * _widthScale,
                  decoration: BoxDecoration(
                    //  border: BoxBorder(),
                    border: Border.all(color: Colors.black),
                    color: Colors.white,
                  ),
                ),
                InkWell(
                  onTap: () {
                    // showPhotoBottomSheet();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      'View Full PrizePool ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                    height: 28.25 * _heightScale,
                    width: kDesignWidth / 2 * _widthScale,
                    decoration: BoxDecoration(
                      //  border: BoxBorder(),
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10 * _heightScale,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Standing',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Prize(Coins)',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.red,
          height: 60 * _heightScale,
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.leaderboard,
                        color: Colors.white,
                      ),
                      Text('MY LEAGUES',
                          style: TextStyle(color: Colors.white, fontSize: 10))
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      Text('PARTICIPANT',
                          style: TextStyle(color: Colors.white, fontSize: 10))
                    ],
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      Text(
                        '    JOIN    ',
                        style: TextStyle(color: Colors.white, fontSize: 10),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
