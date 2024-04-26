import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mnm/View/Drawer/IranDrawer.dart';
import 'package:shamsi_date/shamsi_date.dart';
import 'package:mnm/Controller/Controller.dart';
import 'package:persian_datetime_picker/persian_datetime_picker.dart' as pdp;

class IrEmp extends StatefulWidget {
  const IrEmp({super.key});

  @override
  State<IrEmp> createState() => _IrEmpState();
}

class _IrEmpState extends State<IrEmp> {
  final Controller controller = Controller();
  TextEditingController controllerSource = TextEditingController();
  TextEditingController controllerDestionation = TextEditingController();
  TextEditingController controllerDestionationName = TextEditingController();
  TextEditingController controllerDriverName = TextEditingController();
  TextEditingController controllerVehcle = TextEditingController();
  TextEditingController controllerVehcleTag = TextEditingController();
  TextEditingController controllerTypeItem = TextEditingController();
  TextEditingController controllerTypeItemNumber = TextEditingController();
  TextEditingController controllerTypeItemShanh = TextEditingController();
  TextEditingController controllerTypeItemTrakom = TextEditingController();
  TextEditingController controllerTypeItemSize = TextEditingController();
  TextEditingController controllerTypeItemName = TextEditingController();
  TextEditingController controllerTypeItemColor = TextEditingController();



  @override
  void initState() {
    super.initState();
    fetchWarehouseData();
  }

  Future<void> fetchWarehouseData() async {
    controller.superMarketNames =
        (await controller.showWarehouseDropDownList()).cast<String>();
    setState(() {});
  }

  final TextEditingController _controller = TextEditingController();
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
        drawer: const IranDrawer(),
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
                          "ارسال      کردن     اجناس",
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
                                      controller: controllerSource,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                          focusColor: Colors.white,
                                          border: OutlineInputBorder(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(20))),
                                          hintText: "مبدأ",
                                          hintStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20)),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: controllerDestionation,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "مقصد",
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
                                      controller: controllerDestionationName,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "ارسال کننده",
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
                                        hintText: "تعداد جنس",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),

                                    ),


                                    //---------------------------------------------------
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    TextField(
                                      controller: controllerTypeItemName,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "نام کار",
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
                                      controller: controllerTypeItemColor,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "زمینه رنگ",
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
                                      controller: controllerTypeItemSize,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "سایز",
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
                                      controller: controllerTypeItemTrakom,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "تراکم",
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
                                      controller: controllerTypeItemShanh,
                                      textAlign: TextAlign.right,
                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                        ),
                                        hintText: "شانه",
                                        hintStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),

                                    ),


                                    //---------------------------------------------------

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
                                    MaterialButton(
                                      onPressed: () {
                                        newIranEmpSendItem();
                                      },
                                      color: const Color.fromRGBO(
                                          162, 126, 110, 1),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      height: 45,
                                      minWidth: 200,
                                      child: const Text(
                                        "ذخیره",
                                        style: TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontFamily: "Neirizi"),
                                      ),
                                    ),

                                    SizedBox(
                                      height: 50,
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

  Future<void> newIranEmpSendItem() async {
    try {
      Center(
        child: LoadingAnimationWidget.inkDrop(
          color: const Color.fromRGBO(
              152, 116, 100, 1.0),
          size: 50,
        ),
      );
      await FirebaseFirestore.instance.collection('SendFromIran').add({
        'source': controllerSource.text,
        'destination': controllerDestionation.text,
        'destinationName': controllerDestionationName.text,
        'driverName': controllerDriverName.text,
        'vehicle': controllerVehcle.text,
        'vehicleTag': controllerVehcleTag.text,
        'typeItem': controllerTypeItem.text,
        'typeItemNumber': controllerTypeItemNumber.text,
        'Item Name': controllerTypeItemName.text,
        'Item Color':controllerTypeItemColor.text,
        'Item Size':controllerTypeItemSize.text,
        'Item Trakom' : controllerTypeItemTrakom.text,
        'Item Shanh' : controllerTypeItemShanh.text,
        'date': getShamsiDate(_selectedDate),
        'time': _selectedTime?.format(context),

      });
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
      waitIranEmpSendItem();
      print('Item added successfully');
    } catch (e) {
      print(e.toString());
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
      // Get the last document in the 'waiting' collection
      var lastDoc = await FirebaseFirestore.instance.collection('waiting').orderBy('id', descending: true).limit(1).get();

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
        'Item Name': controllerTypeItemName.text,
        'Item Color':controllerTypeItemColor.text,
        'Item Size':controllerTypeItemSize.text,
        'Item Trakom' : controllerTypeItemTrakom.text,
        'Item Shanh' : controllerTypeItemShanh.text,
        'date': getShamsiDate(_selectedDate),
        'time': formatTimeOfDay(_selectedTime!), // Use the new method here
      });

      // print('Item added successfully with ID: $newId');
    } catch (e) {
      print(e.toString());
    }
  }
}
