import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:stu_help/constant.dart';

class UploadResource extends StatefulWidget {
  const UploadResource({Key? key}) : super(key: key);

  @override
  State<UploadResource> createState() => _UploadResourceState();
}

class _UploadResourceState extends State<UploadResource> {
  void empty(){
    _usernameController.text = "";
    _emailController.text = "";
    _coursename.text="";
    _courseplink.text="";
    _courseplatform.text="";
    _coursecategory.text="";
    _date.text="";
  }

  CollectionReference Book_doantion =
  FirebaseFirestore.instance.collection('resources');


  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _coursename = TextEditingController();
  TextEditingController _courseplatform = TextEditingController();
  TextEditingController _coursecategory = TextEditingController();
  TextEditingController _courseplink = TextEditingController();
  TextEditingController _date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: kPrimaryLightColor,
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'Stu-Help Center',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.teal,
                    ),
                    height: MediaQuery.of(context).size.height * 1.25,
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.only(left: 15, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15.0,
                        ),
                        Center(
                          child: Text(
                            "Upload Resources",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "-------------------------",
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 30.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Your Name",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textItem("Enter Name Anshul", _usernameController),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Your Mail ID",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textItem("E-mail Id", _emailController),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Course Name",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textItem("Enter Course Name", _coursename),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Course Category",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textItem("Enter Course Category", _coursecategory),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Course Platfrom",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textItem("Enter Course Platform", _courseplatform),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Course Link",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        textItem("Subject or Course of Book", _courseplink),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Todays Date",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height:10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          width: MediaQuery.of(context).size.width - 60,
                          height: 55,
                          child: TextField(
                            controller: _date,
                            //editing controller of this TextField
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                              Icons.calendar_today,
                              color: Colors.white54,
                            ),
                              labelText: "Date",
                              labelStyle: TextStyle(
                                fontSize: 17,
                                color: Colors.white30,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                  width: 1.5,
                                  color: Colors.black54,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black,
                                  )),
                            ),
                            readOnly: true,
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime(2100));

                              if (pickedDate != null) {
                                print(
                                    pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                String formattedDate =
                                    DateFormat('yyyy-MM-dd').format(pickedDate);
                                print(
                                    formattedDate); //formatted date output using intl package =>  2021-03-16
                                setState(() {
                                  _date.text =
                                      formattedDate; //set output date to TextField value.
                                });
                              } else {}
                            },
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.only(left: 20),
                        //   child: Text(
                        //     "Todays Date",
                        //     textAlign: TextAlign.left,
                        //     style: GoogleFonts.roboto(
                        //       color: kPrimaryColor,
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 25,
                        //     ),
                        //   ),
                        // ),
                        // SizedBox(height: 5,),
                        // textItem("Date (dd-mm--yyyy)", _date),
                        SizedBox(
                          height: 30.0,
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () async {
                                FirebaseFirestore.instance
                                    .collection("resources")
                                    .add({
                                  'coursecategory': _coursecategory.text,
                                  'courselink': _courseplink.text,
                                  'coursename': _coursename.text,
                                  'courseplatform': _courseplatform.text,
                                  'date': _date.text,
                                  'mail': _emailController.text,
                                  'name': _usernameController.text,
                                });
                                print("User Added");
                                empty();
                              },
                              child: Text(
                                "Submit",
                                style: GoogleFonts.radioCanada(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                primary:
                                    Colors.black, // background (button) color
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 80,
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textItem(String labletxt, TextEditingController controller) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width - 70,
        height: 55,
        child: TextFormField(
          controller: controller,
          style: TextStyle(
            fontSize: 17,
            color: kPrimaryLightColor,
          ),
          decoration: InputDecoration(
            labelText: labletxt,
            labelStyle: TextStyle(
              fontSize: 17,
              color: Colors.white30,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                width: 1.5,
                color: Colors.black,
              ),
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  width: 1,
                  color: Colors.black,
                )),
          ),
        ),
      ),
    );
  }
}
