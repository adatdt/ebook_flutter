import 'package:e_book_app/models/book.dart';
import 'package:e_book_app/screens/home/pages/book_details.dart';
import 'package:flutter/material.dart';
import '../../../themes.dart';

class TrendingBook extends StatelessWidget {
  const TrendingBook({super.key, required this.info});

  final BookList info;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, BookDetail.nameRoute);
          },
          child: Container(
            height: 160,
            width: 110,
            margin: EdgeInsets.only(top: 12, right: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: AssetImage(info.imageUrl))),
          ),
        ),
        Text(
          info.title,
          style: mediumText12.copyWith(color: Colors.grey.shade300),
        ),
        Text(
          info.writers,
          style: semiBoldText14.copyWith(color: blackColor),
        )
      ],
    );
  }
}
