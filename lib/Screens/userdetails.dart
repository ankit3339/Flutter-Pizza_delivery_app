import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Human extends StatelessWidget {
  const Human({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("userData").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if (!snapshot.hasData){
            return CircularProgressIndicator();
          }

          return ListView(
            children: snapshot.data!.docs.map((document) {
              return Row(
                children: [
                  Container(
                    child: Text(document['Fullname']),
                  ),
                  Container(
                    child: Text(document['Email'])),
                  
                ],
              );
            }).toList()
          );
        },
      ),
    );
  }
}