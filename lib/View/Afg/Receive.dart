import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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

  final TextEditingController _controller = TextEditingController();
  final List<String> _hints = ['نام کار', 'زمینه رنگ', 'سایز', 'تراکم', 'شانه'];
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
                              icon: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
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
                                      controller: controllerTypeItem,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "نوع جنس",
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
                                              controller.selectedWaiting =
                                                  newValue;
                                              controller
                                                  .fetchShellData(newValue!);
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
                                              controller.fetchShellData(newValue!);
                                            });
                                            print(
                                                "${controller.selectedWarehouse}");
                                          },
                                          items: controller.superMarketNames
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
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    MaterialButton(
                                      onPressed: () async {
                                        // newIranEmpSendItem();
                                        // waitIranEmpSendItem();
                                        // receiveItems();

                                        if (controller.selectedShelf != null) {
                                          // controller.showshellsNumber(controller.selectedShell!);
                                          receiveItems();
                                        } else {
                                          print("select a shelf");
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
    // print(controller.selectedWarehouse);
    int Cnumber = int.parse(controllerTypeItemNumber.text);


    int? WarehouseCapacity;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('Warehouse').where('Name', isEqualTo: controller.selectedWarehouse).get();
    querySnapshot.docs.forEach((doc) {
      var rs = doc['Number'];
      if(rs is int) {
        WarehouseCapacity = rs;
      } else {
        print('Error: Number is not an integer');
      }
    });


    print('Warehouse: $WarehouseCapacity');
    print(WarehouseCapacity.runtimeType);

    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('Shelf');
    var snapshots = await collectionReference.where('Warehouse', isEqualTo: controller.selectedWarehouse).get();
    var shellNames = snapshots.docs.map((doc) =>
    (doc.data() as Map<String, dynamic>)['Number'] as int?).where((item) => item != null).toList().cast<int>();
    int? rs = shellNames.isNotEmpty ? shellNames[0] : null;
    int ShelfCapacity = rs ?? 0;


    print('Shells: $ShelfCapacity');

    print(ShelfCapacity.runtimeType);

     if (WarehouseCapacity! > 0 && ShelfCapacity > 0) {
       try {
             List<String> itemValues = [];
             for (TextEditingController controller in itemControllers) {
               itemValues.add(controller.text);
             }
             var lastDoc = await FirebaseFirestore.instance.collection('ReceiveFromIran').orderBy('id', descending: true).limit(1).get();

             // If there are no documents yet, start with id 0. Otherwise, increment the last id by 1
             int i = lastDoc.docs.isEmpty ? 0 : lastDoc.docs.first.data()['id'] + 1;

             await FirebaseFirestore.instance.collection('ReceiveFromIran').add({
               'id': i,
               'destinationName': controllerDestionationName.text,
               'driverName': controllerDriverName.text,
               'vehicle': controllerVehcle.text,
               'vehicleTag': controllerVehcleTag.text,
               'NumberItem': Cnumber,
               'date': getShamsiDate(_selectedDate),
               'time': _selectedTime?.format(context),
               'items': itemValues,
               'Warehouse' : controller.selectedWarehouse,
               'Shelf' : controller.selectedShelf,
             });
             print('Item added successfully');
           } catch (e) {
             print(e.toString());
           }

         // Update warehouse and shelf capacity
          print(Cnumber.runtimeType);


         var querySnapshot = await firestore.collection('Shelf').where('Name', isEqualTo: controller.selectedShelf).get();

         for (var doc in querySnapshot.docs) {
           doc.reference.update({
             'Number': FieldValue.increment(-Cnumber)
           });
         }

       var querySnapshotW = await firestore.collection('Warehouse').where('Name', isEqualTo: controller.selectedWarehouse).get();
       for (var doc in querySnapshotW.docs) {
         doc.reference.update({
           'Number': FieldValue.increment(-Cnumber)
         });
       }

       } else {
         print('Not enough capacity');
       }












     }




















  String formatTimeOfDay(TimeOfDay timeOfDay) {
    final now = DateTime.now();
    final dt = DateTime(
        now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
    final format =
        DateFormat('HH:mm:ss'); // you can change the format as needed
    return format.format(dt);
  }

  Future<void> waitIranEmpSendItem() async {
    try {
      List<String> itemValues = [];
      for (TextEditingController controller in itemControllers) {
        itemValues.add(controller.text);
      }
      // Get the last document in the 'waiting' collection
      var lastDoc = await FirebaseFirestore.instance
          .collection('waiting')
          .orderBy('id', descending: true)
          .limit(1)
          .get();

      // If there are no documents yet, start with id 0. Otherwise, increment the last id by 1
      int i = lastDoc.docs.isEmpty ? 0 : lastDoc.docs.first.data()['id'] + 1;

      await FirebaseFirestore.instance.collection('waiting').add({
        'id': i,
        'source': controllerSource.text,
        'destination': controllerDestionation.text,
        'destinationName': controllerDestionationName.text,
        'driverName': controllerDriverName.text,
        'vehicle': controllerVehcle.text,
        'vehicleTag': controllerVehcleTag.text,
        'typeItem': controllerTypeItem.text,
        'typeItemNumber': controllerTypeItemNumber.text,
        'date': getShamsiDate(_selectedDate),
        'time': formatTimeOfDay(_selectedTime!), // Use the new method here
        'items': itemValues,
      });

      // print('Item added successfully with ID: $newId');
    } catch (e) {
      print(e.toString());
    }
  }
}
