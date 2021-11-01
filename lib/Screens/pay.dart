import 'package:flutter/material.dart';


class Pay extends StatelessWidget {
  const Pay({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.red
        ),
      ),
      body: Container(
        child: Text("DONE", style: TextStyle(fontSize: 30),),
      ),
    );
  }
}