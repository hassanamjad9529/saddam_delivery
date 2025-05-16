import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_standard/app/components/global-widgets/search_text_field.dart';
import 'package:getx_standard/app/modules/dashbaord/views/home_tabs/orders_tab.dart';
import 'package:getx_standard/app/modules/dashbaord/views/home_tabs/table_all_shipmnet_tab.dart';
import 'package:getx_standard/config/theme/light_theme_colors.dart';
import 'package:getx_standard/utils/app_spacer.dart';
import 'package:getx_standard/utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this, initialIndex: 1);
    _tabController.addListener(() {});
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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
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
                dividerColor: Colors.transparent,
                splashFactory: NoSplash.splashFactory,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.black,
                controller: _tabController,
                tabAlignment: TabAlignment.center,
                indicatorColor: LightThemeColors.indicatorColor,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            DashboardImages.ordersTabPng,
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
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            DashboardImages.tableAllShipmentTabPng,
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
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            DashboardImages.shipInstantTabPng,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Shipment Instant",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Tab(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            DashboardImages.supportTabPng,
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Support",
                            style: TextStyle(
                                fontSize: 10.sp, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
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
          OrdersTab(searchController: _searchController),
          TableAllShipmentTab(),
          const Center(child: Text("Shipment Instant Tab Content Here")),
          const Center(child: Text("Support Tab Content Here")),
        ],
      ),
    );
  }
}
