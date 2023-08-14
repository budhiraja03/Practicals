import 'package:flutter/material.dart';
import 'LogInPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double height = mediaQueryData.size.height;
    double width = mediaQueryData.size.width;
    double aspectRatioOfContext = mediaQueryData.size.aspectRatio;
    double textsize = mediaQueryData.size.width > 600 ? 100.0 : 50.0;
    EdgeInsets customAspectRatio;
    EdgeInsets customPaddingButton;
    if(aspectRatioOfContext > 1.0)
    {//Landscape
      customAspectRatio = const EdgeInsets.symmetric(vertical: 3,horizontal: 5);
    }
    else{//Portrait
      customAspectRatio = const EdgeInsets.symmetric(vertical: 5,horizontal: 3);
    }
    if(aspectRatioOfContext > 1.0)
    {//Landscape
      customPaddingButton = const EdgeInsets.fromLTRB(20,10,20,5);
    }
    else{//Portrait
      customPaddingButton = const EdgeInsets.fromLTRB(4,100,4,5);
    }
    return Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("MusicoPhile",style: TextStyle(fontSize: textsize,fontWeight: FontWeight.bold,fontFamily: 'Pacifico'),),
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
              Image(
                height: height*0.5,
                image: const AssetImage('images/Playlist-amico.png')
                ),
              SizedBox(height: height*0.03,),
              ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LogInPage()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                shape:
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    side: const BorderSide(width: 3,color:Colors.transparent,))
                ),
              child: Padding(
                padding: EdgeInsets.all(aspectRatioOfContext*0.2),
                child: const Text("Get Started",style: TextStyle(fontSize: 25, color: Colors.white),),
              )
              )
            ],
          )
        )
    );
  }
}