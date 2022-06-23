import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../components/common/functions/all_text_editing_controller.dart';
import '../../../components/common/functions/file_function.dart';

class Body extends StatefulWidget {
  const Body({Key? key,  required this.title}) : super(key: key);
  final String title;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    File? file;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder<FileSystemEvent>(
          stream: fileWatchHelper(getpath: watchBackUp.text),
          builder: (context, snapshot) {
            print(snapshot.data?.path);
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      children: [
                        const Text(
                          'Choose Your Folder for Backup: ',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          file?.path ?? 'No File Chosen',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      cursorHeight: 20,
                      autofocus: false,
                      controller: watchBackUp,
                      decoration: InputDecoration(
                        labelText: 'Enter The directory You want to backUp',
                        hintText: "Enter The directory",
                        prefixIcon: const Icon(Icons.star),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          FilePickerResult? result =
                              await FilePicker.platform.pickFiles();
                          if (result != null) {
                            file = File(result.files.single.path.toString());
                            setState(() {});
                            if (file != null) {
                              print('File path: ' + file!.path);
                            }
                          } else {
                            // User canceled the picker
                            print("User Canceled");
                          }
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Browse'),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20.0),
                            backgroundColor: Colors.redAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      cursorHeight: 20,
                      autofocus: false,
                      controller: fromBackUp,
                      decoration: InputDecoration(
                        labelText: 'Enter The backUp directory path',
                        hintText: "Enter The directory path",
                        prefixIcon: const Icon(Icons.star),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(
                      cursorHeight: 20,
                      autofocus: false,
                      controller: toBackUp,
                      decoration: InputDecoration(
                        labelText: 'Enter The destination path',
                        hintText: "Enter The destination path",
                        prefixIcon: const Icon(Icons.star),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.grey, width: 1.5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          gapPadding: 0.0,
                          borderRadius: BorderRadius.circular(30),
                          borderSide:
                              const BorderSide(color: Colors.red, width: 1.5),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextButton(
                        onPressed: () {
                          //print('I got clicked');
                          fileWatchHelper(getpath: watchBackUp.text);
                          print("path ${watchBackUp.text}");
                          setState(() {});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Watch'),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20.0),
                            backgroundColor: Colors.redAccent),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: 50,
                      child: TextButton(
                        onPressed: () async {
                          copyDirectory(Directory(fromBackUp.text),
                              Directory(toBackUp.text));
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Back Up'),
                        ),
                        style: TextButton.styleFrom(
                            primary: Colors.white,
                            textStyle: const TextStyle(fontSize: 20.0),
                            backgroundColor: Colors.redAccent),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
