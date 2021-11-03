// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vangard_app/navigation_page.dart';
import 'package:vangard_app/extensions/ui_extension.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  _AddPostState createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  ImagePicker picker = ImagePicker();
  XFile? _image;
  XFile? _camera;
  
  _imgFromGallery() async {
    _image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 100);

    setState(() {});
  }

  _imgFromCamera() async {
    _camera =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 100);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: addPostAppBar(context),
        body: Container(
          margin: context.lowPadding * 0.21,
          decoration: addPostDecoration(),
          child: SingleChildScrollView(
            child: Padding(
              padding: context.lowSymAllPadding,
              child: Column(
                children: [
                  containerPadding(context),
                  if (_image != null)
                    Image.file(File(_image!.path), fit: BoxFit.fitWidth),
                  if (_camera != null)
                    Image.file(File(_camera!.path), fit: BoxFit.fitWidth),
                  postTitleTextfield(),
                  postDivider(),
                  postTextTextfield(),
                  postDivider(),
                  postStoreField(),
                  postDivider(),
                  containerPadding(context),
                ],
              ),
            ),
          ),
        ),
        floatingActionButton: floatingActionButton(),
      ),
    );
  }

  Container containerPadding(BuildContext context) => Container(height: context.lowHeight);

  TextField postStoreField() {
    return TextField(
                  maxLines: null,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Store',
                    border: InputBorder.none,
                  ),
                );
  }

  TextField postTextTextfield() {
    return TextField(
                  maxLines: null,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Post Text',
                    border: InputBorder.none,
                  ),
                );
  }

  Divider postDivider() {
    return Divider(
                  color: Colors.black,
                  height: 1.5,
                );
  }

  TextField postTitleTextfield() {
    return TextField(
                  maxLines: null,
                  obscureText: false,
                  decoration: InputDecoration(
                    labelText: 'Post Title',
                    border: InputBorder.none,
                  ),
                );
  }

  BoxDecoration addPostDecoration() {
    return BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(1, 7))
            ],
            color: HexColor("F3EDF2"),
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(30));
  }

  AppBar addPostAppBar(BuildContext context) {
    return AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff9962DB),
        leading: const CupertinoNavigationBarBackButton(
          color: Colors.white,
        ),
        title: Text(
          "Add Post",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            color: Colors.white,
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Post get succesfull.'),
                ),
              );
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationPage()));
            },
            icon: const Icon(Icons.done),
            tooltip: "Show Snackbar",
          ),
        ],
      );
  }

  SpeedDial floatingActionButton() {
    return SpeedDial(
      curve: Curves.bounceIn,
      foregroundColor: Colors.white,
      childrenButtonSize: MediaQuery.of(context).size.height * 0.06,
      backgroundColor: HexColor("9962DB"),
      overlayColor: Colors.grey,
      animatedIcon: AnimatedIcons.menu_arrow,
      direction: SpeedDialDirection.up,
      spacing: 40,
      overlayOpacity: 0.1,
      childMargin: const EdgeInsets.all(20),
      children: [
        SpeedDialChild(
          onTap: () {
            _imgFromGallery();
          },
          shape: const CircleBorder(),
          labelBackgroundColor: HexColor("9962DB"),
          labelStyle: const TextStyle(color: Colors.white),
          foregroundColor: Colors.white,
          backgroundColor: HexColor("9962DB"),
          child: const Icon(Icons.photo),
          label: "Add Photo with Gallery",
        ),
        SpeedDialChild(
            onTap: () {
              _imgFromCamera();
            },
            labelBackgroundColor: HexColor("9962DB"),
            labelStyle: const TextStyle(color: Colors.white),
            foregroundColor: Colors.white,
            backgroundColor: HexColor("9962DB"),
            child: const Icon(Icons.camera_alt),
            label: "Add Photo from Camera"),
      ],
    );
  }
}
