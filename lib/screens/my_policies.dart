import 'package:flutter/material.dart';

class MyPolicies extends StatefulWidget {
  MyPolicies({Key key}) : super(key: key);

  @override
  _MyPoliciesState createState() => _MyPoliciesState();
}

class _MyPoliciesState extends State<MyPolicies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('No policy subscriptions yet'),
      ),
    );
  }
}
