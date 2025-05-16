import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_standard/app/components/global-widgets/my_buttons.dart';
import 'package:getx_standard/app/components/global-widgets/search_text_field.dart';
import 'package:getx_standard/config/theme/light_theme_colors.dart';
import 'package:getx_standard/utils/app_spacer.dart';
import 'package:getx_standard/utils/constants.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({
    super.key,
    required TextEditingController searchController,
  }) : _searchController = searchController;

  final TextEditingController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Order: 23",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 200.w,
                child: SearchTextField(
                  textEditingController: _searchController,
                  submit: (value) {
                    // handle submit
                  },
                  clearing: () {
                    _searchController.clear();
                    // handle clear
                  },
                  hint: 'Search',
                  isClearButtonVisible: false,
                  isSearchButtonVisible: true,
                ),
              ),
            ],
          ),
          AppSpacer(heightRatio: 0.5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Select Status",
                style: TextStyle(
                  fontSize: 12.sp,
                ),
              ),
              Spacer(),
              Row(
                children: [
                  SizedBox(
                    height: 30.h,
                    width: 95.w,
                    child: ElevatedButton(
                      onPressed: () {
                        // handle filter
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LightThemeColors.primaryColorBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        alignment: Alignment.center,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sort by",
                              style: TextStyle(
                                height:
                                    1.0, // Ensures vertical centering of the text
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  SizedBox(
                    height: 30.h,
                    child: ElevatedButton(
                      onPressed: () {
                        // handle filter
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: LightThemeColors.primaryColorBlue,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        alignment: Alignment.center,
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Filter by",
                              style: TextStyle(
                                height:
                                    1.0, // Ensures vertical centering of the text
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(Icons.arrow_drop_down, size: 20),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          AppSpacer(heightRatio: 1),
          Card(
            color: Colors.white,
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 65.h,
                        width: 65.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: LightThemeColors.primaryColorBlue,
                          shape: BoxShape.rectangle,
                        ),
                        child: Center(
                          child: Image.asset(
                            DashboardImages.orderVanPng,
                            height: 40.h,
                            width: 40.w,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "NOB-69",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Recipient number: 077987865",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.grey),
                            ),
                            Text(
                              "Date: 2 June",
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pending",
                            style: TextStyle(
                              color: LightThemeColors.primaryColorBlue,
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 2),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Color(0xffe6533c),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "UNACCOUNTED",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  AppSpacer(heightRatio: 1),
                  PrimaryButton(
                    title: "View Full Order",
                    onPressed: () {},
                    inactive: false,
                  )
                ],
              ),
            ),
          ),
          AppSpacer(heightRatio: 1),
        ],
      ),
    );
  }
}
