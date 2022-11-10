import 'package:flutter/material.dart';

class ItemForcastWidget extends StatelessWidget {
  const ItemForcastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(right: 16, bottom: 13.0),
        padding: EdgeInsets.symmetric(horizontal: 14, vertical:20),

        width: 80,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(50),
         boxShadow: [
           BoxShadow(
             color: Colors.black.withOpacity(0.16),
             offset: Offset(0, 5),
             blurRadius: 12.0
           )
         ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "9 AM",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 14),
              ),
              SizedBox(height: 6,),
              Image.asset(
                'assets/images/dom.png',
                height: 38,
                fit: BoxFit.cover,
                color: Colors.white,
              ),
              SizedBox(height: 6,),

              Text(
                "21 °C",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )
            ],
          ),
        ),
      ),
    );
  }
}
