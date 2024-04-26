import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mnm/View/Drawer/AfgDrawer.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:mnm/Controller/Controller.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as pdp;

class ReciveData extends StatefulWidget {
  const ReciveData({super.key});

  @override
  State<ReciveData> createState() => _ReciveDataState();
}

class _ReciveDataState extends State<ReciveData> {
  final Controller controller = Controller();
  List<TextEditingController> itemControllers = [];
  TextEditingController controllerSource = TextEditingController();
  TextEditingController controllerDestionation = TextEditingController();
  TextEditingController controllerDestionationName = TextEditingController();
  TextEditingController controllerDriverName = TextEditingController();
  TextEditingController controllerVehcle = TextEditingController();
  TextEditingController controllerVehcleTag = TextEditingController();
  TextEditingController controllerTypeItem = TextEditingController();
  TextEditingController controllerTypeItemNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchWarehouseData();
    fetchWaitingData();
    for (int i = 0; i < _numFields; i++) {
      itemControllers.add(TextEditingController());
    }
  }

  Future<void> fetchWarehouseData() async {
    controller.superMarketNames =
        (await controller.showWarehouseDropDownList()).cast<String>();
    setState(() {});
  }

  Future<void> fetchWaitingData() async {
    controller.waitingDropDown =
        (await controller.showWarehouseDropDownListDropDownReceive())
            .cast<String>();
    setState(() {});
  }
  int _numFields = 0;

  DateTime? _selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final pdp.Jalali? picked = await pdp.showPersianDatePicker(
      context: context,
      initialDate: pdp.Jalali.now(),
      firstDate: pdp.Jalali(1403, 1),
      lastDate: pdp.Jalali(1429),
    );
    if (picked != null && picked.toString() != _selectedDate) {
      setState(() {
        _selectedDate = picked.toDateTime();
      });
    }
  }

  String getShamsiDate(DateTime? date) {
    if (date == null) {
      return "تاریخ";
    } else {
      final jalali = Gregorian.fromDateTime(date).toJalali();
      return '${jalali.year}/${jalali.month}/${jalali.day}';
    }
  }

  TimeOfDay? _selectedTime;
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double fullScreenHeight = MediaQuery.of(context).size.height;
    double fullScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        drawer: const AfgDrawer(),
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
                      Builder(
                        builder: (BuildContext context) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 30.0, left: 8),
                            child: IconButton(
                              icon: const ImageIcon(
                                AssetImage("assets/icon/menu.png",),
                                color: Colors.white,
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
                    height: 650,
                    width: fullScreenWidth,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text(
                          "دریافت اجناس",
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontFamily: "Neirizi"),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Container(
                          height: 580,
                          width: fullScreenWidth,
                          decoration: const BoxDecoration(
                              color: Color.fromRGBO(215, 203, 185, 1.0),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(60),
                                topLeft: Radius.circular(60),
                              )),
                          child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 15.0, right: 15.0, top: 30),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: controllerDestionationName,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "دریافت کننده",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: controllerDriverName,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "نام راننده",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: controllerVehcle,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "نوع وسیله انتقال اجناس",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: controllerVehcleTag,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "نمبر پلاک",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: controllerTypeItemNumber,
                                      textAlign: TextAlign.right,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "تعداد اجناس",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                                width: 1.2, color: Colors.grey),
                                            left: BorderSide(
                                                width: 1.2, color: Colors.grey),
                                            right: BorderSide(
                                                width: 1.2, color: Colors.grey),
                                            bottom: BorderSide(
                                                width: 1.2, color: Colors.grey),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            InkWell(
                                              child: Text(
                                                  getShamsiDate(_selectedDate),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              onTap: () {
                                                getShamsiDate(_selectedDate);
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.calendar_today,
                                                color: Colors.white,
                                              ),
                                              tooltip:
                                                  'Tap to open date picker',
                                              onPressed: () =>
                                                  _selectDate(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      height: 60,
                                      decoration: const BoxDecoration(
                                          border: Border(
                                            top: BorderSide(
                                              width: 1.2,
                                              color: Colors.grey,
                                            ),
                                            left: BorderSide(
                                              width: 1.2,
                                              color: Colors.grey,
                                            ),
                                            right: BorderSide(
                                              width: 1.2,
                                              color: Colors.grey,
                                            ),
                                            bottom: BorderSide(
                                              width: 1.2,
                                              color: Colors.grey,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: <Widget>[
                                            InkWell(
                                              child: Text(
                                                  _selectedTime == null
                                                      ? 'ساعت'
                                                      : _selectedTime!
                                                          .format(context),
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(
                                                      color: Colors.white)),
                                              onTap: () {
                                                selectTime(context);
                                              },
                                            ),
                                            IconButton(
                                              icon: const Icon(
                                                Icons.access_time_filled_sharp,
                                                color: Colors.white,
                                              ),
                                              tooltip:
                                                  'Tap to open date picker',
                                              onPressed: () =>
                                                  selectTime(context),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromRGBO(
                                              152, 116, 100, 1.0),
                                          borderRadius:
                                              BorderRadius.circular(20.0)),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0,
                                            right: 8.0,
                                            bottom: 5.0,
                                            top: 5.0),
                                        child: DropdownButton<String>(
                                          value: controller.selectedWaiting,
                                          hint: const Center(
                                            child: Text(
                                              "انتخاب جنس",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20),
                                            ),
                                          ),
                                          focusColor: Colors.white,
                                          iconEnabledColor: Colors.white,
                                          isExpanded: true,
                                          icon:
                                              const Icon(Icons.arrow_downward),
                                          iconSize: 24,
                                          elevation: 16,
                                          style: const TextStyle(
                                              color: Colors.white),
                                          dropdownColor: const Color.fromRGBO(
                                              152, 116, 100, 1.0),
                                          underline: Container(
                                            color: Colors.transparent,
                                          ),
                                          onChanged: (String? newValue) {
                                            setState(() {
                                              controller.selectedWaiting = newValue;

                                              controller.fetchShellData(newValue!);
                                            });
                                            print(
                                                "${controller.selectedWaiting}");
                                          },
                                          items: controller.waitingDropDown
                                              .map<DropdownMenuItem<String>>(
                                                  (String value) {
                                            return DropdownMenuItem<String>(
                                              alignment: Alignment.centerRight,
                                              value: value,
                                              child: Text(value),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromRGBO(
                                            152, 116, 100, 1.0),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 8.0,
                                          right: 8.0,
                                          bottom: 5.0,
                                          top: 5.0),
                                      child: DropdownButton<String>(
                                        value: controller.selectedWarehouse,
                                        hint: const Center(
                                          child: Text(
                                            "انتخاب گدام",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                        ),
                                        focusColor: Colors.white,
                                        iconEnabledColor: Colors.white,
                                        isExpanded: true,
                                        icon:
                                            const Icon(Icons.arrow_downward),
                                        iconSize: 24,
                                        elevation: 16,
                                        style: const TextStyle(
                                            color: Colors.white),
                                        dropdownColor: const Color.fromRGBO(
                                            152, 116, 100, 1.0),
                                        underline: Container(
                                          color: Colors.transparent,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            controller.selectedWarehouse = newValue;
                                          });
                                          controller.fetchShellData(newValue!);
                                        },
                                        items: controller.superMarketNames.map<DropdownMenuItem<String>>(
                                                (String value) {
                                          return DropdownMenuItem<String>(
                                            alignment: Alignment.centerRight,
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    ),
                                    const SizedBox(
                                    height: 20,
                                    ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: const Color.fromRGBO(
                                          152, 116, 100, 1.0),
                                      borderRadius:
                                      BorderRadius.circular(20.0)),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8.0,
                                        right: 8.0,
                                        bottom: 5.0,
                                        top: 5.0),
                                    child: FutureBuilder(
                                      future: controller.selectedWarehouse != null ? controller.fetchShellData(controller.selectedWarehouse!) : null,
                                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                                          return DropdownButton<String>(
                                            value: controller.selectedShelf,
                                            hint: const Center(
                                              child: Text(
                                                "انتخاب شلف",
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
                                                controller.selectedShelf = newValue;
                                              });
                                            },
                                            items: controller.shellNames.map<DropdownMenuItem<String>>((String value) {
                                                  return DropdownMenuItem<String>(
                                                    alignment: Alignment.centerRight,
                                                    value: value,
                                                    child: Text(value),
                                                  );
                                                }).toList(),
                                          );

                                      },
                                    ),
                                  ),
                                ),


                                const SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        if (controller.selectedShelf != null) {
                                          receiveItems();
                                          setState(() {});
                                        } else {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text('خطا',textAlign: TextAlign.right, style: TextStyle(color: Colors.red,fontSize: 40)),
                                                content: const  Text('لطفا یک شلف انتخاب کنید',textAlign: TextAlign.right,),
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
                                      },
                                      color: const Color.fromRGBO(
                                          162, 126, 110, 1),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      height: 45,
                                      minWidth: 250,
                                      child: const Text(
                                        "ذخیره",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: "Neirizi"),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    )
                                  ],
                                ),
                              )),
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

  Future<void> receiveItems() async {
    int Cnumber = int.parse(controllerTypeItemNumber.text);
    int? WarehouseCapacity;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('Warehouse').where('Name', isEqualTo: controller.selectedWarehouse).get();
    querySnapshot.docs.forEach((doc) {
      var rs = doc['Number'];
      if (rs is int) {
        WarehouseCapacity = rs;
      } else {
        print('Error: Number is not an integer');
      }
    });

    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('Shelf');
    var snapshots = await collectionReference.where('Warehouse', isEqualTo: controller.selectedWarehouse).get();
    var shellNames = snapshots.docs.map((doc) => (doc.data() as Map<String, dynamic>)['Number'] as int?).where((item) => item != null).toList().cast<int>();
    int? rs = shellNames.isNotEmpty ? shellNames[0] : null;
    int ShelfCapacity = rs ?? 0;
    var lastDoc = await FirebaseFirestore.instance.collection('ReceiveFromIran').orderBy('id', descending: true).limit(1).get();

    // If there are no documents yet, start with id 0. Otherwise, increment the last id by 1
    int i = lastDoc.docs.isEmpty ? 0 : lastDoc.docs.first.data()['id'] + 1;
    if (WarehouseCapacity! > 0 && ShelfCapacity > 0) {
      var collection = FirebaseFirestore.instance.collection('waiting');
      var snapshot = await collection.get();
      for (var doc in snapshot.docs) {
        int castnumber = int.parse(doc.data()['typeItemNumber']);
        if(castnumber < Cnumber)
          {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("خطای مقدار", textAlign: TextAlign.right, style: TextStyle(color: Colors.red,fontSize: 30)),
                  content: Text('تعداد موجود $castnumber عدد است ', textAlign: TextAlign.right, style: const TextStyle(color: Colors.black,fontSize: 20)),
                  actions: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                        color: Colors.green,
                        child: const Text('باشه' ,style: TextStyle(color: Colors.white),),
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
        else{
          try {
            List<String> itemValues = [];
            for (TextEditingController controller in itemControllers) {
              itemValues.add(controller.text);
            }

            QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('waiting')
                .where('typeItem', isEqualTo: controller.selectedWaiting)
                .get();

            List<Object?> items = querySnapshot.docs.map((doc) => doc.data()).toList();

            await FirebaseFirestore.instance.collection('ReceiveFromIran').add({
              'id': i,
              'typeItem': controller.selectedWaiting,
              'item': items, // Storing the list of data
              'destinationName': controllerDestionationName.text,
              'driverName': controllerDriverName.text,
              'vehicle': controllerVehcle.text,
              'vehicleTag': controllerVehcleTag.text,
              'NumberItem': Cnumber,
              'date': getShamsiDate(_selectedDate),
              'time': _selectedTime?.format(context),
              'Warehouse': controller.selectedWarehouse,
              'Shelf': controller.selectedShelf,
            });

            print('Item added successfully');
          } catch (e) {
            print(e.toString());
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text("خطای", textAlign: TextAlign.right, style: TextStyle(color: Colors.red,fontSize: 30)),
                  content: Text(e.toString(), textAlign: TextAlign.right, style: const TextStyle(color: Colors.black,fontSize: 20)),
                  actions: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: MaterialButton(
                        color: Colors.green,
                        child: const Text('باشه' ,style: TextStyle(color: Colors.white),),
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
          // Update warehouse and shelf capacity
          var querySnapshotW = await firestore.collection('Warehouse').where('Name', isEqualTo: controller.selectedWarehouse).get();
          for (var doc in querySnapshotW.docs) {
            doc.reference.update({'Number': FieldValue.increment(-Cnumber)});
          }

          var querySnapshot = await firestore.collection('Shelf').where('Warehouse', isEqualTo: controller.selectedWarehouse).get();
          for (var doc in querySnapshot.docs) {
            doc.reference.update({'Number': FieldValue.increment(-Cnumber)});
          }
          // Delete data from 'watting' table
          var waitingSnapshot = await firestore.collection('waiting').where('typeItem', isEqualTo: controller.selectedWaiting).get();
          for (var doc in waitingSnapshot.docs) {
            doc.reference.delete();
            print("deleted");
          }
          setState(() {
            fetchWarehouseData();
            fetchWaitingData();
          });
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                content: const  Text('موفقانه ذخیره شد', textAlign: TextAlign.right, style: TextStyle(color: Colors.black,fontSize: 20)),
                actions: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: MaterialButton(
                      color: Colors.green,
                      child: const Text('باشه' ,style: TextStyle(color: Colors.white),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ],
              );
            },
          );
          print("saved");
        }
      }
    } else {
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
  }

  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final format =
        DateFormat('HH:mm:ss');
    return format.format(dt);
  }

}
