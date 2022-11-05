import 'package:flutter/material.dart';
import 'package:marriage_story_mobile/constants/theme.dart';

class IconNavbar extends StatelessWidget {
  const IconNavbar(
      {Key? key,
      required this.text,
      required this.selected,
      required this.onPressed,
      required this.iconEnable,
      required this.iconDisable})
      : super(key: key);
  final String text;
  final String iconEnable;
  final String iconDisable;
  final bool selected;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        width: 70,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: selected
                  ? Image.asset(
                      iconEnable,
                      width: 20,
                      height: 20,
                    )
                  : Image.asset(
                      iconDisable,
                      width: 20,
                      height: 20,
                    ),
            ),
            const SizedBox(
              height: 5,
            ),
            selected
                ? Text(
                    text,
                    style: TextStyle(
                        fontSize: 10,
                        fontWeight: semiBold,
                        color: colorPrimary),
                  )
                : Text(
                    text,
                    style: TextStyle(
                        fontSize: 10, fontWeight: semiBold, color: colorGrey),
                  )
          ],
        ),
      ),
    );
  }
}
