import 'dart:convert';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:untitled5_clase10/model/weathermodel.dart';

class APIService {


  Future<ModelWeather?> getDataLocation() async {
    //isLoading = true;
    // setState(() {
    //});
    Position position = await Geolocator.getCurrentPosition();
    print(position.latitude);
    print(position.longitude);

    Uri _url= Uri.parse("https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=83b78eb09a468db6111b40317f680aa4");
    http.Response response = await http.get(_url);
    if(response.statusCode ==200){
      Map<String, dynamic> myMap = json.decode(response.body);
      ModelWeather modelWeather = ModelWeather.fromJson(myMap);
      return modelWeather;
      // temp = myMap["main"]["temp"];
      // temp = temp -273.15;
      // cityName=myMap["name"];
      // country=myMap["sys"]["country"];
      // // isLoading= false;
      // setState(() {});
    } return null;
  }





}