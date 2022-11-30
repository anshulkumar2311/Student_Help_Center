import 'package:flutter/material.dart';
import 'package:stu_help/Screens/Welcome/Freelancing.dart';
import 'package:stu_help/Screens/Welcome/GetFreelancing.dart';
import 'package:stu_help/Screens/Welcome/GetResources.dart';
import 'package:stu_help/Screens/Welcome/Resoruces.dart';
import '../constant.dart';
import 'Chatting.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text("Stu-Help Center",style: TextStyle(
            color: Colors.black,
            fontSize: 25,
          ),),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ChatScreen()));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black,
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         Icon(Icons.message,size: 80,color: Colors.white,),
                          SizedBox(
                            width: 20,
                          ),Text("anonymous Chat", style: TextStyle(
                            fontSize: 25,
                          ),),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GetFreelancing()));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black,
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.currency_rupee_outlined,size: 80,color: Colors.white,),
                          Text("Get Freelancing Task", style: TextStyle(
                              fontSize: 25
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UploadFreelance()));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black,
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add_box,size: 80,color: Colors.white,),
                          SizedBox(width: 20,),Text("Add Freelancing \nProjects", style: TextStyle(
                              fontSize: 25
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => UploadResource()));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black,
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.upload_file,size: 80,color: Colors.white,),
                          SizedBox(width: 50,),Text("Upload Free\nResources", style: TextStyle(
                              fontSize: 25
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> GetResources()));
                  },
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height/6,
                    child: Card(
                      elevation: 20,
                      shadowColor: Colors.black,
                      color: Colors.teal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.download,size: 80,color: Colors.white,),
                          Text("Get Free Resources", style: TextStyle(
                              fontSize: 25
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
