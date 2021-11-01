import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:new_app/models/categorymodel.dart';
import 'package:new_app/services/auth.dart';
import 'package:provider/src/provider.dart';

import 'upload.dart';

class HomePage extends StatefulWidget {
  //const Home({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future getDetails() async{
    // CollectionReference _collectionRef = FirebaseFirestore.instance.collection("pizzaDetails");
    // QuerySnapshot querySnapshot = await _collectionRef.get();

    // // Get data from docs and convert map to List
    // final allData = querySnapshot.docs.map((doc) => doc.data()).toString();
    // //
    // print(allData);
    FirebaseFirestore.instance.collection("pizzaDetails").get().then(
  (value) {
    value.docs.forEach(
      (element) {
        print(element.data()["imgUrl"]);
        List<CategoryModel> _categoryModel =[


    CategoryModel(name: element.data()["pizzaName"], image: element.data()["imgUrl"], price: element.data()["pizzaPrice"]),
    
  ];
      },
    );
  },
);
  }
 

  // final List<CategoryModel> _categoryModel =[


  //   CategoryModel(name: "Chinese Pizza", image: "images/1.png", price: "\$4.99"),
  //   CategoryModel(name: "Nepali Pizza", image: "images/2.png", price: "\$3.99"),
  //   CategoryModel(name: "Indian Pizza", image: "images/3.png",price: "\$6.99"),
  //   CategoryModel(name: "Australian Pizza", image: "images/4.png",price: "\$9.99"),
  // ];



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/2.jpg"), fit: BoxFit.cover)),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.apps,
                            size: 40,
                            color: Colors.white,
                          ),
                          Text(
                            "PIZZA",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 2),
                          ),
                          GestureDetector(
                            onTap: (){
                              context.read<AuthServices>().signOut();
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50))),
                                child: Icon(
                                  Icons.logout_outlined,
                                  size: 30,
                                  color: Colors.red,
                                )),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Center(
                                  child: Icon(
                                Icons.align_vertical_bottom,
                                color: Colors.red,
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              margin: EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Center(
                                  child: Text(
                                "Margharita",
                                style: TextStyle(color: Colors.red),
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              margin: EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Center(
                                  child: Text(
                                "Greek",
                                style: TextStyle(color: Colors.red),
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              margin: EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Center(
                                  child: Text(
                                "Nepali",
                                style: TextStyle(color: Colors.red),
                              )),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 30),
                              margin: EdgeInsets.only(right: 30),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50))),
                              child: Center(
                                  child: Text(
                                "Sushi",
                                style: TextStyle(color: Colors.red),
                              )),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: MediaQuery.of(context).size.width,
                          child: StreamBuilder(
                            stream: FirebaseFirestore.instance.collection("pizzaDetails").snapshots(),
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {

                              if (!snapshot.hasData){
                                  return CircularProgressIndicator();
                                }
                              return ListView.builder(
                                itemCount: snapshot.data!.docs.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index){
                                  DocumentSnapshot user = snapshot.data!.docs[index];
                                return Card(
                                  child: Container(
                                      height: MediaQuery.of(context).size.height * 0.3,
                                      width: MediaQuery.of(context).size.width*0.45,
                                      padding: EdgeInsets.all(10),
                                      margin: EdgeInsets.only(right: 30),
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(10))),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              Icon(Icons.help),
                                              Icon(Icons.favorite, color: Colors.red)
                                            ],
                                          ),
                                          Container(
                                            height: 150,
                                            width: 200,
                                            //olor: Colors.black,
                                            margin: EdgeInsets.only(top:10, left: 10, right: 10),
                                            child: Image.network(user["imgUrl"])
                                            
                                            ),
                                                      
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(" --Non Veg--", style: TextStyle(color: Colors.orange),),
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(50))),
                                              child: Text(user['pizzaPrice'],style: TextStyle(color: Colors.white),),
                                                )
                                              ],
                                            ),
                                            Text(user["pizzaName"], style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)
                                        ],
                                      ),
                                    ),
                                );
                              });
                            }
                          ),
                          
                        ),
                      
                      
                    ],
                  ),
                ),
                Expanded(
                        child: Container(
                          
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                        BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50))
                          ),
                          child: Container(
                            margin: EdgeInsets.all(30),
                            child: Column(
                              
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(  10),
                                      decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius:
                                        BorderRadius.all( Radius.circular(50))
                          ),
                                      child: Icon(Icons.location_pin, color: Colors.white,)),
                                      Column(
                                        children:const [
                                          Text("Your delivery Location", style: TextStyle(color: Colors.red),),
                                          Text("Machegaun, Chandragiri-09, KTM")
                                        ]
                                      ),
                                      Icon(Icons.comment, color: Colors.red)
                                  ],
                                ),

                                SizedBox(
                                  height: 80
                                ),

                                Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[50],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30)
                                    )
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (index){
                                          return Upload();
                                        }));
                                      }, icon: Icon(Icons.add_box_rounded)),

                                      IconButton(onPressed: (){}, icon: Icon(Icons.search_off_outlined)),
                                      IconButton(onPressed: (){
                                        getDetails();
                                      }, icon: Icon(Icons.bookmark)),
                                      IconButton(onPressed: (){
                                        
                                      }, icon: Icon(Icons.person_add))
                                    ],
                                  ),
                                )


                              ],
                            ),
                          ),
                        ),
                      )
              ],
            ),

          ),
        ],
      ),
    );
  }
}
