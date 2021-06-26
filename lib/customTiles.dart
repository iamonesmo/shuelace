import 'package:flutter/material.dart';

class CustomTile extends StatelessWidget {
  final IconData tileIcon;
  final String tileText;
  final Function tileOnTap;

  CustomTile(this.tileIcon, this.tileText, this.tileOnTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
      child: Container(
        child: InkWell(
          splashColor: Colors.deepOrangeAccent,
          onTap: () {
            tileOnTap();
          },
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      tileIcon,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        tileText,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
