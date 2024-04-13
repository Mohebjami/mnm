import 'package:flutter/material.dart';
import 'package:mnm/View/Iran/IrEmp.dart';
import 'package:mnm/View/Iran/waitingData.dart';

class IranDrawer extends StatefulWidget {
  const IranDrawer({super.key});

  @override
  State<IranDrawer> createState() => _IranDrawerState();
}

class _IranDrawerState extends State<IranDrawer> {
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
                title: Text(
                  "ارسال      کردن     اجناس",
                  style: TextStyle(
                      fontFamily: "Neirizi"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const IrEmp(),
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
                  'دیدن اجناس ارسال شده',
                  style: TextStyle(fontFamily: "Neirizi"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const waitingData(),
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
