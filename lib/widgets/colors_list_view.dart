import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.colors});
  final bool isActive;
  final Color colors;
  @override
  Widget build(BuildContext context) {
    return isActive
        ? CircleAvatar(
            backgroundColor: colors == const Color(0xffF8F7F9)
                ? const Color(0xff92DCE5)
                : Colors.white,
            radius: 38,
            child: CircleAvatar(
              radius: 35,
              backgroundColor: colors,
            ),
          )
        : CircleAvatar(
            radius: 35,
            backgroundColor: colors,
          );
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  List<Color> colors = const [
    Color(0xff2B2D42),
    Color(0xff92DCE5),
    Color(0xffF8F7F9),
    Color(0xffF7EC59),
    Color(0xffFF66D8),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3),
            child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: () {
                  currentIndex = index;
                  setState(() {});
                },
                child: ColorItem(
                    colors: colors[index], isActive: currentIndex == index)),
          );
        },
      ),
    );
  }
}
