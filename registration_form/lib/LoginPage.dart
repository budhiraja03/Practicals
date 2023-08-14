import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:registration_form/RegistrationFormPage.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isObscured = true;
  final TextEditingController textEditingController1 = TextEditingController();
  final TextEditingController textEditingController2 = TextEditingController();
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
                    child: Text("Message privately",
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500))
                      ),
                  SizedBox(height: height*0.05,),
                  const Text("Login Here",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight:FontWeight.bold),),
                  SizedBox(height: height*0.05,),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width*0.8,
                      maxHeight: height*0.08
                    ),
                    child: TextField(
                      controller: textEditingController1,
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
                      maxWidth: width * 0.8,
                      maxHeight: height*0.08
                    ),
                    child: TextField(
                      controller: textEditingController2,
                      obscureText: isObscured,
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
                  Container(
                    margin: const EdgeInsets.fromLTRB(200, 0, 10, 0),
                    child: TextButton(onPressed: (){
                  
                    },
                    child: const Text("Forgot Password?",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.blueGrey),)
                      ),
                  ),
                  SizedBox(height: height*0.05,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    onPressed: (){
                      setState((){
                        _existingAccount(context);
                        });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(aspectRatioOfContext*0.2),
                      child: const Text("LOG IN",style: TextStyle(fontSize: 22,color: Colors.white),),
                      )
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("For new account?",
                        style: TextStyle(
                          fontSize: 20,
                          ),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegistrationFormPage()));
                      },
                      child: const Text(
                        "Register Here",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ))
                    ],
                  ),
                ]),
            ),
          )
      ])
    );
  }
  Future<void> _existingAccount(BuildContext context1) async{
    final String email = textEditingController1.text;
    final String password = textEditingController2.text;

    try{
      if(email.isNotEmpty && password.isNotEmpty)
      {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        ScaffoldMessenger.of(context1).showSnackBar(
          const SnackBar(
          content: Text('Login successfully'),
                    ),
                  );
      } else{
        throw Exception("Invalid credentials");
      }
    } on Exception catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                  content: Text('$e'),
                ),
              );
    }
  }
}