// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class Productdeatils extends StatefulWidget {
//   const Productdeatils({super.key});
//
//   @override
//   State<Productdeatils> createState() => _ProductdeatilsState();
// }
//
// class _ProductdeatilsState extends State<Productdeatils> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF000B17),
//       appBar: AppBar(
//         backgroundColor: Color(0xFF000B17),
//         foregroundColor: Colors.white,
//       ),
//       body: Column(
//         children: [
//           Container(
//             width: double.infinity.w,
//             height: 254.h,
//             decoration: ShapeDecoration(color: Colors.white,
//               image: DecorationImage(
//                 image: NetworkImage("widget.carphoto[itemIndex]"),
//                 fit: BoxFit.cover,
//               ),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(4.r)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class Productdetails extends StatefulWidget {
   final String Productimage;
   final String Productname;
   final String rating;
   final String PriceOffer;
   final String price;
   final String description;

  const Productdetails(
      {super.key,
         required this.Productimage,
         required this.Productname,
         required this.rating,
         required this.PriceOffer,
         required this.price,
         required this.description,
      });

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF000B17),
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Container(
            width: 24.w,
            height: 24.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(),
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
            widget.Productname == "null"
              ? ""
              : widget.Productname,
          style: TextStyle(
            color: Color(0xFFF7F5F2),
            fontSize: 24.sp,
            fontFamily: 'sfprodisplay',
            fontWeight: FontWeight.w600,
            letterSpacing: 0.24.w,
          ),
        ),
      ),
      backgroundColor: Color(0xFF000B17),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity.w,
                  height: 313.h,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomRight,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xFF000B17),
                        Color(0x6FFFFFFF),
                        Color(0x89000B17)
                      ],
                    ),
                  ),
                  child: Container(
                          width: 315.w,
                          height: 254.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.Productimage
                              ),
                              fit: BoxFit.cover,
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.r)),
                          ),
                        ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.Productname == "null"
                            ? ""
                            : widget.Productname,

                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Color(0xFFF7F5F2),
                          fontSize: 20.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      Row(
                        children: [
                          RatingBar.builder(
                            unratedColor: Colors.grey,
                            itemSize: 20.sp,
                            initialRating: double.parse(widget.rating),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            //  itemPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          SizedBox(
                            width: 13.w,
                          ),
                          Text(
                            widget.rating,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Color(0xFFF7F5F2),
                              fontSize: 16.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h,),
                      Row(
                        children: [
                          Text(
                            "₹ ${widget.price}",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(width: 5.w,),  Text(
                            widget.PriceOffer != "null" ?
                            "₹ ${widget.PriceOffer}":"",
                            textAlign: TextAlign.start,
                            style: TextStyle(decoration: TextDecoration.lineThrough,
                              color: Colors.white,
                              fontSize: 17.sp,
                              fontFamily: 'sfprodisplay',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 29.h,
                      ),
                      Text(
                        'Product Description',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontFamily: 'sfprodisplay',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        child: Text(
                          widget.description,
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontFamily: 'sfprodisplay',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
         Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 430.w,
                height: 99.h,
                decoration: ShapeDecoration(
                  color: Color(0x82C2C2C2).withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.r),
                      topRight: Radius.circular(16.r),
                    ),
                  ),
                ),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                            Text(
                               "₹ ${widget.price}",
                              style: TextStyle(
                                color: Color(0xFF000B17),
                                fontSize: 20.sp,
                                fontFamily: 'sfprodisplayy',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          width: 213.w,
                          height: 50.h,
                          decoration: ShapeDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFFFF0C9),
                                Color(0xFFFFCE50),
                              ],
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Order Now',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20.sp,
                                fontFamily: 'sfprodisplayy',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}