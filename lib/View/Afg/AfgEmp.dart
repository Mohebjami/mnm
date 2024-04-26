import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mnm/Controller/Controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mnm/View/Afg/myMetaData.dart';
import 'package:mnm/View/Drawer/AfgDrawer.dart';
import 'package:mnm/View/Login.dart';

class AfgEmp extends StatefulWidget {
  const AfgEmp({super.key});

  @override
  State<AfgEmp> createState() => _AfgEmpState();
}

class _AfgEmpState extends State<AfgEmp> {
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
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  icon: const ImageIcon(
                    AssetImage("assets/icon/menu.png"),
                    size: 24,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                ),
              );
            },
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                  );
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
                                future: controller.showWaitData(),
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
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        backgroundColor:
                                                            Colors.red,
                                                        icon: Icons
                                                            .delete_forever,
                                                        label: "حذف",
                                                        onPressed:
                                                            (BuildContextcontext) async {
                                                          var querySnapshot =
                                                              await FirebaseFirestore
                                                                  .instance
                                                                  .collection(
                                                                      'waiting')
                                                                  .where('id',
                                                                      isEqualTo:
                                                                          snapshot.data?[index]
                                                                              [
                                                                              'id'])
                                                                  .get();
                                                          querySnapshot.docs
                                                              .forEach(
                                                                  (doc) async {
                                                            await FirebaseFirestore
                                                                .instance
                                                                .collection(
                                                                    'waiting')
                                                                .doc(doc.id)
                                                                .delete();
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (BuildContext
                                                                      context) {
                                                                return AlertDialog(
                                                                  title: Image
                                                                      .asset(
                                                                    "assets/icon/check-mark.png",
                                                                  ),
                                                                  content: const Text(
                                                                      'موفقانه حذف شد',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize:
                                                                              20)),
                                                                  actions: <Widget>[
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .center,
                                                                      child:
                                                                          SizedBox(
                                                                        height:
                                                                            50,
                                                                        width:
                                                                            130,
                                                                        child:
                                                                            MaterialButton(
                                                                          color:
                                                                              Colors.green,
                                                                          child:
                                                                              const Text(
                                                                            'باشه',
                                                                            style:
                                                                                TextStyle(color: Colors.white, fontSize: 25),
                                                                          ),
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.of(context).pop();
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                );
                                                              },
                                                            );
                                                            setState(() {});
                                                            print("deleted");
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            myMetaData(
                                                                carpetMataData:
                                                                    snapshot.data![
                                                                            index]
                                                                        ['id']),
                                                      ),
                                                    );
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
                                                                        'typeItemNumber']
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
                                                                snapshot.data?[
                                                                        index][
                                                                    'typeItem'],
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
                                  image: AssetImage(
                                      "assets/background/waitCB.jpg"),
                                  fit: BoxFit.fill)),
                          height: 150,
                          width: fullScreenWidth - 110,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )),
        floatingActionButton: MaterialButton(
          color: const Color.fromRGBO(152, 116, 100, 1.0),
          onPressed: (){
            setState(() {});
          },child: const Text("Refresh",style: TextStyle(color: Colors.white),),
        ),

    );
  }
}
