import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class Controller {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();



  TextEditingController controllerUS = TextEditingController();
  TextEditingController controllerPS = TextEditingController();
  TextEditingController controllerWarehouseName = TextEditingController();
  TextEditingController controllerWarehouseNumber = TextEditingController();

  //Shelf
  TextEditingController controllershelfName = TextEditingController();
  TextEditingController controllershelfNumber = TextEditingController();

  //Afg Emp
  TextEditingController controllerAfgEmpUserName = TextEditingController();
  TextEditingController controllerAfgEmpPassword = TextEditingController();

  // Ir Emp
  TextEditingController controllerIranEmpUserName = TextEditingController();
  TextEditingController controllerIranEmpPassword = TextEditingController();

  String? selectedWarehouse;
  String? selectedWaiting;
  String? selectedShelf;
  List<String> superMarketNames = [];
  List<String> shellNames = [];
  List<String> waitingDropDown = [];


  final databaseReference = FirebaseDatabase.instance.reference();

  // Add Admin
  void newAdmin(BuildContext context) async {
    String username = controllerUS.text;
    String password = controllerPS.text;

    try {
      CollectionReference collRef =
          FirebaseFirestore.instance.collection('Accounts');

      // Check if username or password contains any of the special characters
      RegExp regExp = RegExp(r'[*.,/"\\]');
      if (regExp.hasMatch(username) ||
          regExp.hasMatch(password) ||
          username.isEmpty ||
          password.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
        return;
      }
      await collRef.add({
        'username': username,
        'password': password,
      }).then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: SuccessNotification(),
            );
          },
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: FiledNotification(),
          );
        },
      );
    }
  }

// Add New Afghan Emp
  void NewAfgEmp(BuildContext context) async {
    String username = controllerAfgEmpUserName.text;
    String password = controllerAfgEmpPassword.text;

    try {
      CollectionReference collRef = FirebaseFirestore.instance.collection('AfgEmp');

      // Check if username or password contains any of the special characters
      RegExp regExp = RegExp(r'[*.,/"\\]');
      if (regExp.hasMatch(username) ||
          regExp.hasMatch(password) ||
          username.isEmpty ||
          password.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
        return;
      }
      await collRef.add({
        'username': username,
        'password': password,
      }).then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: SuccessNotification(),
            );
          },
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: FiledNotification(),
          );
        },
      );
    }
  }

// Add New Iran Emp
  void NewIranEmp(BuildContext context) async {
    String username = controllerIranEmpUserName.text;
    String password = controllerIranEmpPassword.text;

    try {
      CollectionReference collRef = FirebaseFirestore.instance.collection('IranEmp');

      // Check if username or password contains any of the special characters
      RegExp regExp = RegExp(r'[*.,/"\\]');
      if (regExp.hasMatch(username) ||
          regExp.hasMatch(password) ||
          username.isEmpty ||
          password.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
        return;
      }
      await collRef.add({
        'username': username,
        'password': password,
      }).then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: SuccessNotification(),
            );
          },
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: FiledNotification(),
          );
        },
      );
    }
  }

  // Add Warehouse
  void newWarehouse(BuildContext context) async {
    String WarehouseName = controllerWarehouseName.text;
    int warehouseNumber = int.parse(controllerWarehouseNumber.text);

    try {
      CollectionReference collRef = FirebaseFirestore.instance.collection('Warehouse');

      // Check if username or password contains any of the special characters
      RegExp regExp = RegExp(r'[*.,/"\\]');
      if (regExp.hasMatch(WarehouseName) || warehouseNumber == 0 || WarehouseName.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
        return;
      }

      var lastDoc = await FirebaseFirestore.instance.collection('Warehouse').orderBy('id', descending: true).limit(1).get();
      int i = lastDoc.docs.isEmpty ? 1 : lastDoc.docs.first.data()['id'] + 1;
      await collRef.add({
        'id': i,
        'Name': WarehouseName,
        'Number': warehouseNumber,
      }).then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: SuccessNotification(),
            );
          },
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: FiledNotification(),
          );
        },
      );
    }
  }

  // Show Warehouse
  Future<List<Map<String, dynamic>>> showWarehouse() async {
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Warehouse');
    var snapshots = await collectionReference.get();
    return snapshots.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }


  // Show exitFromWarehouse
  Future<List<Map<String, dynamic>>> exitFromWarehouse() async {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('ExitFromWarehouse');
    var snapshots = await collectionReference.get();
    return snapshots.docs
        .map((doc) => doc.data() as Map<String, dynamic>)
        .toList();
  }


  Future<List<String?>> showWarehouseDropDownList() async {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('Warehouse');
    var snapshots = await collectionReference.get();
    return snapshots.docs
        .map((doc) => (doc.data() as Map<String, dynamic>)['Name'] as String?)
        .where((item) => item != null)
        .toList();
  }

  Future<List<String?>> showWarehouseDropDownListDropDownReceive() async {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('waiting');
    var snapshots = await collectionReference.get();
    return snapshots.docs
        .map((doc) => (doc.data() as Map<String, dynamic>)['typeItem'] as String?)
        .where((item) => item != null)
        .toList();
  }

  Future<List<String?>> showexitFromwarehouse() async {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('ReceiveFromIran');
    var snapshots = await collectionReference.get();
    return snapshots.docs
        .map((doc) => (doc.data() as Map<String, dynamic>)['typeItem'] as String?)
        .where((item) => item != null)
        .toList();
  }

// Add a new method to fetch the shell data
  Future<void> fetchShellData(String warehouseName) async {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('Shelf');
    var snapshots = await collectionReference.where('Warehouse', isEqualTo: warehouseName).get();
    shellNames = snapshots.docs.map((doc) => (doc.data() as Map<String, dynamic>)['Name'] as String?).where((item) => item != null).toList().cast<String>(); // This will cast your List<String?> to List<String>
  }

  Future<List<String?>> getShellsData(String warehouseName) async {
    // Get a reference to the Firestore instance.
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Query the Firestore for all shells where the warehouse equals the given name.
    QuerySnapshot querySnapshot = await firestore.collection('Shelf').where('Warehouse', isEqualTo: warehouseName).get();

    // Convert the documents in the snapshot to a list of Warehouse names.
    List<String?> shellsData = querySnapshot.docs
        .map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return data != null ? data['Warehouse'] as String : null;
    })
        .where((data) => data != null)
        .toList();

    return shellsData;
  }

  // Add shells
  void newShells(BuildContext context, var warehouse) async {
    String shellsName = controllershelfName.text;
    int shellsNumber = int.parse(controllershelfNumber.text);
    int? WarehouseCapacity;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('Warehouse').where('Name', isEqualTo: warehouse).get();
    for (var doc in querySnapshot.docs) {
      var rs = doc['Number'];
      if(rs is int) {
        WarehouseCapacity = rs;
      } else {
        print('Error: Number is not an integer');
      }
    }
      if(shellsNumber < WarehouseCapacity!) {
        try {
          CollectionReference collRef = FirebaseFirestore.instance.collection('Shelf');
          // Check if username or password contains any of the special characters
          RegExp regExp = RegExp(r'[*.,/"\\]');
          if (regExp.hasMatch(shellsName) || shellsNumber == 0 || shellsName.isEmpty) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: FiledNotification(),
                );
              },
            );
            return;
          }
          var lastDoc = await FirebaseFirestore.instance.collection('Warehouse').orderBy('id', descending: true).limit(1).get();
          int i = lastDoc.docs.isEmpty ? 1 : lastDoc.docs.first.data()['id'] + 1;
          print("5");
          await collRef.add({
            'id': i,
            'Name': shellsName,
            'Number': shellsNumber,
            'Warehouse':warehouse,
          }).then((value){
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: SuccessNotification(),
                );
              },
            );
          }).catchError((error) {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const AlertDialog(
                  backgroundColor: Colors.transparent,
                  content: FiledNotification(),
                );
              },
            );
          });
        } catch (e) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const AlertDialog(
                backgroundColor: Colors.transparent,
                content: FiledNotification(),
              );
            },
          );
        }
      }
      else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('خطا',textAlign: TextAlign.right, style: TextStyle(color: Colors.red,fontSize: 40)),
              content: const Text('شما از مقدار ظریفت انبار بیشتر وارد کردید'),
              actions: <Widget>[
                MaterialButton(
                  color: Colors.red,
                  child: const Text('باشه'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );

      }

  }

  // Show shells  Filter the data where the 'Warehouse' column is equal to 'warehouseName'
  Future<List<Map<String, dynamic>>> showshells(String warehouseName) async {
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('Shelf');
    var snapshots = await collectionReference.get();
    var filteredData = snapshots.docs.where((doc) => (doc.data() as Map<String, dynamic>)['Warehouse'] == warehouseName);
    return filteredData.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  void showshellsNumber(String dropdownValue) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    QuerySnapshot querySnapshot = await firestore.collection('Shelf').where('Warehouse', isEqualTo: dropdownValue).get();
    List<int> numbers = [];

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      int number = int.parse(data['Number']);
      numbers.add(number);
    }

    // Now you have a list of numbers
    print(numbers);
  }


  // add Iran Emp Date
  void newIranEmp(BuildContext context) async {
    String WarehouseName = controllerWarehouseName.text;
    String WarehouseNumber = controllerWarehouseNumber.text;
    print("2  $WarehouseName");

    try {
      CollectionReference collRef = FirebaseFirestore.instance.collection('Warehouse');

      // Check if username or password contains any of the special characters
      RegExp regExp = RegExp(r'[*.,/"\\]');
      if (regExp.hasMatch(WarehouseName) ||
          regExp.hasMatch(WarehouseNumber) ||
          WarehouseName.isEmpty ||
          WarehouseNumber.isEmpty) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
        return;
      }
      await collRef.add({
        'Name': WarehouseName,
        'Number': WarehouseNumber,
      }).then((value) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: SuccessNotification(),
            );
          },
        );
      }).catchError((error) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const AlertDialog(
              backgroundColor: Colors.transparent,
              content: FiledNotification(),
            );
          },
        );
      });
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            content: FiledNotification(),
          );
        },
      );
    }
  }

  Future<List<Map<String, dynamic>>> showWaitData_MataData(int carpetMataData) async {
    final CollectionReference collectionReference =
    FirebaseFirestore.instance.collection('waiting');

    var snapshots = await collectionReference.get();
    // Filter the data where the 'id' column is equal to 'carpetMataData'
    var filteredData = snapshots.docs.where((doc) => (doc.data() as Map<String, dynamic>)['id'] == carpetMataData);
    return filteredData.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<List<Map<String, dynamic>>> showWaitData() async {
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('waiting');
    var snapshots = await collectionReference.get();
    return snapshots.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }

  Future<List<Map<String, dynamic>>> showWhData() async {
    final CollectionReference collectionReference = FirebaseFirestore.instance.collection('ReceiveFromIran');
    var snapshots = await collectionReference.get();
    return snapshots.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }


  void deleteFromFirebase(String id) async {
    var querySnapshot = await FirebaseFirestore.instance.collection('waiting').where('id', isEqualTo: id).get();
    querySnapshot.docs.forEach((doc) async {
      await FirebaseFirestore.instance.collection('waiting').doc(doc.id).delete();
      print("deleted");
    });
  }


  Future<List<Map<String, dynamic>>> getAllData_SendFromIran() async {
    var snapshot = await FirebaseFirestore.instance.collection('SendFromIran').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }


}

class SuccessNotification extends StatelessWidget {
  const SuccessNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.check_circle, color: Colors.white, size: 100),
          const Text('Success', style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

class FiledNotification extends StatelessWidget {
  const FiledNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Icon(Icons.dangerous, color: Colors.white, size: 100),
          const Text('Filed', style: TextStyle(color: Colors.white, fontSize: 24)),
          const SizedBox(height: 10),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
