import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_svg/flutter_svg.dart'; 



class SalesAnalyticsScreen extends StatelessWidget {
  const SalesAnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sales Analytics"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Select Period", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ChoiceChip(label: Text("Today"), selected: false),
                  SizedBox(width: 8),
                  ChoiceChip(label: Text("This Week"), selected: true),
                  SizedBox(width: 8),
                  ChoiceChip(label: Text("This Month"), selected: false),
                  SizedBox(width: 8),
                  ChoiceChip(label: Text("Custom"), selected: false),
                ],
              ),
            ),
            SizedBox(height: 16),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard("₹45,280", "Total Sales", Icons.account_balance_wallet, Colors.blue),
                _buildInfoCard("324", "Total Orders", Icons.shopping_cart, Colors.green),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildInfoCard("₹139.75", "Avg. Order", Icons.bar_chart, Colors.orange),
                _buildInfoCard("189", "Active Users", Icons.people, Colors.purple),
              ],
            ),
            
            SizedBox(height: 20),
            Text("Sales Trend", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Container(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1500),
                        FlSpot(1, 1200),
                        FlSpot(2, 3000),
                        FlSpot(3, 3500),
                        FlSpot(4, 4500),
                        FlSpot(5, 3900),
                        FlSpot(6, 4200),
                      ],
                      isCurved: true,
                      color: Colors.green,
                      barWidth: 3,
                      isStrokeCapRound: true,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
            Text("Sales by Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildCategoryBar("Vegetables", 30),
            _buildCategoryBar("Fruits", 20),
            _buildCategoryBar("Groceries", 15),
            _buildCategoryBar("Dry Fruits", 10),

            SizedBox(height: 20),
            Text("Top Selling Products", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            _buildProductTile("Organic Tomatoes", "₹12,480", "324 sales", "assets/Tomato.svg"),
            _buildProductTile("Fresh Apples", "₹8,960", "256 sales", "assets/Apple.svg"),
            _buildProductTile("Cashew Nuts", "₹7,920", "198 sales", "assets/cashew.svg"),

            SizedBox(height: 20),
            

            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.download, color: Colors.white),
                  SizedBox(width: 8),
                  Text("Export Data", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
        ]
      ),
    );
  }

  Widget _buildInfoCard(String value, String title, IconData icon, Color color) {
    return Expanded(
      child: Card(
        // ignore: deprecated_member_use
       // color: color.withOpacity(0.1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(icon, size: 30, color: color),
              SizedBox(height: 8),
              Text(value, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
              Text(title, style: TextStyle(color: Colors.black54)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryBar(String category, double percentage) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(category),
          SizedBox(width: 10),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(5),
              ),
              width: percentage * 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductTile(String name, String price, String sales, String imagePath) {
  bool isSvg = imagePath.endsWith(".svg");

  return ListTile(
    leading: isSvg
        ? SvgPicture.asset(imagePath, width: 40, height: 40)
        : Image.asset(imagePath, width: 40, height: 40, fit: BoxFit.cover),
    title: Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
    subtitle: Text(sales),
    trailing: Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
  );
}
}