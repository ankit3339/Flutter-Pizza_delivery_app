import 'package:flutter/material.dart';
import 'package:new_app/Screens/pay.dart';


class Category extends StatefulWidget {
  final pizza_name;
  final pizza_image;

  const Category({ @required this.pizza_name,@required this.pizza_image });

  

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        toolbarHeight: 40,
        iconTheme: IconThemeData(
          color: Colors.red
        ),
      ),
      // body: Column(
      //   children: [
      //     Container(
      //       height: MediaQuery.of(context).size.height*0.7,
      //       //color: Colors.white,
      //       decoration: BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.only(
      //           bottomLeft: Radius.circular(30),
      //           bottomRight: Radius.circular(30),
      //         )
      //       ),
      //       padding: EdgeInsets.only(left:20, right: 20, bottom: 20),
      //       child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [
      //           Row(
      //             crossAxisAlignment: CrossAxisAlignment.end,
      //             children: [
      //               Container(
      //                 padding: EdgeInsets.all(10),
      //                 margin: EdgeInsets.only( bottom: 20),
      //                 decoration: BoxDecoration(
      //                   color: Colors.red,
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(30)
      //                   )
      //                 ),
      //                 child: Text("\$9.3",style: TextStyle(color: Colors.white),),
      //               ),
      //               Container(

      //               height: MediaQuery.of(context).size.height*0.3,
      //               width: MediaQuery.of(context).size.width*0.7,
      //                 decoration: BoxDecoration(
      //                   //color: Colors.red,
      //                   image: DecorationImage(
      //                     image: AssetImage("images/1.png")
      //                   )
      //                 ),
      //               ),
      //             ],
      //           ),
      //           //SizedBox(height: 40,),
      //           Text("VEGAN", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.w500),),
      //           SizedBox(height: 10,),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
                    
      //                   Text("Tomato Pizza", style: TextStyle(fontWeight: FontWeight.w700, fontSize: 30)),

      //                 Container(
      //                   padding: EdgeInsets.all(10),
      //                   decoration: BoxDecoration(
      //                   color: Colors.red,
      //                   borderRadius: BorderRadius.all(
      //                     Radius.circular(30)
      //                   )
      //                 ),
      //                 child: Text("-     1    +", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),
      //                 )
      //                 )
      //             ],
      //           ),
      //           Text("Let's make it better?", style: TextStyle(color: Colors.red, fontSize: 18)),
      //         ],
      //       ),
      //     ),
      //     ElevatedButton(onPressed: (){ 
      //       Navigator.push(context, MaterialPageRoute(builder: (context){
      //         return Pay();
      //       }));
      //     }, child: Text("Done"))
      //   ],
      // ),
      body: ListView(
        children: [
          SizedBox(
            height: 300,
            child: Image.network(widget.pizza_image,
            loadingBuilder: (context, child, progress){
              return progress == null ? child : LinearProgressIndicator();
            },
            semanticLabel: 'Dash masot',
            
            ),
            
            // child: Image.network("https://www.pngfind.com/pngs/m/80-800270_pizza-png-high-quality-image-png-de-pizza.png",
            // loadingBuilder: (context, child, progress){
            //   return progress == null ? child : LinearProgressIndicator();
            // },
            // ),
            
          )
        ],
      ),

    );
  }
}