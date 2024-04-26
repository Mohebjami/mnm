import 'package:flutter/material.dart';
import 'package:mnm/View/Afg/AfgEmp.dart';
import 'package:mnm/View/Afg/Receive.dart';
import 'package:mnm/View/Afg/Warehouse.dart';
import 'package:mnm/View/Afg/WhData.dart';
import 'package:mnm/View/Afg/exitFromwarehouse.dart';

class AfgDrawer extends StatefulWidget {
  const AfgDrawer({super.key});

  @override
  State<AfgDrawer> createState() => _AfgDrawerState();
}

class _AfgDrawerState extends State<AfgDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: Drawer(
        backgroundColor: const Color.fromRGBO(215, 203, 185, 1.0),
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
                  color: Color.fromRGBO(152, 116, 100, 1.0),
                ),
                accountName: const Text(
                  " محب الله ",
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Image.asset(
                    "assets/icon/user.png",
                    width: 50,
                  ),
                ),
                accountEmail: null,
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/home.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text(
                  'خانه',
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AfgEmp(),
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
                title: const Text(
                  'دریافت بار',
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ReciveData(),
                    ),
                  );
                },
              ),ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/package-delivery.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text(
                  'ارسال بار',
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const exitFromwarehouse(),
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
                title: const Text(
                  'گدام ها',
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Warehouse(),
                    ),
                  );
                },
              ),
              ListTile(
                leading: const Image(
                  image: AssetImage("assets/icon/cart.png"),
                  width: 25,
                  color: Colors.black,
                ),
                title: const Text(
                  'موجودی در انبار',
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WhData(),
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
                title: const Text(
                  'درباره ما',
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
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
