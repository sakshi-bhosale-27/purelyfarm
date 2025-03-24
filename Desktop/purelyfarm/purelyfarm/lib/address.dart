import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddAddressScreen extends StatefulWidget {
  const AddAddressScreen({super.key});

  @override
 State createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  late GoogleMapController mapController;
  LatLng selectedLocation = LatLng(18.5204, 73.8567); // Default Pune location

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _updateLocation(LatLng newLocation) {
    setState(() {
      selectedLocation = newLocation;
    });
  }

  TextEditingController houseController = TextEditingController();
  TextEditingController buildingController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  String selectedLabel = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text("Add Address Details")),
      body: Column(
        children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target: selectedLocation,
                    zoom: 15,
                  ),
                  markers: {
                    Marker(
                      markerId: MarkerId("selected-location"),
                      position: selectedLocation,
                      draggable: true,
                      onDragEnd: _updateLocation,
                    ),
                  },
                  onTap: _updateLocation,
                ),
                Positioned(
                  top: 10,
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    color: Colors.black87,
                    child: Text(
                      "Order will be delivered here\nPlace the pin to your exact location",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Industrial Area, Mokarwadi, Pune"),
                SizedBox(height: 10),
                Container(
                  height:50,
                  width:200,
                  child: TextField(
                    controller: houseController,
                    decoration: InputDecoration(labelText: "House No. & Floor *"),
                  ),
                ),
                Container(
                  height:50,
                  width:200,

                  child: TextField(
                    controller: buildingController,
                    decoration: InputDecoration(labelText: "Building & Block No. (Optional)"),
                  ),
                ),
                Container(
                  height:50,
                  width:200,
                  child: TextField(
                    controller: landmarkController,
                    decoration: InputDecoration(labelText: "Landmark & Area Name (Optional)"),
                  ),
                ),
                SizedBox(height: 20),
                Text("Add Address Label"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: ["Home", "Work", "Other"].map((label) {
                    return ChoiceChip(
                      label: Text(label),
                      selected: selectedLabel == label,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedLabel = selected ? label : "";
                        });
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: houseController.text.isNotEmpty
                      ? () {
                          // Save address logic
                        }
                      : null,
                  child: Text("Save Address"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}