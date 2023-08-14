import 'package:flutter/material.dart';
import 'package:musicophile/screens/DashboardPage.dart';

import 'RegisterPage.dart';
class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isObscured = true;
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
          Opacity(
            opacity: 0.4,
            child: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/Headphone-amico.png'),
                fit: BoxFit.cover)
            ),),
          ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,100,0,10),
                    child: Text("MusicoPhile",
                      style: TextStyle(
                        fontSize: textsize,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pacifico'),),
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
                    child: Text("Harmonize Your World: Unleash the Melody Within!",
                      style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500))
                      ),
                  SizedBox(height: height*0.05,),
                  const Text("Unlock Your Tunes",
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Courgette',
                    color: Colors.black,
                    fontWeight:FontWeight.bold),),
                  SizedBox(height: height*0.05,),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: width*0.8,
                      maxHeight: height*0.08
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Email",
                        labelStyle: const TextStyle(
                          fontFamily: "Kalam",
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold
                        ),
                        hintText: "example@gmail.com",
                        prefixIcon: const Icon(Icons.email_rounded,color: Colors.purple,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.purple,width: 4),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: const BorderSide(color: Colors.purple,width: 4),
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
                      obscureText: isObscured,
                      decoration: InputDecoration(
                        labelText: "Password",
                        hintText: "abc?123",
                        labelStyle: const TextStyle(
                          fontFamily: "Kalam",
                          fontSize: 20,
                          color: Colors.purple,
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon: const Icon(Icons.lock,color: Colors.purple,),
                        suffixIcon: GestureDetector(
                            onTap: (){
                              setState(() {
                                isObscured = !isObscured;
                            });
                            },
                            child: Icon(isObscured ? Icons.visibility_off : Icons.visibility,color: Colors.purple,),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.deepPurple,width: 5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(color: Colors.purple,width: 4),
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
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    onPressed: (){
                      setState(() {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>DashboardPage()));
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
                      const Text("New to the groove?",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Kalam",
                          ),),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
                      },
                      child: const Text(
                        "Register Here",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Kalam",
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ))
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    onPressed: (){
                      setState(() {
                        
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(aspectRatioOfContext*0.2),
                      child: const Text("Login with Facebook",style: TextStyle(fontSize: 16,color: Colors.white),),
                      )
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )
                    ),
                    onPressed: (){
                      setState(() {
                        
                      });
                    },
                    child: Padding(
                      padding: EdgeInsets.all(aspectRatioOfContext*0.2),
                      child: const Text("Login with Google",style: TextStyle(fontSize: 16,color: Colors.white),),
                      )
                  ),
                ]),
            ),
          )
      ])
    );
  }
}