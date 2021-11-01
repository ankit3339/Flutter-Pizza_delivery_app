import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "package:firebase_storage/firebase_storage.dart";
import 'package:new_app/services/auth.dart';
import 'package:random_string/random_string.dart';

class Upload extends StatefulWidget {
  const Upload({ Key? key }) : super(key: key);

  @override
  State<Upload> createState() => _UploadState();
}


class _UploadState extends State<Upload> {

  TextEditingController pizzaName = TextEditingController();
  TextEditingController pizzaPrice = TextEditingController();

  //int counter = 0;


  File? selectimage;

  Future pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // final imageTemporary = File(image!.path);
    // setState(() {
    //   this.image = imageTemporary;
    // });
    if (mounted) {
      setState(() {
      selectimage ??= File(image!.path);
    });
    }
  }

  Future uploadBlog() async {
    if(selectimage != null){
      Reference storageref = FirebaseStorage.instance.ref().child("images/$pizzaName.png");

      final UploadTask task = storageref.putFile(selectimage!);
      var downloadurl = await(await task).ref.getDownloadURL();
      print("this is url $downloadurl");

      
      

      Map<String, dynamic> imagedata = <String, dynamic>{
        "imgUrl" : downloadurl,
        "pizzaName" : pizzaName.text,
        "pizzaPrice" : pizzaPrice.text
      };
       
       Future<void> pizzaDetails = FirebaseFirestore.instance.collection("pizzaDetails").add(imagedata);
      

      

    }

  }


  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      //backgroundColor: Colors.red[400],
      body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/2.jpg"),
          fit: BoxFit.cover
        )
      ),
        child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
                selectimage == null ?
                   Container(
                             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),

                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: IconButton(
                          icon: Icon(Icons.add_a_photo),
                          color: Colors.black.withOpacity(.3),
                          onPressed: (){
                            pickImage();
                          },
                        ),
                      ))
                  : Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: ClipRRect(
                        child: Image.file(
                          selectimage!,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
              SizedBox(
                height: 20,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: pizzaName,
                  decoration: InputDecoration(
                    hintText: 'Pizza Name',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(5),
                child: TextFormField(
                  controller: pizzaPrice,
                  decoration: InputDecoration(
                    hintText: 'Pizza Price : Rs',
                    
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              
              ElevatedButton(onPressed: (){
                print("doing");
                uploadBlog();
                Navigator.pop(context);
              }, child: Text("Upload"))

            ],
          ),
        ),
      ),
    );
  }
}

class Date {

  var now = DateTime.now();
}