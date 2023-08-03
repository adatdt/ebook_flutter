import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/themes.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'components/recent_book.dart';
import 'components/trending_book.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/homePage';
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _catagories = [
    "all books",
    "comic",
    "Novel",
    "Manga",
    "Fairy Tales"
  ];

  int _isSelected = 0;
  @override
  Widget build(BuildContext context) {
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile-pic.png'))),
            ),
            SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Halo Sarah, ",
                  style: semiBoldText16,
                ),
                Text(
                  "Good morning",
                  style: regularText14.copyWith(color: Colors.grey),
                )
              ],
            ),
            Spacer(),
            Image.asset(
              "assets/icons/icon-menu.png",
              width: 18,
            )
          ],
        ),
      );
    }

    Widget searchField() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Find Your Favorite Book',
              hintStyle: mediumText12.copyWith(color: Colors.grey),
              fillColor: greySearchField,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(12))),
              isCollapsed: true,
              contentPadding: EdgeInsets.all(18),
              suffixIcon: InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: greenColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Icon(
                    Icons.search_rounded,
                    color: Colors.white,
                  ),
                ),
              )),
        ),
      );
    }

    Widget recentBook() {
      // agar view bisa scroll kanan
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: [
            recent_book(
              image: 'assets/images/recentbook-1.png',
              title: 'magic book',
            ),
            SizedBox(
              width: 20,
            ),
            recent_book(
              image: 'assets/images/recentbook-2.png',
              title: 'The martian',
            ),
          ],
        ),
      );
    }

    Widget categories(int index) {
      return InkWell(
        onTap: () {
          setState(() {
            _isSelected = index;
          });
        },
        child: Container(
          margin: EdgeInsets.only(top: 30, right: 12),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
              color: _isSelected == index ? greenColor : transparantParentColor,
              borderRadius: BorderRadius.circular(6)),
          child: Text(
            _catagories[index],
            style: semiBoldText14.copyWith(
                color:
                    _isSelected == index ? whiteColor : Colors.grey.shade400),
          ),
        ),
      );
    }

    Widget listCategories() {
      return SingleChildScrollView(
        padding: EdgeInsets.only(left: 30),
        scrollDirection: Axis.horizontal,
        child: Row(
            children: _catagories
                .asMap()
                .entries
                .map((MapEntry map) => categories(map.key))
                .toList()),
      );
    }

    Widget trandingBook() {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Row(
          children: bookLists
              .asMap()
              .entries
              .map((MapEntry map) => TrendingBook(
                    info: bookLists[map.key],
                  ))
              .toList(),
        ),
      );
    }

    return Scaffold(
        body: ListView(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 30),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              header(),
              SizedBox(height: 30),
              searchField(),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  'Recent Book',
                  style: semiBoldText16.copyWith(color: blackColor),
                ),
              ),
              SizedBox(height: 12),
              recentBook(),
            ],
          ),
        ),
        listCategories(),
        Padding(
          padding: const EdgeInsets.only(left: 30, top: 30),
          child: Text(
            'Tranding Now',
            style: semiBoldText16.copyWith(color: blackColor),
          ),
        ),
        trandingBook(),
        SizedBox(
          height: 30,
        )
      ],
    ));
  }
}
