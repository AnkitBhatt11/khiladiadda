import 'package:flutter/material.dart';
import 'package:khiladi_adda/apis/notifications.dart';
import 'package:khiladi_adda/notification_setting.dart';

import '../widgets/token_profile.dart';

class MainPage extends StatefulWidget {
  // final String title;

  // const MainPage({
  //   @required this.title,
  // });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final allowNotifications = NotificationSetting(title: 'Allow Notifications');

  final notifications = [
    NotificationSetting(title: 'Show Message'),
    NotificationSetting(title: 'Show Group'),
    NotificationSetting(title: 'Show Calling'),
  ];
  dele() {
    notifications.removeWhere((element) => element.value == true);
  }

  var res;
  var ans;
  skills() async {
    print(tokenProfile?.token);
    res = await getNotify(tokenProfile?.token);
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
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text('Notification'),
          actions: [
            IconButton(
                onPressed: () {
                  dele();
                },
                icon: Icon(Icons.delete))
          ],
        ),
        body: Column(
          children: [
            FutureBuilder(
                future: skills(),
                builder: (context, snap) {
                  return Container(
                      height: 650 * _heightScale,
                      width: 375 * _widthScale,
                      color: Color.fromARGB(255, 176, 46, 37),
                      child: ListView.builder(
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(
                                  left: 15.0 * _widthScale,
                                  right: 15 * _widthScale,
                                  top: 7.5 * _widthScale,
                                  bottom: 7.5 * _widthScale),
                              child: Container(
                                  color: Colors.white,
                                  height: 100 * _heightScale,
                                  width: 30 * _widthScale,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0 * _widthScale),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ans[index]['message'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(height: 5 * _heightScale),
                                          Text(
                                            ans[index]['id'].toString(),
                                            style: TextStyle(
                                                fontSize: 12 * _widthScale,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            'Free skins left join now ',
                                            style: TextStyle(
                                                fontSize: 12 * _widthScale,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(height: 4 * _heightScale),
                                          Text(
                                            'Sep7 , 2022 4:00pm  ',
                                            style: TextStyle(
                                                fontSize: 13 * _widthScale,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ]),
                                  )),
                            );
                          }));
                }),
            Container(
                height: 60 * _heightScale,
                width: 375,
                color: Color.fromARGB(255, 208, 46, 105),
                child: Center(
                  child: Text(
                    'Push notifications not working ? Click here ',
                    style: TextStyle(color: Colors.white),
                  ),
                )),
          ],
        )
        // ListView(
        //   children: [
        //     buildToggleCheckbox(allowNotifications),
        //     Divider(),
        //     ...notifications.map(buildSingleCheckbox).toList(),
        //   ],
        // ),
        );

    // Widget buildToggleCheckbox(NotificationSetting notification) =>
    //     buildCheckbox(
    //         notification: notification,
    //         onClicked: () {
    //           final newValue = !notification.value;

    //           setState(() {
    //             allowNotifications.value = newValue;
    //             notifications.forEach((notification) {
    //               notification.value = newValue;
    //             });
    //           });
    //         });

    // Widget buildSingleCheckbox(NotificationSetting notification) =>
    //     buildCheckbox(
    //       notification: notification,
    //       onClicked: () {
    //         setState(() {
    //           final newValue = !notification.value;
    //           notification.value = newValue;

    //           if (!newValue) {
    //             allowNotifications.value = false;
    //           } else {
    //             final allow =
    //                 notifications.every((notification) => notification.value);
    //             allowNotifications.value = allow;
    //           }
    //         });
    //       },
    //     );

    // Widget buildCheckbox({
    //   required NotificationSetting notification,
    //   required VoidCallback onClicked,
    // }) =>
    //     ListTile(
    //       onTap: onClicked,
    //       leading: Checkbox(
    //         value: notification.value,
    //         onChanged: (value) => onClicked(),
    //       ),
    //       title: Text(
    //         notification.title,
    //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
    //       ),
    //     );
  }
}
