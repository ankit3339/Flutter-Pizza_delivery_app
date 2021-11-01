import 'package:flutter/material.dart';
import 'package:new_app/Screens/welcomeandregisterscreens/login.dart';
import 'package:new_app/Screens/welcomeandregisterscreens/signup.dart';

import '../home.dart';

class Authentication extends StatelessWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.jpg"), fit: BoxFit.cover)),
            child: Column(
              
              children: [
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(50),
                  //color: Colors.black,
                  child: Center(
                    child: Container(
                      
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        //color: Colors.black,
                          image: DecorationImage(
                        image: AssetImage("images/social.png"),
                      )),
                    ),
                  ),
                ),
                //SizedBox(height: 35),
                Text(
                  "PIZZA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.white,
                      letterSpacing: 2),
                ),
                SizedBox(height: 10),
                Text(
                  "CREATE YOUR OWN PIZZA",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 65),
                Text(
                  "Sign in with",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return Login();
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Text("Login",style: TextStyle(fontSize: 18,color: Colors.grey )),
                      ),
                    ),
                    SizedBox(width: 35,),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return SignUp();
                        }));
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(25))
                        ),
                        child: Text("Sign Up",style: TextStyle(fontSize: 18,color: Colors.grey )),
                      ),
                    ),
                    
                  ],
                ),
                SizedBox(height: 25,),
                Text(
                  "Don't worry, we will not post anything\n without your permission",
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                SizedBox(height: 95,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(25))
                      ),
                      child: Text(" Register with Future Choice",style: TextStyle(fontSize: 18,color: Colors.grey )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
