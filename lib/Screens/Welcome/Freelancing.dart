import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import '../../constant.dart';

class UploadFreelance extends StatefulWidget {
  const UploadFreelance({Key? key}) : super(key: key);

  @override
  State<UploadFreelance> createState() => _UploadFreelanceState();
}

class _UploadFreelanceState extends State<UploadFreelance> {
  final items = ['Project Based','Month Based'];
  String? value;
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _taskdomain = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _taskbased = TextEditingController();
  TextEditingController _stipend = TextEditingController();
  TextEditingController _date = TextEditingController();
  TextEditingController _taskdesc = TextEditingController();

  void empty(){
    _usernameController.text = "";
    _emailController.text = "";
    _taskdomain.text="";
    _taskbased.text="";
    _taskdesc.text="";
    _stipend.text="";
    _date.text="";
    _phone.text="";
  }

  CollectionReference Book_doantion =
  FirebaseFirestore.instance.collection('freelancing');
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
                    height: MediaQuery.of(context).size.height * 1.40,
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
                            "Upload Freelancing Task",
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
                            "Enter Your Phone Number",
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
                        textItem("E-mail Id", _phone),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Task Domain",
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
                        textItem("Enter Task Domain", _taskdomain),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Select Task Based",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.roboto(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(16),
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black,width: 1)
                          ),

                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),hint: Text("Enter Department",style:  TextStyle(
                              fontSize: 17,
                              color: Colors.white30,
                            ),),
                                isExpanded: true,icon: Icon(Icons.arrow_drop_down,color: Colors.black,),value: value ,onChanged:(value) => setState(() =>
                                this.value = value
                                )),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Stipend",
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
                        textItem("Enter Course Platform", _stipend),
                        SizedBox(
                          height: 15.0,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Enter Task Description",
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
                        textItem("Enter Desciption of Task", _taskdesc),
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
                                    .collection("freelancing")
                                    .add({
                                  'Date': _date.text,
                                  'desc': _taskdesc.text,
                                  'domain':_taskdomain.text,
                                  'taskbased':value,
                                  'mail': _emailController.text,
                                  'name': _usernameController.text,
                                  'stipend':_stipend.text,
                                  'phone' : _phone.text,
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
              ),
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
