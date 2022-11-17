import 'package:flutter/material.dart';

class ViewAllChallenge extends StatefulWidget {
  const ViewAllChallenge({Key? key}) : super(key: key);

  @override
  State<ViewAllChallenge> createState() => _ViewAllChallengeState();
}

class _ViewAllChallengeState extends State<ViewAllChallenge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Challenges'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.red,
    );
  }
}
