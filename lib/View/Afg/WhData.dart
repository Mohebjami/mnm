import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mnm/Controller/Controller.dart';
import 'package:mnm/View/Drawer/AfgDrawer.dart';

class WhData extends StatefulWidget {
  const WhData({super.key});

  @override
  State<WhData> createState() => _WhDataState();
}

class _WhDataState extends State<WhData> {
  @override
  Widget build(BuildContext context) {
    double fullScreenHeight = MediaQuery.of(context).size.height;
    double fullScreenWidth = MediaQuery.of(context).size.width;
    final TextEditingController number = TextEditingController();
    final Controller controller = Controller();
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
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.logout),
              ),
            ),
          ],
        ),
        drawer: const AfgDrawer(),
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
                                future: controller.showWhData(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<List<Map<String, dynamic>>>
                                        snapshot) {
                                  if (snapshot.hasData) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(top: 100.0),
                                      child: ListView.builder(
                                        padding:
                                            const EdgeInsets.only(left: 40),
                                        itemCount: snapshot.data?.length,
                                        itemBuilder: (context, index) {
                                          return Column(
                                            children: [
                                              Slidable(
                                                closeOnScroll: true,
                                                startActionPane: ActionPane(
                                                    motion:
                                                        const StretchMotion(),
                                                    children: [
                                                      SlidableAction(
                                                        borderRadius: BorderRadius.circular(15),
                                                        backgroundColor: Colors.red,
                                                        icon: Icons.delete_forever,
                                                        label: 'حذف',
                                                        onPressed: (BuildContextcontext) async {

                                                          var querySnapshot = await FirebaseFirestore.instance.collection('ReceiveFromIran').where('id', isEqualTo: snapshot.data?[index]['id']).get();
                                                          querySnapshot.docs.forEach((doc) async {
                                                            await FirebaseFirestore.instance.collection('ReceiveFromIran').doc(doc.id).delete();

                                                            FirebaseFirestore firestore = FirebaseFirestore.instance;
                                                            var querySnapshot = await firestore.collection('Shelf').where('Name', isEqualTo: controller.selectedShelf).get();
                                                            for (var doc in querySnapshot.docs) {
                                                              doc.reference.update({
                                                                'Number': FieldValue.increment(snapshot.data![index]['NumberItem'])
                                                              });
                                                            }

                                                            var querySnapshotW = await firestore.collection('Warehouse').where('Name', isEqualTo: controller.selectedWarehouse).get();
                                                            for (var doc in querySnapshotW.docs) {
                                                              doc.reference.update({'Number': FieldValue.increment(snapshot.data![index]['NumberItem'])});
                                                            }

                                                            showDialog(context: context, builder: (BuildContextcontext) {
                                                                return AlertDialog(
                                                                  title: const Text('حدف', textAlign: TextAlign.right, style: TextStyle(color: Colors.red, fontSize: 40)),
                                                                  content: const Text('موفقانه حدف شد', textAlign: TextAlign.right,
                                                                      style: TextStyle(fontSize: 20)),
                                                                  actions: <Widget>[
                                                                    Align(
                                                                      alignment: Alignment.centerLeft,
                                                                      child:
                                                                          MaterialButton(
                                                                            color: Colors.red,
                                                                        child: const Text('باشه', style: TextStyle(color: Colors.white)),
                                                                        onPressed: () {
                                                                          Navigator.of(context).pop();setState(() {});
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                          });
                                                        },
                                                      )
                                                    ]),
                                                endActionPane: ActionPane(
                                                    motion:
                                                    const StretchMotion(),
                                                    children: [
                                                      SlidableAction(
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(15),
                                                          backgroundColor:
                                                          Colors.blue,
                                                          icon: Icons
                                                              .shopping_basket_outlined,
                                                          label: "خروج",
                                                          onPressed:
                                                              (BuildContextcontext) {
                                                            showDialog(
                                                                context:
                                                                context,
                                                                builder:
                                                                    (BuildContext
                                                                context) {
                                                                  return AlertDialog(
                                                                    backgroundColor:
                                                                    const Color
                                                                        .fromRGBO(
                                                                        215,
                                                                        203,
                                                                        185,
                                                                        1.0),
                                                                    content:
                                                                    SizedBox(
                                                                      width: double
                                                                          .maxFinite,
                                                                      height:
                                                                      200,
                                                                      child:
                                                                      Column(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.center,
                                                                        children: [
                                                                          const SizedBox(
                                                                            height:
                                                                            20,
                                                                          ),
                                                                          TextField(
                                                                            controller: number,
                                                                            textAlign: TextAlign.right,
                                                                            keyboardType: TextInputType.number,
                                                                            decoration: const InputDecoration(
                                                                              border: OutlineInputBorder(
                                                                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                                                              ),
                                                                              hintText: "تعداد",
                                                                              hintStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
                                                                            ),
                                                                          ),
                                                                          const SizedBox(height: 20,),
                                                                          MaterialButton(
                                                                            onPressed: () async{
                                                                              FirebaseFirestore firestore = FirebaseFirestore.instance;
                                                                              var querySnapshotWt = await firestore.collection('ReceiveFromIran').where('item', isEqualTo: snapshot.data![index]['item'].toString()).get();
                                                                              int num = int.parse(number.text);

                                                                              if(snapshot.data?[index]['NumberItem'] > 0)
                                                                              {
                                                                                for (var doc in querySnapshotWt.docs) {
                                                                                  doc.reference.update({'NumberItem': FieldValue.increment(-num)});
                                                                                }
                                                                                // Update warehouse and shelf capacity
                                                                                var querySnapshot = await firestore.collection('Shelf').where('Name', isEqualTo: controller.selectedShelf).get();

                                                                                for (var doc in querySnapshot.docs) {
                                                                                  doc.reference.update({'Number': FieldValue.increment(num)});
                                                                                }

                                                                                var querySnapshotW = await firestore.collection('Warehouse').where('Name', isEqualTo: controller.selectedWarehouse).get();
                                                                                for (var doc in querySnapshotW.docs) {
                                                                                  doc.reference.update({'Number': FieldValue.increment(num)});
                                                                                }
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      title: Image.asset("assets/icon/check-mark.png",),
                                                                                      content: const  Text('موفقانه ذخیره شد', textAlign: TextAlign.center, style: TextStyle(color: Colors.black,fontSize: 20)),
                                                                                      actions: <Widget>[
                                                                                        Align(
                                                                                          alignment: Alignment.center,
                                                                                          child: SizedBox(
                                                                                            height: 50 ,
                                                                                            width: 130,
                                                                                            child: MaterialButton(
                                                                                              color: Colors.green,
                                                                                              child: const Text('باشه' ,style: TextStyle(color: Colors.white,fontSize: 25),),
                                                                                              onPressed: () {
                                                                                                Navigator.of(context).pop();
                                                                                              },
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }

                                                                              else {
                                                                                showDialog(
                                                                                  context: context,
                                                                                  builder: (BuildContext context) {
                                                                                    return AlertDialog(
                                                                                      title: const Text('خطا',textAlign: TextAlign.right, style: TextStyle(color: Colors.red,fontSize: 40)),
                                                                                      content: const  Text('دوباره کوشش کنید',textAlign: TextAlign.right,),
                                                                                      actions: <Widget>[
                                                                                        Align(
                                                                                          alignment: Alignment.centerLeft,
                                                                                          child: MaterialButton(
                                                                                            color: Colors.red,
                                                                                            child: const Text('باشه'),
                                                                                            onPressed: () {
                                                                                              Navigator.of(context).pop();
                                                                                            },
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    );
                                                                                  },
                                                                                );
                                                                              }

                                                                              setState(() {});
                                                                            },

                                                                            color: const Color.fromRGBO(162, 126, 110, 1),
                                                                            shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                                                                            height: 45,
                                                                            minWidth: 250,
                                                                            child: const Text("ذخیره", style: TextStyle(fontSize: 20, color: Colors.white, fontFamily: "Neirizi"),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                });
                                                          })
                                                    ]),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    // Navigator.push(
                                                    //   context,
                                                    //   MaterialPageRoute(
                                                    //     builder: (context) =>myMetaData(carpetMataData:snapshot.data![index]['id']),
                                                    //   ),
                                                    // );
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width -
                                                            130,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          const Color.fromRGBO(
                                                              152,
                                                              116,
                                                              100,
                                                              1.0),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: Container(
                                                            width: 100,
                                                            height: 100,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .white10,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                snapshot.data![
                                                                        index][
                                                                        'NumberItem']
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(12.0),
                                                          child: SizedBox(
                                                            width: 100,
                                                            height: 100,
                                                            child: Center(
                                                              child: Text(
                                                                snapshot.data![
                                                                        index]
                                                                        ['item']
                                                                    .toString(),
                                                                style: const TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        20),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),
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
                                        color: const Color.fromRGBO(
                                            152, 116, 100, 1.0),
                                        size: 50,
                                      ),
                                    );
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
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/background/items.jpg"),
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
