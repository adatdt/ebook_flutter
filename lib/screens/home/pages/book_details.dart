import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  static const nameRoute = '/bookDetails';
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        margin: EdgeInsets.only(top: 30, bottom: 50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.chevron_left_rounded)),
            Text("Book Deatil",
                style: semiBoldText14.copyWith(color: blackColor)),
            Icon(Icons.share_outlined)
          ],
        ),
      );
    }

    Widget bookImage() {
      return Container(
          height: 267,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/images/tranding_book_1.png')),
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Column(
            children: [header(), bookImage()],
          )
        ],
      ),
    );
  }
}
