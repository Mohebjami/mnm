import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mnm/View/Drawer/Drawer.dart';
class ExitReport extends StatelessWidget {
  final List<Map<String, dynamic>>  exit_Report;
  const ExitReport({super.key, required this.exit_Report});

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
        future: Future.value(exit_Report),
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
                          child: Center(child: Text(snapshot.data![index]['NumberItem'].toString(), textAlign: TextAlign.right,style: const TextStyle(color: Colors.white, fontSize: 20),), ),

                        ),
                        const SizedBox(width: 2,),
                        Container(
                          height: 40,
                          width: 150,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(child: Text("تعداد",style: TextStyle(color: Colors.white, fontSize: 20),)),
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
