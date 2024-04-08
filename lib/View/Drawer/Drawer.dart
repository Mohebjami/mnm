import 'package:flutter/material.dart';
import 'package:mnm/View/Admin/AddAdmin.dart';
import 'package:mnm/View/Admin/AddWareHouse.dart';
import 'package:mnm/View/Admin/Admin.dart';
import 'package:mnm/View/Admin/WaitData.dart';
import 'package:mnm/View/Afg/RigisterAfgEmp.dart';
import 'package:mnm/View/Iran/RigisterIranEmp.dart';
import 'package:mnm/View/Shells/AddShells.dart';

class myDrawer extends StatefulWidget {
  const myDrawer({super.key});

  @override
  State<myDrawer> createState() => _myDrawerState();
}

class _myDrawerState extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Drawer(
        backgroundColor: const Color.fromRGBO(215,203,185, 1.0),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: SizedBox(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(152,116,100, 1.0),
                ),
                accountName: const Text(" محب الله ", style: TextStyle(fontFamily: "Neirizi"),),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/icon/user.png",
                    width: 50,
                  ),
                ), accountEmail: null,
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/home.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('خانه', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const Admin(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/add-admin.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('اضافه کردن مدیر', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const AddAdmin(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/warehouse.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('اضافه کردن انبار', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                        const AddWareHouse(),
                      ),
                    );
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/racks.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('اضافه کردن شلف', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const AddShells(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/add-user.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('اضافه کردن کارمند هرات', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const RigisterAfgEmp(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/add-userIR.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('اضافه کردن کارمند ایران', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const RigisterIranEmp(),
                    ),
                  );
                },
              ),ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/hourglass.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('ارسال شده ها', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                      const WaitData(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/info.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text('درباره ما', style: TextStyle(fontFamily: "Neirizi"),),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
