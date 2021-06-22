import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  static const routeName = "/next_page";
  const NextPage({ Key? key }) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Waiting on the design"),),
    );
  }
}