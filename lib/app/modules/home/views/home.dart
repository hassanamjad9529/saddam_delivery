import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:getx_standard/app/components/global-widgets/my_buttons.dart';
import 'package:getx_standard/app/components/global-widgets/search_text_field.dart';
import 'package:getx_standard/app/modules/home/widgets/balance_card.dart';
import 'package:getx_standard/app/modules/home/widgets/driver_balance_card.dart';
import 'package:getx_standard/app/modules/home/widgets/stat_card.dart';
import 'package:getx_standard/config/theme/light_theme_colors.dart';
import 'package:getx_standard/config/theme/my_fonts.dart';
import 'package:getx_standard/utils/app_spacer.dart';
import 'package:getx_standard/utils/constants.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with SingleTickerProviderStateMixin {
  int _selectedIndex = 1; // Start with Home tab selected
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index + 1;
      });
    });
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Statistics",
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold)),
          AppSpacer(heightRatio: 1),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1.6,
            children: [
              StatCard(
                title: "Shipment   ",
                subtitle: "28 Shipment",
                AssetPath: DashboardImages.truckPng,
                ColorContainer: Color(0xfff5b849),
              ),
              StatCard(
                title: "In Progress",
                subtitle: "28 Shipment",
                AssetPath: DashboardImages.inProgressPng,
                ColorContainer: Color(0xff3f51b7),
              ),
              StatCard(
                title: "Delivered   ",
                subtitle: "28 Shipment",
                AssetPath: DashboardImages.deliveredPng,
                ColorContainer: Color(0xff3272b1),
              ),
              StatCard(
                title: "Cancelled",
                subtitle: "28 Shipment",
                AssetPath: DashboardImages.cancelledPng,
                ColorContainer: Color(0xffe6533c),
              ),
            ],
          ),
          const SizedBox(height: 24),
          BalanceCard(
              amount: "60.00 JOD",
              label: "Total balance of shipments accrued",
              AssetPath: DashboardImages.walletPng),
          const SizedBox(height: 16),
          DriverBalanceCard(
              amount: "8.25 JOD",
              label: "Driver balance is due",
              isPositive: true),
          const SizedBox(height: 8),
          DriverBalanceCard(
              amount: "8.25 JOD",
              label: "Driver balance is due",
              isPositive: false),
        ],
      ),
    );
  }

  Widget _buildOrdersTab() {
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Sort by"),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_drop_down, size: 20),
                        ],
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Filter by"),
                          SizedBox(width: 4),
                          Icon(Icons.arrow_drop_down, size: 20),
                        ],
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

  late final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightThemeColors.scaffoldBackgroundColor,
      appBar: AppBar(
        surfaceTintColor: LightThemeColors.backgroundColor,
        backgroundColor: LightThemeColors.backgroundColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            DashboardImages.bIconPng,
            width: 25.w,
            height: 25.h,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              DashboardImages.notificationIconPng,
              width: 25.w,
              height: 25.h,
            ),
          ),
        ],
        title: FittedBox(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 1),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF26BDD7), Color(0xFF3D52B6)],
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  Image.asset(
                    DashboardImages.avatarPng,
                  ),
                  const AppSpacer(widthRatio: 0.5),
                  Text(
                    "Rank 5",
                    style: TextStyle(fontSize: 12.sp),
                  ),
                ],
              ),
            ),
          ),
        ),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(95.h),
          child: Column(
            children: [
              AppSpacer(heightRatio: 0.5),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
              AppSpacer(heightRatio: 0.5),
              TabBar(
                controller: _tabController,
                tabAlignment: TabAlignment.center,
                indicatorColor: LightThemeColors.indicatorColor,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          DashboardImages.avatarPng,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Orders",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          DashboardImages.avatarPng,
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          "Table All Shipment",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.list),
                        SizedBox(width: 8),
                        Text(
                          "Shipment Instant",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.person),
                        SizedBox(width: 8),
                        Text(
                          "Support",
                          style: TextStyle(
                              fontSize: 10.sp, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildOrdersTab(),
          _buildHomeTab(),
          const Center(child: Text("Shipment Instant Tab Content Here")),
          const Center(child: Text("Support Tab Content Here")),
        ],
      ),
    );
  }
}
