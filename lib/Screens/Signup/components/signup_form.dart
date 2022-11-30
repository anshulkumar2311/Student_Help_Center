import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../../Components/already_have_an_account_acheck.dart';
import '../../../Services/Auth_service.dart';
import '../../../constants.dart';
import '../../Login/components/login_form.dart';
import '../../Login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

import '../../Welcome/PhonePage.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  CollectionReference Book_doantion =
  FirebaseFirestore.instance.collection('users');
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late String id;
  AuthClass authClass=AuthClass();
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            controller: _emailController,
            onSaved: (email) {},
            decoration: InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: kPrimaryColor,
              controller: _passwordController,
              decoration: InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () async {

              try {
                firebase_auth.UserCredential userCredential =
                await firebaseAuth.createUserWithEmailAndPassword(
                    email: _emailController.text,
                    password: _passwordController.text)
                ;
                print(userCredential.user?.uid);
                FirebaseFirestore.instance
                    .collection("users")
                    .add({
                  'mail': _emailController.text,
                  'id' : userCredential.user?.uid,
                });
                print("User Added");
              }
              catch(e){
                final snackbar = SnackBar(content: Text(e.toString()));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);
              }
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              SizedBox(width: 90,),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=> const PhoneAuthPage()));
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(width: 50,),
              InkWell(
                onTap: (){
                  authClass.googleSignIn(context);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kPrimaryColor,
                  ),
                  child: Icon(
                    Icons.facebook,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: defaultPadding,),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}