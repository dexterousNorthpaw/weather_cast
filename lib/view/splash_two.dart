import 'package:flutter/material.dart';
import 'package:weatther_cast/logic/services/location_service.dart';
import 'package:weatther_cast/view/home_page.dart';
// import 'package:';

class SplashTwo extends StatefulWidget {
  const SplashTwo({key});

  @override
  State<SplashTwo> createState() => _SplashTwoState();
}

class _SplashTwoState extends State<SplashTwo> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 250,top: 0.0,right: 0.0),
                child: Align(
                  alignment:Alignment.center,
                    child: Image.asset("assets/images/Star.png"))
            ),
            const SizedBox(
              height:106,
            ),
            const Text(" Let’s See \n The ⭐\n Weather\n Around you",
              style: TextStyle(
                fontFamily: "Poppins",
                    // height: 1.538461538461538,
                    color: Color(0xFF0C1823),
                    fontSize: 42.16, fontWeight: FontWeight.w700),
                ),
            const SizedBox(
              height:173,
            ),
            Container(
              width: 291,
              height: 62,
              decoration: BoxDecoration(
                color: const Color(0xFF0C1823),
                borderRadius: BorderRadius.circular(16)
              ),
              child: Center(
                child: FlatButton(
                  onPressed: () async{
                    var position = await LocationService().getGeoLocationPosition();
                    LocationService().getAddressFromLatLong(position).then((value) {

                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder:
                            (context) =>
                                HomePage(city: value,)));
    });
                  },
                  child: const Text("Let’s Check",
                  textAlign: TextAlign.center,
                    style: TextStyle(color: Color(0xFFFCFCFC), fontSize: 20,fontWeight: FontWeight.w400),
                  ),
                ),
              ),

            )

          ],
        ),
      ),
    );
  }
}
