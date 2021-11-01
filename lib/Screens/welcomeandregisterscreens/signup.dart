import 'package:flutter/material.dart';
import 'package:new_app/services/auth.dart';
import 'package:provider/src/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({ Key? key }) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final TextEditingController _fullname =  TextEditingController();
  final TextEditingController _location =  TextEditingController();
  final TextEditingController _email = TextEditingController();
    final TextEditingController _password =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.jpg"), fit: BoxFit.cover)),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.25,
                      child: Stack(
                        children: [
                          Positioned(
                            top: 60,
                            left: 10,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(50)
                                  )
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: Icon(
                                      Icons.arrow_back,
                                      color: Colors.black54,
                                      size: 30,
                                    )),
                              )),
                          Center(
                              child: Container(
                                  margin: EdgeInsets.only(top: 70),
                                  child: Text(
                                    "PIZZA",
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        letterSpacing: 2),
                                  ))),
                        ],
                      )),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(35),
                              topLeft: Radius.circular(35))),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text("Let's get Started? ",
                                  style: TextStyle(
                                    fontSize: 20,
                                  )),
                              Text("Sign in with Email And Password",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.grey)),
                              SizedBox(
                                height: 20,
                              ),
                              Row(children: <Widget>[
                                Expanded(
                                  child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 15.0),
                                      child: Divider(
                                        color: Colors.black,
                                        height: 50,
                                      )),
                                ),
                                
                              ]),
                              SizedBox(
                                  height: 20,
                                ),
                                Text("Fullname"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.redAccent.withOpacity(0.5)
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25)
                                    )
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none
                                    ),
                                    controller: _fullname,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Location"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.redAccent.withOpacity(0.5)
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25)
                                    )
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none
                                    ),
                                    controller: _location,
                                  ),
                                ),
                              SizedBox(
                                  height: 20,
                                ),
                                Text("Email"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.redAccent.withOpacity(0.5)
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25)
                                    )
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none
                                    ),
                                    controller: _email,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text("Password"),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.symmetric(horizontal: 20),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.redAccent.withOpacity(0.5)
                                    ),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(25)
                                    )
                                  ),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      border: InputBorder.none
                                    ),
                                    controller: _password,
                                  ),
                                ),
                                SizedBox(height:30,),
                        
                                Center(
                                  child: GestureDetector(
                                    onTap: (){
                                      context.read<AuthServices>().signUp(email: _email.text.trim(), password: _password.text.trim(), fullname: _fullname.text.trim(), location: _location.text.trim());
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      margin: EdgeInsets.symmetric(horizontal: 20),
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(Radius.circular(25))
                                      ),
                                      child: Center(child: Text("Sign In", style: TextStyle(color: Colors.white),)),
                                    ),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}