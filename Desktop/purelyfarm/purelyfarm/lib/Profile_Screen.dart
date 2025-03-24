import 'package:flutter/material.dart';
import 'package:purelyfarm/Sales_Profile.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {},
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                        'My Account',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 16),
              Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.green.shade100,
                    child: Icon(Icons.person, size: 40, color: Colors.green),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     
                      Text(
                        'Jon Doe',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '9988776655',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset("assets/gift.png",
                            height:40,
                            width:40,
                            ),
                            const SizedBox(width:10),
                            Text(
                              'View Rewards and Balance',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(height:10),
                        Row(
                          children: [
                            Text(
                              'Your Gifts 0',
                              style: TextStyle(color: Colors.grey),
                            ),
                          
                     const SizedBox(width:120),
                    Container(
                      height:30,
                      width:130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color:Colors.green)),
                 

                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text('See Reward',style:TextStyle(color:Colors.green)),
                      ),
                    ),
                     ],
                    ),
                    ],
                        ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your Information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              _buildListTile(context,"assets/order.png", 'Your Orders'),
              _buildListTile(context,"assets/customer-service.png", 'Customer Support & FAQ'),
              _buildListTile(context,"assets/location-pin.png", 'Address'),
              _buildListTile(context,"assets/return.png", 'Refund'),
              _buildListTile(context,"assets/medal.png", 'Reward'),
              _buildListTile(context,"assets/list.png", 'About us'),
              SizedBox(height: 30),
              Center(
                child: Container(
                  height:40,
                  width:140,
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(8),
                    border: Border.all(color:Colors.red)),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      foregroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                     // padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    ),
                    child: Text('Log Out'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context ,String imagepath, String title) {
    return ListTile(
      leading: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.grey.shade200,
        child: Image.asset(imagepath,),
      ),
      title: Text(title, style: TextStyle(fontSize: 16)),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: () {
      Navigator.push(context,MaterialPageRoute(builder: (context) => SalesProfileScreen(),));
      },
    );
  }
}
