import "dart:async";
import "dart:html";

import "package:cloud_firestore/cloud_firestore.dart";
import "package:farm_swap_karl/routes/routes.dart";
import "package:flutter/material.dart";

import "../data/sign_up_idretreival.dart";

class AdminSignup3 extends StatefulWidget {
  const AdminSignup3({super.key});

  @override
  State<AdminSignup3> createState() => _AdminSignup3State();
}

class _AdminSignup3State extends State<AdminSignup3> {
  //Variables to be assigned for each pictures picked
  String idUrl = "";
  String profileUrl = "";

  GetDocumentId test = GetDocumentId();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register 2"),
      ),
      body: Center(
          child: SizedBox(
        height: 500,
        width: 500,
        child: Column(children: [
/*Column for Profile Picture */
          Column(
            children: [
              const Text("Select Profile Picture"),
              const SizedBox(
                height: 5,
              ),
              IconButton(
                onPressed: () {
                  uploadImage();
                },
                icon: const Icon(Icons.add_a_photo),
              ),
            ],
          ),
/*Column for ID Picture */
          Column(
            children: [
              const Text("Select Profile Picture"),
              const SizedBox(
                height: 5,
              ),
              IconButton(
                onPressed: () {
                  uploadImage2();
                },
                icon: const Icon(Icons.add_a_photo),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              updateField();
              Navigator.of(context).pushNamed(RoutesManager.signInPage);
            },
            child: const Text("Finish"),
          ),
        ]),
      )),
    );
  }

//Method for selecting an ID picuture
  Future<void> uploadImage() async {
    final FileUploadInputElement input = FileUploadInputElement();
    input.accept = "image/*";
    input.click();

    final completer = Completer<String>();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();

      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as String);
      });
      reader.readAsDataUrl(file);
    });

    final downloadUrl = await completer.future;
    //update.idUrl = downloadUrl;
    setState(() {
      idUrl = downloadUrl;
    });
  }

/*Function for uploading the profile picutre */
  Future<void> uploadImage2() async {
    final FileUploadInputElement input = FileUploadInputElement();
    input.accept = "image/*";
    input.click();

    final completer = Completer<String>();

    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();

      reader.onLoadEnd.listen((event) {
        completer.complete(reader.result as String);
      });
      reader.readAsDataUrl(file);
    });

    final downloadUrl = await completer.future;
    //update.profileUrl = downloadUrl;
    setState(() {
      profileUrl = downloadUrl;
    });
  }

  //Function to upate a field
  Future<void> updateField() async {
    await test.getUserID();
    final docRef =
        FirebaseFirestore.instance.collection("Users").doc(test.docID);
    final updateFields = {
      "ID Url": idUrl,
      "Profile Url": profileUrl,
    };

    await docRef.update(updateFields);
  }
}
