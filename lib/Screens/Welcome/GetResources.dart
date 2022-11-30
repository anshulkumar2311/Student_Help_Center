import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stu_help/Screens/Welcome/Resoruces.dart';
import '../../constant.dart';
import 'Freelancing.dart';

class GetResources extends StatefulWidget {
  const GetResources({Key? key}) : super(key: key);

  @override
  State<GetResources> createState() => _GetResourcesState();
}

class _GetResourcesState extends State<GetResources> {
  final Stream<QuerySnapshot> _stream = FirebaseFirestore.instance.collection("resources").snapshots();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add,color: Colors.white,),
          backgroundColor: kPrimaryColor,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => UploadResource()));
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
                              document["coursecategory"] == null ? "Unknown" :  document["coursecategory"] ,
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
                              document["coursename"] == null ? "Unknown" :  document["coursename"] ,
                              style: GoogleFonts.alice(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              document["courseplatform"] == null ? "Unknown" :  document["courseplatform"],
                              style: GoogleFonts.alice(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                            Text(
                              document["courselink"] == null ? "Unknown" :  document["courselink"],
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
                              "FreeResouce_Id- ${index+10001}",
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
                              "Resource Provided By: ",
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
                              document["date"] == null ? "Unknown" :  document["date"],
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
