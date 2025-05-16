
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:getx_standard/app/modules/home/widgets/balance_card.dart';
import 'package:getx_standard/app/modules/home/widgets/driver_balance_card.dart';
import 'package:getx_standard/app/modules/home/widgets/stat_card.dart';
import 'package:getx_standard/utils/app_spacer.dart';
import 'package:getx_standard/utils/constants.dart';

class TableAllShipmentTab extends StatelessWidget {
  const TableAllShipmentTab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
}
