import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Screens/home.dart';
import 'package:new_app/Screens/ownerside/upload.dart';
import 'package:new_app/Screens/welcomeandregisterscreens/welcome.dart';
import 'package:new_app/services/auth.dart';
import 'package:provider/provider.dart';

import 'Screens/ownerside/homepage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_)=> AuthServices(FirebaseAuth.instance)),
        StreamProvider(create: (context) => context.read<AuthServices>().authStateChange, initialData: null)
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        //darkTheme: ThemeData.dark(),
        theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.grey),
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
            color: Colors.white
          ),
        ),
        home: Wrap(), 
      ),
    );
  }
}

class Wrap extends StatelessWidget {
  const Wrap({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final user = context.watch<User?>();
    // if (user != null){
    //   return Home();
    // }
    return Home();
  }
}