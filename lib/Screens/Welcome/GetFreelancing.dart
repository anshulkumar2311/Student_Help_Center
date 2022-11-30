import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stu_help/Screens/Welcome/Freelancing.dart';

import '../../constant.dart';

class GetFreelancing extends StatefulWidget {
  const GetFreelancing({Key? key}) : super(key: key);

  @override
  State<GetFreelancing> createState() => _GetFreelancingState();
}

class _GetFreelancingState extends State<GetFreelancing> {
  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance.collection("freelancing").snapshots();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: kPrimaryColor,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UploadFreelance()));
          },
        ),
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Stu-Help Center',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: StreamBuilder<QuerySnapshot>(
          stream: _stream,
          builder: (context, snapshot) {
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }
            return ListView.builder(itemCount: snapshot.data?.docs.length,itemBuilder: (context,index){
              Map<String,dynamic> document = snapshot.data?.docs[index].data() as Map<String, dynamic>;

              return Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    height: MediaQuery.of(context).size.height/2,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          document["domain"] == null ? "Unknown" :  document["domain"] ,
                          style: GoogleFonts.roboto(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          document["taskbased"] == null ? "Unknown" :  document["taskbased"] ,
                          style: GoogleFonts.alice(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          document["desc"] == null ? "Unknown" :  document["desc"],
                          style: GoogleFonts.alice(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          document["stipend"] == null ? "Unknown" :  document["stipend"],
                          style: GoogleFonts.alice(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Freelancing_Id- ${index+10001}",
                          style: GoogleFonts.roboto(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          "Task Provided By: ",
                          style: GoogleFonts.roboto(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 26,
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          document["name"] == null ? "Unknown" :  document["name"],
                          style: GoogleFonts.alice(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          document["mail"] == null ? "Unknown" :  document["mail"],
                          style: GoogleFonts.alice(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          document["phone"] == null ? "Unknown" :  document["phone"],
                          style: GoogleFonts.alice(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),]
                    ),
                  ),
                ],
              );
            },
            );
          }
      ),
      ),

    );
  }
}
