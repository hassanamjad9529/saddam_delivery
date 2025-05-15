import 'package:flutter/material.dart';

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
  }

  void _onBottomNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildHomeTab() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Statistics",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _buildStatCard("Shipment", "28 Shipment", Icons.local_shipping,
                  Colors.orange),
              _buildStatCard(
                  "In Progress", "28 Shipment", Icons.sync, Colors.indigo),
              _buildStatCard(
                  "Delivered", "28 Shipment", Icons.inventory_2, Colors.blue),
              _buildStatCard(
                  "Cancelled", "28 Shipment", Icons.cancel, Colors.red),
            ],
          ),
          const SizedBox(height: 24),
          _buildBalanceCard("60.00 JOD", "Total balance of shipments accrued",
              Icons.account_balance_wallet),
          const SizedBox(height: 16),
          _buildDriverBalanceCard("8.25 JOD", "Driver balance is due", true),
          const SizedBox(height: 8),
          _buildDriverBalanceCard("8.25 JOD", "Driver balance is due", false),
        ],
      ),
    );
  }

  Widget _buildStatCard(
      String title, String subtitle, IconData icon, Color color) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 12),
          Text(title,
              style: TextStyle(
                  fontSize: 16, fontWeight: FontWeight.bold, color: color)),
          Text(subtitle, style: const TextStyle(color: Colors.black54)),
        ],
      ),
    );
  }

  Widget _buildBalanceCard(String amount, String label, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient:
            LinearGradient(colors: [Colors.blueAccent, Colors.lightBlueAccent]),
      ),
      child: Row(
        children: [
          Icon(icon, size: 40, color: Colors.white),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(amount,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              Text(label, style: const TextStyle(color: Colors.white70)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDriverBalanceCard(String amount, String label, bool isPositive) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 6)],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isPositive ? Icons.trending_up : Icons.trending_down,
                color: isPositive ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 8),
              Text(amount, style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Text("View all",
              style: TextStyle(color: isPositive ? Colors.green : Colors.red)),
        ],
      ),
    );
  }

  Widget _buildTabBody() {
    switch (_selectedIndex) {
      case 1:
        return _buildHomeTab();
      default:
        return const Center(child: Text("Other Tab Content Here"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: TabBar(
            controller: _tabController,
            isScrollable: true,
            tabs: const [
              Tab(icon: Icon(Icons.list), text: "Orders"),
              Tab(icon: Icon(Icons.table_chart), text: "Table all Shipment"),
              Tab(icon: Icon(Icons.flash_on), text: "Shipment Instant"),
              Tab(icon: Icon(Icons.support_agent), text: "Support"),
            ],
          ),
        ),
      ),
      body: _buildTabBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onBottomNavTapped,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet), label: 'Wallet'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: 'Profile'), // duplicate for now
        ],
      ),
    );
  }
}
