import 'package:flutter/material.dart';
import 'package:mnm/Controller/Controller.dart';
import 'package:mnm/View/Admin/AddAdmin.dart';
import 'package:mnm/View/Drawer/Drawer.dart';

class AddShells extends StatefulWidget {
  const AddShells({super.key});

  @override
  State<AddShells> createState() => _AddShellsState();
}

class _AddShellsState extends State<AddShells> {

  final Controller controller = Controller();

  @override
  void initState() {
    super.initState();
    fetchWarehouseData();
  }
  Future<void> fetchWarehouseData() async {
    controller.superMarketNames = (await controller.showWarehouseDropDownList()).cast<String>();
    setState(() {});
  }

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
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background/shells.jpg"),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.srgbToLinearGamma())),
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
                                    AssetImage(
                                      "assets/icon/menu.png",
                                    ),
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                  onPressed: () {
                                    Scaffold.of(context).openDrawer();
                                  },
                                  tooltip: MaterialLocalizations.of(context)
                                      .openAppDrawerTooltip,
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
                        decoration: const BoxDecoration(
                            color: Color.fromRGBO(152, 116, 100, 1.0),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(60),
                              topLeft: Radius.circular(60),
                            )),
                        height: 500,
                        width: fullScreenWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              "ایجاد     شلف",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontFamily: "Neirizi"),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              height: 430,
                              width: fullScreenWidth,
                              decoration: const BoxDecoration(
                                  color: Color.fromRGBO(215, 203, 185, 1.0),
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(60),
                                    topLeft: Radius.circular(60),
                                  )),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // DropDown
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(152, 116, 100, 1.0),
                                          borderRadius: BorderRadius.circular(20.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8.0, bottom: 5.0, top: 5.0),
                                        child: DropdownButton<String>(
                                          value: controller.selectedWarehouse,
                                          hint:  const Center(
                                            child: Text(
                                              "اتنخاب گدام",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),

                                          focusColor: Colors.white,
                                          iconEnabledColor: Colors.white,
                                          isExpanded: true,
                                          icon: const Icon(Icons.arrow_downward),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: const TextStyle(color: Colors.white),
                                          dropdownColor: const Color.fromRGBO(152, 116, 100, 1.0),
                                          underline: Container(
                                            color: Colors.transparent,
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              controller.selectedWarehouse = newValue;
                                            });
                                            print("${controller.selectedWarehouse}");
                                          },
                                          items: controller.superMarketNames.map<DropdownMenuItem<String>>((String value) {
                                            return DropdownMenuItem<String>(
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),

                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller:
                                      control.controllershelfName,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                          focusColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          hintText: "نام شلف",
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: control.controllershelfNumber,
                                      textAlign: TextAlign.right,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(20)),
                                        ),
                                        hintText: "ظرفیت کل",
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
                                      onPressed: () {
                                        control.newShells(context,controller.selectedWarehouse);
                                        control.controllershelfName.clear();
                                        control.controllershelfNumber.clear();

                                      },
                                      color: const Color.fromRGBO(162, 126, 110, 1),
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
                                    )

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
        ));
  }
}
