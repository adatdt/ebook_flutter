import 'package:flutter/cupertino.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../themes.dart';

class recent_book extends StatelessWidget {
  const recent_book({
    super.key,
    required this.image,
    required this.title,
  });

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: borderColorRecentBook),
          borderRadius: BorderRadius.all(Radius.circular(12))),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 90,
          ),
          SizedBox(
            width: 18,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: semiBoldText14.copyWith(color: blackColor),
              ),
              CircularPercentIndicator(
                reverse: true,
                radius: 50,
                lineWidth: 7,
                animation: true,
                percent: 0.5,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: greenColor,
              ),
              Text(
                '50% Complate',
                style: mediumText12.copyWith(color: greyColorRecentBook),
              )
            ],
          )
        ],
      ),
    );
  }
}
