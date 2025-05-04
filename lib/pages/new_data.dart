import 'package:flutter/material.dart';

class NewData extends StatefulWidget {
  const NewData({super.key});

  @override
  State<NewData> createState() => _NewDataState();
}

class _NewDataState extends State<NewData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('new data')), body: Center());
  }
}
