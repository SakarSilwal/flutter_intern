import 'package:flutter/material.dart';
import 'package:flutter_application_1/nav.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('second screen')),

      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => HomeScreen()),
            // );
            Navigator.pop(context);
          },
          child: Text('this is second screen'),
        ),
      ),
    );
  }
}
