import 'package:flutter/material.dart';
import 'package:grocery_app/constants/apiService.dart';
import 'package:grocery_app/provider/category_data_provider.dart';
import 'package:grocery_app/ApiCalls/api_calls.dart';

class HorizontalListView extends StatelessWidget {
  // const HorizontalListView(CategoryDataProvider data, {Key? key}) : super(key: key);
  // final ani = const Product();
   HorizontalListView(CategoryDataProvider data, {Key? key}) : super(key: key);
  final dataFunc =  ApiCalls().fetchProducts();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: FutureBuilder(
          // future: ani.fetchCategoryData(),
          future: dataFunc,
          builder: (context, AsyncSnapshot snapshot) {
            return snapshot.hasData
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: SizedBox(
                          width: 100.0,
                          child: ListTile(
                            title: Image.network(
                              snapshot.data?[index].picture,
                              width: 100.0,
                              height: 80.0,
                            ),
                            subtitle: Container(
                              alignment: Alignment.topCenter,
                              child: Text(
                                snapshot.data?[index].name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const Center(
                    heightFactor: 0.3,
                    widthFactor: 0.3,
                    child: CircularProgressIndicator(),
                  );
            // child: ListView(
            //   scrollDirection: Axis.horizontal,
            //   children: const [
            //     Category(imageLocation: "images/a.jpg", imageCaption: "Zorro",),
            //     Category(imageLocation: "images/b.jpg", imageCaption: "Amit"),
            //     Category(imageLocation: "images/c.jpg", imageCaption: "Sanja"),
            //   ],
            // ),
          }),
    );
  }
}

// class Category extends StatelessWidget {
//   final String imageLocation;
//   final String imageCaption;
//   const Category(
//       {Key? key, required this.imageLocation, required this.imageCaption})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2.0),
//       child: InkWell(
//         onTap: () {},
//         child: Container(
//           width: 100.0,
//           child: ListTile(
//             title: Image.asset(
//               imageLocation,
//               width: 100.0,
//               height: 80.0,
//             ),
//             subtitle: Container(
//               alignment: Alignment.topCenter,
//               child: Text(
//                 imageCaption,
//                 style: const TextStyle(fontWeight: FontWeight.w600),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
