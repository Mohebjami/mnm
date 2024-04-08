import 'package:flutter/material.dart';
import 'package:mnm/View/Admin/Admin.dart';
import 'package:mnm/View/Afg/AfgEmp.dart';
import 'package:mnm/View/Iran/IrEmp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Chats Page'),
    Text('Status Page'),
    Text('Calls Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double fullScreenHeight = MediaQuery.of(context).size.height;
    double fullScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
      height: fullScreenHeight,
      width: fullScreenWidth,
      child: Column(
        children: [
          Expanded(
            child: Container(
              color: const Color.fromRGBO(152,116,100, 1.0),
              child: Container(
                width: fullScreenWidth,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(215,203,185, 1.0),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0.0),
                    bottomRight: Radius.circular(125.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 58.0, right: 58.0),
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                            10), // Adjust the border radius here
                        color: const Color.fromRGBO(152,116,100, 1.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            10), // Make sure to match this with BoxDecoration's border radius
                        child: BottomNavigationBar(
                          backgroundColor: Colors.transparent,
                          unselectedItemColor: const Color.fromRGBO(215,203,185, 1.0),
                          items: const <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: Icon(Icons.admin_panel_settings),
                              label: 'مدیر',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.person),
                              label: 'کارمند هرات',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.person),
                              label: 'کارمند ایران',
                            ),
                          ],
                          currentIndex: _selectedIndex,
                          selectedItemColor: Colors.white,
                          onTap: _onItemTapped,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: const Color.fromRGBO(215,203,185, 1.0),
              child: Container(
                width: fullScreenWidth,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(152,116,100, 1.0),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(125.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Container(
                         decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                           borderRadius: BorderRadius.circular(15)
                         ),
                         child: const TextField(
                          // controller: feeController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: "نام کاربری",
                              hintStyle: TextStyle(color: Colors.white)),
                              textAlign: TextAlign.right,
                                               ),
                       ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: const TextField(
                          // controller: lastController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,),
                              hintText: "گذر واژه",
                              hintStyle: TextStyle(color: Colors.white)),
                          textAlign: TextAlign.right,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                        height: 50,
                        width: fullScreenWidth,
                        child: ElevatedButton(
                          onPressed: () {
                            switch (_selectedIndex) {
                              case 0: // Chats
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const Admin(),
                                  ),
                                );
                                break;
                              case 1: // Status
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AfgEmp(),
                                  ),
                                );
                                break;
                              case 2: // Calls
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const IrEmp(),
                                  ),
                                );
                                break;
                              default:
                                break;
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(215,203,185, 1.0),),
                            shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                          ),
                          child: const Text(
                            "ورود",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontFamily: "Neirizi",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
