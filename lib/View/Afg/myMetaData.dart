import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mnm/Controller/Controller.dart';





class myMetaDataSTF extends StatefulWidget {
  const myMetaDataSTF({super.key});

  @override
  State<myMetaDataSTF> createState() => _myMetaDataSTFState();
}

class _myMetaDataSTFState extends State<myMetaDataSTF> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}












class myMetaData extends StatelessWidget {
  final int carpetMataData;
  const myMetaData({super.key, required this.carpetMataData});

  @override
  Widget build(BuildContext context) {
    double fullScreenHeight = MediaQuery.of(context).size.height;
    double fullScreenWidth = MediaQuery.of(context).size.width;
    final Controller controller = Controller();
    return Scaffold(
        backgroundColor: const Color.fromRGBO(215, 203, 185, 1.0),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(152, 116, 100, 1.0),
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: SizedBox(
            height: fullScreenHeight,
            width: fullScreenWidth,
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 100,
                      color: const Color.fromRGBO(215, 203, 185, 1.0),
                      child: Container(
                        width: fullScreenWidth,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(152, 116, 100, 1.0),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(80.0),
                            bottomRight: Radius.circular(0.0),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: const Color.fromRGBO(152, 116, 100, 1.0),
                        child: Container(
                          width: fullScreenWidth,
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(215, 203, 185, 1.0),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0.0),
                              topRight: Radius.circular(80.0),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20.0, top: 1.0),
                            child: SizedBox(
                              height: 720,
                              child: FutureBuilder<List<Map<String, dynamic>>>(
                                future: controller
                                    .showWaitData_MataData(carpetMataData),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Map<String, dynamic>>>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(top: 100.0),
                                      child: ListView.builder(
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context).size.width - 100,
                                                decoration: BoxDecoration(
                                                  color: const Color.fromRGBO(152, 116, 100, 1.0),
                                                  borderRadius: BorderRadius.circular(15.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(10.0),
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("مبدا: ${snapshot.data?[index]['source']}", style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 11,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("  مقصد: ${snapshot.data?[index]['destination']}",
                                                            style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 11,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("ارسال کننده: ${snapshot.data?[index]['destinationName']}",
                                                            style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 11,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text(
                                                            "نام راننده: ${snapshot.data?[index]['driverName']}", style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 11,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("وسیله نقلیه: ${snapshot.data?[index]['vehicle']}",
                                                            style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 11,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("پلاک: ${snapshot.data?[index]['vehicleTag']}",
                                                            style: const TextStyle(color: Colors.white, fontSize: 20,fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 11,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("نوع جنس: ${snapshot.data?[index]['typeItem']}",
                                                            style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(height: 11,),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("تعداد جناس: ${snapshot.data?[index]['typeItemNumber']}",
                                                            style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 11,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text("نام کار: ${snapshot.data?[index]['']}", style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),

                                                      const SizedBox(
                                                        height: 11,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text(" ${snapshot.data?[index]['time']} :ساعت", style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                        height: 11,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.end,
                                                        children: [
                                                          Text(" ${snapshot.data?[index]['date']} :تاریخ", style: const TextStyle(color: Colors.white, fontSize: 20, fontFamily: "Neirizi"),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text('Error: ${snapshot.error}');
                                  } else {
                                    return Center(
                                        child: LoadingAnimationWidget.inkDrop(
                                      color: const Color.fromRGBO(152, 116, 100, 1.0), size: 50,
                                    ));
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    heightFactor: BorderSide.strokeAlignOutside,
                    child: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage("assets/background/carpet2.png"),
                                  fit: BoxFit.fill)),
                          height: 150,
                          width: fullScreenWidth - 110,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }
}
