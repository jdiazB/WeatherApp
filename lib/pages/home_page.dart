
import 'package:flutter/material.dart';

import 'package:untitled5_clase10/model/weathermodel.dart';
import 'package:untitled5_clase10/service/api_service.dart';
import 'package:http/http.dart' as http;



import '../ui/widgets/item_forecast_widget.dart';

class HomePage extends StatefulWidget  {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //bool isLoading = true;
  ModelWeather? modelWeather;
  final APIService _apiService = APIService();

  final TextEditingController _searchController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  // String cityName = "";
  // String country = "";
  // double temp =0;




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // por esto no cargaba no tenia un valor predefinido
    //getData();
    getdata3("Lima");



  }

  // getData(){
  //   _apiService.getDataLocation().then((value) {
  //     if(value != null){
  //       modelWeather = value;
  //       setState(() {
  //
  //       });
  //   }
  //
  // });}
  getdata3(String city){
    _apiService.getData2(city).then((value) {
      if(value != null){
        modelWeather = value;
        setState(() {

        });
      }
    },);
  }



   // getData2(String city) async {
   //   //isLoading = true;
   //   //setState(() {
   //
   //  // });
   //   Uri _url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=83b78eb09a468db6111b40317f680aa4");
   //   http.Response response = await http.get(_url);
   //   if(response.statusCode ==200){
   //    Map myMap = json.decode(response.body);
   //    //temp = myMap["main"]["temp"];
   //
   //    cityName=myMap["name"];
   //    country=myMap["sys"]["country"];
   //    //isLoading= false;
   //    setState(() {});
   //
   //   }
   // }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      backgroundColor: Color(0xff232535),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("WeatherApp"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            _apiService.getDataLocation();

          }, icon: Icon(Icons.location_on)),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _keyForm,
                child: Column(
                  children: [
                    Image.asset('assets/images/dom.png',height: 80, color: Colors.white,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(modelWeather!.main.temp.toStringAsFixed(1), style: TextStyle(
                            fontSize: 60.0,
                            color: Colors.white
                        ),),
                        SizedBox(width: 4,),
                        Text("°C", style: TextStyle(
                            fontSize:18.0,
                            color: Colors.white
                        ),),

                      ],
                    ),SizedBox(height: 2,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${modelWeather!.name}, ${modelWeather!.sys.country}", style: TextStyle(
                            color: Colors.white
                        ),)
                      ],
                    ),
                    SizedBox(
                      height: 12.0,
                    ),

                    TextFormField(
                      controller: _searchController,
                      validator: (value) {
                        if(value != null && value.isEmpty){
                          return "Campo obligatorio";
                        }
                        return null;
                      },


                      style: TextStyle(
                          color: Colors.white,fontSize: 14
                      ),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          hintText: "Ingresa una ciudad",
                          hintStyle: TextStyle(
                              color: Colors.white60,
                              fontSize: 14.0
                          ),
                          filled: true,
                          fillColor: Colors.white.withOpacity(0.12),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide.none
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14.0),
                              borderSide: BorderSide.none
                          )
                      ),
                    ),
                    SizedBox(height: 18,),

                    SizedBox(
                      width: double.infinity,
                      height: 48.0,
                      child: ElevatedButton(onPressed: ()  {


                        if(_keyForm.currentState!.validate()){

                          String city = _searchController.text;
                           getdata3(city);

                        }
                        return _searchController.clear();

                      }
                          ,style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xffFE6C6D),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14))
                          )
                          , child: Text("Buscar",
                            style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600
                            ),)),
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          ItemForcastWidget(),
                          ItemForcastWidget(),
                          ItemForcastWidget(),
                          ItemForcastWidget(),
                          ItemForcastWidget(),
                          ItemForcastWidget(),



                        ],
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 32,horizontal: 14),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.09),
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("14 MINUTES AGO", style: TextStyle(
                                  color: Colors.white60
                              ),),
                              Text("Texto de prueba.......................................................................",
                                style: TextStyle(
                                    color: Colors.white
                                ),),


                            ],
                          ),
                          Positioned(
                              top: -80,
                              right: 10,
                              child: Image.asset('assets/images/nube.png',height: 100,))
                        ],
                      ),
                    )


                  ],
                ),
              ),
            ),
          ),
         // isLoading ?
         //  Container(
         //    color: Color(0xff232535).withOpacity(0.98),
         //    child: Center(
         //        child: SizedBox(
         //          height: 20,
         //            width: 20,
         //
         //            child: CircularProgressIndicator(
         //              color: Color(0xffFE6C6D),
         //              strokeWidth: 1.5,
         //            ))),
          //)
          //: const SizedBox(),
        ],
      )

    );
  }
}
