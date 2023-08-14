import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration_form/LoginPage.dart';
class RegistrationFormPage extends StatefulWidget {
  const RegistrationFormPage({super.key});

  @override
  State<RegistrationFormPage> createState() => _RegistrationFormPageState();
}
class UserInfo {
  final String name;
  final String email;

  UserInfo(this.name, this.email);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
class _RegistrationFormPageState extends State<RegistrationFormPage> {
  bool isObscured = true;
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
  final TextEditingController textEditingController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double height = mediaQueryData.size.height;
    double width = mediaQueryData.size.width;
    double aspectRatioOfContext = mediaQueryData.size.aspectRatio;
    double textsize = mediaQueryData.size.width > 600 ? 80.0 : 40.0;
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,100,0,10),
                    child: Text("Messenger",
                      style: TextStyle(
                        fontSize: textsize,
                        fontWeight: FontWeight.bold,
                        ),),
                  ),
                  const Divider(
                    thickness: 2,
                    color: Colors.black,
                    indent: 50.0,
                    endIndent: 50.0,
                    height: 5,
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0,5,0,10),
                    child: Text("Message privately!",
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500))
                      ),
                  SizedBox(height: height*0.05,),
                  const Text("Register",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight:FontWeight.bold),),
                  SizedBox(height: height*0.05,),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width*0.8,
                      maxHeight: height*0.1
                    ),
                    child: TextField(
                      controller: textEditingController1,
                      decoration: InputDecoration(
                        labelText: "Name",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                        ),
                        hintText: "Enter your Name",
                        prefixIcon: const Icon(Icons.person,color: Colors.blueAccent,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.blueAccent,width: 4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.blueAccent,width: 4),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width*0.8,
                      maxHeight: height*0.1
                    ),
                    child: TextField(
                      controller: textEditingController2,
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold
                        ),
                        hintText: "example@gmail.com",
                        prefixIcon: const Icon(Icons.email_rounded,color: Colors.blueAccent,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.blueAccent,width: 4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.blueAccent,width: 4),
                        )
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.02,),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width*0.8,
                      maxHeight: height*0.1
                    ),
                    child: TextField(
                      obscureText: isObscured,
                      controller: textEditingController3,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "abc?123",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: const Icon(Icons.lock,color: Colors.blueAccent,),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                isObscured = !isObscured;
                            });
                            },
                            child: Icon(isObscured ? Icons.visibility_off : Icons.visibility,color: Colors.blueAccent,),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.blueAccent,width: 5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.blueAccent,width: 4),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: height*0.06,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    onPressed: () {
                      setState((){
                        _registerUser(context);
                            //Navigator.pop(context);
                          //Navigator.pushNamed(context, '/verifyEmail',arguments: textEditingController2.text);
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(aspectRatioOfContext*0.2),
                      child: const Text("REGISTER",style: TextStyle(fontSize: 22,color: Colors.white),),
                      )
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Existing one?",
                        style: TextStyle(
                          fontSize: 20,
                          ),),
                      TextButton(onPressed: (){
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const LoginPage()));
                      },
                      child: const Text(
                        "Login Here",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ))
                    ],
                  )
                  ])
                ),
          )],
      ),
    );
  }
  Future<void> _registerUser(BuildContext context) async{
    final String name = textEditingController1.text;
    final String email = textEditingController2.text;
    final String password = textEditingController3.text;
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
      final UserInfo userInfo = UserInfo(name, email);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userInfo.toJson());
      // User registration successful
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
      } else{
        // Show error message if fields are empty
        throw Exception('Please fill in all fields.');
      }
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                  content: Text('$e'),
                ),
              );
    }
  }
}