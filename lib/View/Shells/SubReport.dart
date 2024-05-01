import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mnm/View/Drawer/Drawer.dart';

class SubReport extends StatelessWidget {
  final List<Map<String, dynamic>> dataList;
  const SubReport({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    double fullScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(215, 203, 185, 1.0),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(152, 116, 100, 1.0),
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const ImageIcon(
                AssetImage("assets/icon/menu.png"),
                size: 24,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: const myDrawer(),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: Future.value(dataList),
        builder: (BuildContext context, AsyncSnapshot<List<Map<String, dynamic>>>snapshot){
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: LoadingAnimationWidget.inkDrop(
                color: const Color.fromRGBO(
                    152, 116, 100, 1.0),
                size: 50,
              ),
            ); // Show loading spinner while waiting for data
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}'); // Show error message if something went wrong
          } else {
            List<Map<String, dynamic>>? data = snapshot.data;
            return ListView.builder( // Replace this with your desired widget
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data![index]['typeItem'].toString(), textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("مبدا",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['destination'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("مقصد",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['destinationName'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("ارسال کننده",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['driverName'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("نام راننده",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['vehicle'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("وسیله انتقال",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['vehicleTag'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("نمبر پلاک",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['typeItem'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("نوع جنس",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text("${snapshot.data?[index]['typeItemNumber']}", textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("تعداد جنس",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['Item Name'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("نام جنس",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['Item Color'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("رنگ جنس",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['Item Size'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("اندازه جنس",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['Item Trakom'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("تراکم",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['Item Shanh'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("شانه",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['date'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("تاریخ",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 40,
                          width: 200,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(child: Text(snapshot.data?[index]['time'], textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("ساعت",style: TextStyle(color: Colors.white, fontSize: 20),)),
                        ),

                      ],
                    ),
                    const SizedBox(height: 15,),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }
}
