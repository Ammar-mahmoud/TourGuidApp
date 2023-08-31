import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.imageUrl, required this.id});
  final String id, title, imageUrl;
  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/trips',
      arguments: {
        'id' : id,
        'title' : title
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectCategory(context);
      },
      splashColor: Colors.blue[300],
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          ClipRRect(
              //to make image circular
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageUrl,
                height: 250,
                fit: BoxFit.cover,
              )),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.black38,
            ),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
