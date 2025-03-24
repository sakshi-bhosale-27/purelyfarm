import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SalesProfileScreen extends StatelessWidget {
  const SalesProfileScreen({super.key});

  @override
Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Top Blue Header
                Container(
                  height: 175, // Adjust height to match AppBar
                  //width: MediaQuery.of(context).size.width,
                  color: const Color.fromARGB(255, 33, 82, 243),
                ),
                // Expanded Section with Scrollable Content
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.only(top: 80, left: 16, right: 16, bottom: 16), // Space below overlapping card
                    children: [
                       // SizedBox(height: 120),
                      _buildSection(context,icon: Icons.business, 'Business Details', [
                        _buildDetailRow('Business Type', 'Electronics and Technology'),
                        _buildDetailRow('Shop Name', 'Tech Supplies Co.'),
                        _buildDetailRow('GST Number', '29ABCDE1234F1Z5'),
                        _buildDetailRow('PAN', 'ABCDE1234F'),
                      ]),
                      SizedBox(height: 12),
                      _buildSection(context,icon: Icons.phone, 'Contact Details', [
                        _buildDetailRow('Email', 'contact@techsupplies.com', icon: Icons.email),
                        _buildDetailRow('Phone', '+1 (555) 123-4567', icon: Icons.phone),
                      ]),
                      SizedBox(height: 12),
                      _buildSection(context,icon: Icons.location_on, 'Address', [
                        _buildDetailRow("", '123 Tech Street, Silicon Valley, California, United States 94025'),
                      ]),
                      SizedBox(height: 12),
                      _buildSection(context,icon: Icons.account_balance, 'Bank Details', [
                        _buildDetailRow('Account Holder', 'Tech Supplies Co.'),
                        _buildDetailRow('Bank Name', 'Silicon Valley Bank'),
                        _buildDetailRow('Account Number', 'XXXX XXXX 1234'),
                        _buildDetailRow('IFSC Code', 'SVBK0001234'),
                      ]),
                      SizedBox(height: 12),
                      _buildSection(context,icon: Icons.verified, "Verification Status", [
                        _buildVerificationStatus(),
                      ]),
                    ],
                  ),
                ),
              ],
            ),
            // Overlapping Card
            Positioned(
              top: 120, // Adjust based on overlap
              left: 10,
              right: 10,
              child: _buildCard(context),
            ),
            // Header (Company Name + Icon)
            Positioned(
              top: 50, // Adjust this to match AppBar position
              left: 20,
              child: _buildHeader(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsColumn(IconData icon, String value, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, size: 30, color: Color.fromARGB(255, 33, 82, 243)), // Blue icon
      SizedBox(height: 4),
      Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      Text(label, style: TextStyle(fontSize: 14,  fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 114, 113, 113))),
    ],
  );
}

 Widget _buildHeader() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Ensures spacing
    children: [
      Row( // Wrap existing widgets in a row
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.white,
            child: Icon(Icons.store, color: Color.fromARGB(255, 33, 82, 243), size: 30),
          ),
          SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tech Supplies Co.',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    'Electronics Store',
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  SizedBox(width: 8),
                  _buildStatusBadge(true), // Pass 'false' for Pending
                ],
              ),
            ],
          ),
        ],
      ),
      SizedBox(width:60),
      IconButton( // Menu Icon
        icon: Icon(Icons.more_vert, color: Colors.white),
        onPressed: () {
          // TODO: Handle menu click
          print("Menu Clicked");
        },
      ),
    ],
  );
}


Widget _buildStatusBadge(bool isVerified) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: isVerified ? Colors.green : Colors.orange,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isVerified ? Icons.verified : Icons.info,
          color: Colors.white,
          size: 16,
        ),
        SizedBox(width: 4),
        Text(
          isVerified ? 'Verified' : 'Pending',
          style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}


// Updated Overlapping Card
Widget _buildCard(BuildContext context) {
  return Container(
    width: MediaQuery.of(context).size.width - 32, // Ensure it matches _buildSection
    child: Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16), // Removed horizontal padding
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatsColumn(Icons.shopping_bag, '1,234', 'Orders'),
            Container(height: 50, width: 1, color: Colors.grey[300]), // Divider
            _buildStatsColumn(  FontAwesomeIcons.chartLine, '\$50,000', 'Revenue'),
          ],
        ),
      ),
    ),
  );
}

  

  // Updated Section Card
Widget _buildSection(BuildContext context, String title, List<Widget> children, {required IconData icon}) {
  return Container(
    width: MediaQuery.of(context).size.width - 32, // Ensures it matches _buildCard
    child: Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: Colors.blueAccent),
                SizedBox(width: 5),
                Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    ),
  );
}


  Widget _buildDetailRow(String title, String value, {IconData? icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start, // Ensures proper top alignment
      children: [
        if (icon != null) ...[
          Icon(icon, size: 20, color: Colors.blueAccent),
          SizedBox(width: 12),
        ],
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (title.isNotEmpty) ...[
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                ),
                SizedBox(height: 4),
              ],
              Text(
                value,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}



  Widget _buildVerificationStatus() {
    return Card(
      color: Color.fromARGB(255, 205, 248, 227),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(Icons.verified, color: Colors.green),
            SizedBox(width: 10),
            Text('Verified Supplier', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
