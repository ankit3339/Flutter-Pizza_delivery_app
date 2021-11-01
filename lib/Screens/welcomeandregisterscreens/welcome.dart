import 'package:flutter/material.dart';
import 'package:new_app/Screens/home.dart';
import 'package:new_app/Screens/welcomeandregisterscreens/choosewelcome.dart';

class Welcome extends StatelessWidget {
  const Welcome({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement<void, void>(
    context,
    MaterialPageRoute<void>(
      builder: (BuildContext context) => const Authentication(),
    ),
  );
              },
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/2.jpg"),
                    fit: BoxFit.cover
                  )
                ),
                child: 
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text("PIZZA", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.white,
                            letterSpacing: 2
                          ),),
                          SizedBox(height: 10),
                          Text("CREATE YOUR OWN PIZZA", 
                          style: TextStyle(fontSize: 15, color: Colors.white),
                          
                          )
                        ],
                      ),
                    ),
                    
                 
              ),
            ),
          ],
        ),
      
    );
    

  }
}