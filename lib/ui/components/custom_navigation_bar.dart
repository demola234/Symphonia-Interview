import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:symfonia/utils/colors_consts.dart';

// ignore: must_be_immutable
class CustomNavBar extends StatelessWidget {
  int currentIndex;
  List items;
  ValueChanged<int> onTap;

  CustomNavBar(
      {required this.currentIndex, required this.items, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
      width: MediaQuery.of(context).size.width,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items.map((item) {
            var itemIndex = items.indexOf(item);
            return InkWell(
              onTap: () {
                onTap(itemIndex);
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: [
                    SvgPicture.asset(item.icon,
                        height: 20,
                        width: 20,
                        allowDrawingOutsideViewBox: true,
                        color: currentIndex == itemIndex
                            ? ColorPath.BLACK
                            : ColorPath.GREY),
                    SizedBox(
                      height: 5,
                    ),
                    currentIndex == itemIndex
                        ? Container(
                            height: 5,
                            width: 5,
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                          )
                        : SizedBox()
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}
