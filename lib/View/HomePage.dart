import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double fullScreenHeight = MediaQuery.of(context).size.height;
    double fullScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: fullScreenHeight,
        width: fullScreenWidth,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/LoginBack.png'), // replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 0 , top: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("ورود به حساب" , style: TextStyle(fontSize: 40), textAlign: TextAlign.right,),
              SizedBox(
                height: 200,
              ),
              SizedBox(
                width: fullScreenWidth-80,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      hintText: "نام کابری",
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: fullScreenWidth-80,
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),
                      ),
                    hintText: "رمز"
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(
                height: 70,
              ),
              SizedBox(
                height: 60,
                width: 170, 
                child: MaterialButton(
                  onPressed: (){},
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Text("ورود" , style: TextStyle(color: Colors.white, fontSize: 25 , fontWeight: FontWeight.bold),),
                  color: Color.fromRGBO(1, 1, 1, 1),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
