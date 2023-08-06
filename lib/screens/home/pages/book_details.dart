import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';

class BookDetail extends StatelessWidget {
  static const nameRoute = '/bookDetails';
  @override
  Widget build(BuildContext context) {
    final Map data = ModalRoute.of(context)?.settings.arguments as Map;
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
      return Hero(
        tag: data['imageUrl'],
        child: Container(
            height: 267,
            width: 175,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage(data['imageUrl'])),
            )),
      );
    }

    Widget infoDescription() {
      return Container(
        height: 60,
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: BoxDecoration(
            color: greyColorInfo, borderRadius: BorderRadius.circular(9)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  'rating',
                  style: mediumText10.copyWith(color: deviderColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '4.8',
                  style: semiBoldText12.copyWith(color: blackColor),
                )
              ],
            ),
            VerticalDivider(
              color: deviderColor,
              thickness: 1,
            ),
            Column(
              children: [
                Text(
                  'number of pages',
                  style: mediumText10.copyWith(color: deviderColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  '180 Page',
                  style: semiBoldText12.copyWith(color: blackColor),
                )
              ],
            ),
            VerticalDivider(
              color: deviderColor,
              thickness: 1,
            ),
            Column(
              children: [
                Text(
                  'language',
                  style: mediumText10.copyWith(color: deviderColor),
                ),
                SizedBox(
                  height: 2,
                ),
                Text(
                  'ENG',
                  style: semiBoldText12.copyWith(color: blackColor),
                )
              ],
            ),
          ],
        ),
      );
    }

    Widget saveButton() {
      return Positioned(
        top: 400,
        right: 30,
        child: Container(
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 6),
          width: 50,
          decoration: BoxDecoration(color: greenColor, shape: BoxShape.circle),
          child: Image.asset('assets/icons/icon-save.png'),
        ),
      );
    }

    Widget bottonReadNow() {
      return Container(
        height: 50,
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
              backgroundColor: greenColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30))),
          child: Text(
            'Read Now',
            style: semiBoldText20.copyWith(color: whiteColor),
          ),
        ),
      );
    }

    Widget description() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['title'],
                        style: semiBoldText20.copyWith(color: blackColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        data['writers'],
                        style:
                            mediumText14.copyWith(color: Colors.grey.shade300),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'free access',
                  style: mediumText14.copyWith(color: greenColor),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "description",
              style: semiBoldText14.copyWith(color: blackColor),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              "description",
              style: regularText12.copyWith(color: Colors.grey.shade400),
            ),
            infoDescription(),
            bottonReadNow(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [header(), bookImage(), description()],
              ),
              saveButton()
            ],
          )
        ],
      ),
    );
  }
}
