import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:vangard_app/my_widgets/buttons/buton_test.dart';

Widget get searchbar => Padding(
      padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            color: HexColor("F3EDF2"),
            borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
          child: Row(
            children: const [
              Expanded(
                child: Icon(Icons.search),
                flex: 1,
              ),
              Expanded(
                child: Padding(
                  //first button
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ButonTest(title: "Shoes"),
                ),
                flex: 4,
              ),
              Expanded(
                child: Padding(
                  //second button
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ButonTest(
                    title: "T-shirt",
                  ),
                ),
                flex: 4,
              ),
              Expanded(
                child: Padding(
                  //third button
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ButonTest(
                    title: "Sunglasses",
                  ),
                ),
                flex: 4,
              ),
            ],
          ),
        ),
      ),
    );
