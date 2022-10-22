import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:weatther_cast/logic/models/city_model.dart';
import 'package:weatther_cast/logic/models/weather_models.dart';
import 'package:weatther_cast/logic/services/call_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({key, required this.city});
  final String city;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<WeatherModel> getData(String cityName) async {
    return await ApiService().getWeather(cityName);
  }

  Future<List<CityName>> getCities() async {
    return await ApiService().getCityName(context);
  }

  String dropdownvalue = 'Abuja';


  @override
  void initState() {
    dropdownvalue = widget.city;
    getCities();
    setState(() {
      getData(dropdownvalue);
    });
    super.initState();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50.0,),
              Row(
                  children: [
                    const SizedBox(width: 26.0,),
                    Container(
                      width: 38.0,
                      height: 40.11,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0)
                      ),
                      child: Image.asset('assets/images/pp.png'),
                    ),
                    const SizedBox(width: 14.0,),

                    DropdownButtonHideUnderline(
                      child: FutureBuilder(
                        future: getCities(),
                        builder: (context, snapshot){
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return const Center(
                                     child: CircularProgressIndicator(),
                              );
                              }else{
                                if(snapshot.error != null){
                                  return Text("${snapshot.error}");
                                }else{
                                  return DropdownButton<String>(
                                    hint: Text(dropdownvalue),
                                    items:(snapshot.data!as List).map<DropdownMenuItem<String>>((item){
                                        return DropdownMenuItem<String>(
                                        value: item.name,child: Text(item.name,),
                                                );
                                                }).toList(),
                                                onChanged: (value){setState(() {
                                                  dropdownvalue = value!;
                                                  // log(value);
                                                });getData(dropdownvalue);},);}}}),),]),


              const SizedBox(height: 44.1,),

              Container(
                  width: 254,
                  height: 54,
                  margin: const EdgeInsets.only(left:50,right: 84),
                  child: const Text(
                    'Feels Like A good \ntime to Ride a bike ',
                    style: TextStyle(
                        height: 1.11,
                        fontWeight: FontWeight.w500,
                        fontSize: 24.0
                    ),
                  )
              ),
              // SizedBox(height: 54.875),

              FutureBuilder<WeatherModel>(
                future: getData(dropdownvalue),
                builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    if (snapshot.error != null) {
                      return const Text("erroor");
                    } else {
                      String temp = snapshot.data!.temp;
                      var arr = temp.split('.');
                      return Container(
                        width: 374.71,
                        height: 374.71,
                        child: Stack(
                            children: [
                              Center(
                                child: Container(
                                  // margin: EdgeInsets.only(top:150 ),
                                  width: 264.96,
                                  height: 264.96,
                                  decoration: const BoxDecoration(
                                      color: Color(0xFF0C1823),
                                      // shape: BoxShape.circle,
                                      borderRadius: BorderRadius.all(Radius.circular(538.365))
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 80,
                                left: 56,
                                bottom: 239.71,
                                right: 263.71,
                                child: Image.asset('assets/images/Cloudy.png'),
                              ),
                              Positioned(
                                top: 80,
                                left: 264,
                                bottom: 239.71,
                                right: 55.71,
                                child: Image.asset('assets/images/rain.png'),
                              ),
                              Positioned(
                                top: 203,
                                left: 53,
                                bottom: 116.71,
                                right: 266.71,
                                child: Image.asset('assets/images/windy.png'),
                              ),
                              Positioned(
                                top: 290,
                                left: 160,
                                bottom: 29.71,
                                right: 159.71,
                                child: Image.asset('assets/images/thundersrtom.png'),
                              ),
                              Positioned(
                                top: 203,
                                left: 276,
                                bottom: 116.71,
                                right: 43.71,
                                child: Image.asset('assets/images/Clear.png'),
                              ),
                              Positioned(
                                top: 172,
                                left: 176,
                                bottom: 117.71,
                                right: 114.71,
                                child: Image.asset('assets/images/sunny.png'),
                              ),

                              const Positioned(
                                top: 134,
                                left: 126,
                                bottom: 219.71,
                                right: 165.71,
                                child: Text("Today's Like", style: TextStyle(color: Colors.white),),
                              ),

                              Positioned(
                                top: 145,
                                left: 137,
                                bottom: 163.71,
                                right: 166.71,
                                child: Text(
                                  "${arr[0]}°",style: TextStyle(fontSize:25, color: Colors.white),
                                ),)
                            ]
                        ),
                      );
                    };
                  };
                }

                ),
              const SizedBox(height: 38.29,),

              Row(
                children: [
                  Container(
                      width: 98,
                      height: 21,
                      margin: EdgeInsets.only(left: 38),
                      child:Text("Today's Mood")
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 33),
                      child:Text("Tomorrow's Mood")
                  )
                ],
              ),
              SizedBox(height: 1,),
              Row(
                children: [
                  Container(
                      width: 98,
                      height: 18,
                      margin: EdgeInsets.only(left: 41),
                      child:Text("Very Good")
                  ),
                  Container(
                      margin: EdgeInsets.only(left: 30),
                      child:Text("Excellent")
                  )
                ],
              ),


            ])

    );
  }
}
