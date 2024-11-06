import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:providerapi/Ui/ProductDeatils.dart';
import 'package:providerapi/Ui/ProfilePage.dart';

import '../Provider/CategoryProvider.dart';
import '../Provider/product_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch categories when the screen is initialized
    Future.microtask(() =>
        Provider.of<ProductProvider>(context, listen: false).fetchProducts());
    Future.microtask(() => Provider.of<CategoryProvider>(context, listen: false)
        .fetchCategories());
  }

  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final categoryProvider = Provider.of<CategoryProvider>(context);
    return Scaffold(
      backgroundColor: Color(0xFF000B17),
      appBar: AppBar(
        backgroundColor: Color(0xFF000B17),
        title: Text(
          'ShopNexus',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: ElevatedButton(
                onPressed: (){
Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Profile()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.grey, shape: CircleBorder(), // Set the shape to CircleBorder for a circular button
                  padding: EdgeInsets.all(1), // Icon or text color
                ),
                child: CircleAvatar(radius: 30.r,backgroundImage: AssetImage("assets/demo.jpg"),)),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
            child: categoryProvider.isLoading
                ? Center(child: SizedBox())
                : categoryProvider.errorMessage != null
                    ? Center(child: Text(categoryProvider.errorMessage!))
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryProvider.categories.length,
                        itemBuilder: (context, index) {
                          final category = categoryProvider.categories[index];
                          return Padding(
                            padding: EdgeInsets.all(8.0.sp),
                            child: Container(
                              width: 60.w,
                              height: 10.h,
                              decoration: ShapeDecoration(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.r))),
                              child: Center(
                                child: Text(category.catName == null
                                    ? ''
                                    : category.catName.toString()),
                              ),
                            ),
                          );
                        },
                      ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Expanded(
              child: productProvider.isLoading
                  ? Center(child: CircularProgressIndicator())
                  : productProvider.errorMessage != null
                      ? Center(child: Text(productProvider.errorMessage!))
                      : SizedBox(
                          width: 389.w,
                          height: max(
                              0,
                              ((productProvider.products.length / 2).ceil() *
                                      (225.h + 20.0.h)) -
                                  20.0.h),
                          child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 18.0.w,
                              mainAxisSpacing: 20.0.h,
                              childAspectRatio: 185 / 225,
                              shrinkWrap: true,
                              children: List.generate(
                                productProvider.products.length,
                                (index) {
                                  final products =
                                      productProvider.products[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => Productdetails(
                                                  Productimage: products
                                                      .partImage
                                                      .toString(),
                                                  Productname: products
                                                      .partsName
                                                      .toString(),
                                                  rating: products.productRating
                                                      .toString(),
                                                  PriceOffer: products
                                                      .offerPrice
                                                      .toString(),
                                                  price:
                                                      products.price.toString(),
                                                  description: products
                                                      .description
                                                      .toString())));
                                    },
                                    child: Container(
                                      width: 185.w,
                                      height: 223.h,
                                      decoration: ShapeDecoration(
                                        gradient: LinearGradient(
                                          begin: Alignment(-5, 0.54),
                                          end: Alignment(0.54, -0.54),
                                          colors: [
                                            Color(0x1BFFFFFF),
                                            Color(0xFF000C1B)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1.w,
                                              color: Color(0xFF58606A)),
                                          borderRadius:
                                              BorderRadius.circular(10.r),
                                        ),
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                          Container(
                                            width: 177.w,
                                            height: 146.h,
                                            decoration: ShapeDecoration(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(8.r),
                                                  topRight:
                                                      Radius.circular(8.r),
                                                ),
                                              ),
                                            ),
                                            child: products.partImage != null
                                                ? ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r),
                                                    child: Image.network(
                                                      products.partImage
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  )
                                                : Placeholder(),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 9.w,
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Text(
                                                  products.partsName == null
                                                      ? ""
                                                      : products.partsName,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 1,
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                    color: Color(0xFFF7F5F2),
                                                    fontSize: 16.sp,
                                                    fontFamily: 'sfprodisplay',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 6.h,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 70.w,
                                                      child: Text(
                                                        products.price == null
                                                            ? ""
                                                            : "₹ ${products.price.toString()}",
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        textAlign:
                                                            TextAlign.start,
                                                        style: TextStyle(
                                                          color:
                                                              Color(0xFFF7F5F2),
                                                          fontSize: 13.sp,
                                                          fontFamily:
                                                              'sfprodisplay',
                                                          fontWeight:
                                                              FontWeight.w300,
                                                          letterSpacing: 0.50.w,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                RatingBar.builder(
                                                  itemSize: 16.sp,
                                                  tapOnlyMode: true,
                                                  initialRating: double.parse(
                                                      products.productRating
                                                          .toString()),
                                                  minRating: 1,
                                                  direction: Axis.horizontal,
                                                  allowHalfRating: true,
                                                  itemCount: 5,
                                                  itemBuilder: (context, _) =>
                                                      Icon(
                                                    Icons.star,
                                                    color: Colors.amber,
                                                  ),
                                                  onRatingUpdate: (rating) {
                                                    print(rating);
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              )))
              ),
        ],
      ),
    );
  }
}
