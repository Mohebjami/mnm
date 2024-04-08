import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mnm/Controller/Controller.dart';
import 'package:mnm/View/Drawer/Drawer.dart';

class AddAdmin extends StatefulWidget {
  const AddAdmin({super.key});

  @override
  State<AddAdmin> createState() => _AddAdminState();
}
var control = Controller();


class _AddAdminState extends State<AddAdmin> {
  @override
  Widget build(BuildContext context) {
    double fullScreenHeight = MediaQuery.of(context).size.height;
    double fullScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const myDrawer(),
        body: SingleChildScrollView(
          child: Container(
            height: fullScreenHeight,
            width: fullScreenWidth,
            decoration:const BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/background/addAdmin.png"), fit: BoxFit.cover)
            ),
            child: Column(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 42.0),
                            child: Builder(
                              builder: (BuildContext context) {
                                return IconButton(
                                  icon: const ImageIcon(
                                    AssetImage("assets/icon/menu.png",),
                                    color: Colors.white,
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
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        decoration:  const BoxDecoration(
                          color: Color.fromRGBO(152,116,100, 1.0),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(60),
                            topLeft: Radius.circular(60),
                          )
                        ),
                        height: 500,
                        width: fullScreenWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text("اضافه کردن مدیر", style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "Neirizi"),),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 430,
                              width: fullScreenWidth,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(215,203,185, 1.0),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(60),
                                    topLeft: Radius.circular(60),
                                  )
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                     TextField(
                                       controller:control.controllerUS,
                                       textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        focusColor: Colors.white,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        hintText: "نام کاربری",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                     TextField(
                                       controller:control.controllerPS,
                                       textAlign: TextAlign.right,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                          hintText: "گذر واژه",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                      onPressed: (){
                                        control.newAdmin(context);
                                        control.controllerPS.clear();
                                        control.controllerUS.clear();
                                      },
                                      color: const Color.fromRGBO(162,126,110, 1),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(15))
                                      ),
                                      height: 45,
                                      minWidth: 200,
                                      child: const Text(
                                        "ذخیره",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: "Neirizi"
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
