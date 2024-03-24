import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Welcomeview extends StatefulWidget {
  const Welcomeview({super.key});

  @override
  State<Welcomeview> createState() => _WelcomeviewState();
}

class _WelcomeviewState extends State<Welcomeview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
              color: Colors.white, width: media.width, height: media.height),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/splashscreen.png",
                    width: media.width * 0.5, fit: BoxFit.contain),
                   const Spacer(),
                const Text("Seamless travel money management",style: TextStyle(color: Colors.lightBlue),),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
