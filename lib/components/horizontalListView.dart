import 'package:flutter/material.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          Category(imageLocation: "images/a.jpg", imageCaption: "Zorro",),
          Category(imageLocation: "images/b.jpg", imageCaption: "Amit"),
          Category(imageLocation: "images/c.jpg", imageCaption: "Sanja"),
          Category(imageLocation: "images/a.jpg", imageCaption: "Zorro"),
          Category(imageLocation: "images/b.jpg", imageCaption: "Amit"),
          Category(imageLocation: "images/c.jpg", imageCaption: "Sanja"),
          Category(imageLocation: "images/a.jpg", imageCaption: "Zorro"),
          Category(imageLocation: "images/b.jpg", imageCaption: "Amit"),
          Category(imageLocation: "images/c.jpg", imageCaption: "Sanja"),
          Category(imageLocation: "images/c.jpg", imageCaption: "Sanja"),
          Category(imageLocation: "images/a.jpg", imageCaption: "Zorro"),
          Category(imageLocation: "images/b.jpg", imageCaption: "Amit"),
          Category(imageLocation: "images/c.jpg", imageCaption: "Sanja"),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;
  const Category(
      {Key? key, required this.imageLocation, required this.imageCaption})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            title: Image.asset(
              imageLocation,
              width: 100.0,
              height: 80.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
                child: Text(imageCaption,style:const TextStyle(
                  fontWeight: FontWeight.w600
                ),),
              ),
            ),
          ),
        ),
    );
  }
}
