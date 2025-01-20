import 'package:flutter/material.dart';
import 'edit_screen.dart'; // Import the EditScreen

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> employeeNames = [
      "Dilip", "Rajesh", "Bharat", "Sanket", "Chinampa", "Monu",
      "Anil", "Sunil", "Asuman", "Abhinav", "Shubha", "Aadarsh",
      // Add more names if needed
    ];

    List<String> employeeMobiles = [
      "1234567890", "9876543210", "1122334455", "9988776655", "7766554433",
      "6655443322", "5544332211", "4433221100", "3322110099", "2211009988",
      "1231231234", "4564564567", "7897897890", // Add corresponding mobile numbers
    ];

    // Placeholder for images
    List<String> employeeImages = List.generate(
      12, (index) => 'assets/images/avatar2.png', // Placeholder images
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: const Center(
          child: Text('DashBoard'),
        ),
      ),
      body: ListView.separated(
        itemCount: employeeNames.length,
        separatorBuilder: (context, index) {
          return const Divider(height: 10, thickness: 2);
        },
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            shadowColor: Colors.deepOrangeAccent.shade400,
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(employeeImages[index]),
                maxRadius: 40,
              ),
              title: Text(employeeNames[index]),
              subtitle: Text(employeeMobiles[index]),
              trailing: IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () async {
                  // Navigate to EditScreen and pass the current employee details
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditScreen(
                        name: employeeNames[index],
                        mobile: employeeMobiles[index],
                        imagePath: employeeImages[index],
                      ),
                    ),
                  );

                  // If updated data is returned, update the employee list
                  if (result != null) {
                    employeeNames[index] = result['name'];
                    employeeMobiles[index] = result['mobile'];
                    employeeImages[index] = result['imagePath'];
                    (context as Element).markNeedsBuild(); // Rebuild the widget
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

/*
import 'package:flutter/material.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> employeeName = [
      "Dilip",
      "Rajesh",
      "Bharat",
      "Sanket",
      "Chinampa",
      "Monu",
      "Anil",
      "Sunil",
      "Asuman",
      "Abhinav",
      "Dilip",
      "Rajesh",
      "Bharat",
      "Sankey",
      "Chinampa",
      "Shubha",
      "Anil",
      "Sunil",
      "Asuman",
      "Abhinav",
      "Abhinav",
      "Dilip",
      "Rajesh",
      "Bharat",
      "Aadarsh",
      "Chittaa",
      "Shubha",
      "Anil",
      "Sunil",
      "Asuman",
      "Abhinav"
    ];
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Center(
            child: const Text(
              'DashBoard',
            ),
          )),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              shadowColor: Colors.deepOrangeAccent.shade400,
              child: ListTile(
                leading: const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/avatar2.png'),
                  maxRadius: 40,
                  backgroundColor: Colors.greenAccent,
                  //  child: Text("DJ",style: TextStyle(color: Colors.white),),
                ),
                title: Text(employeeName[index],style: const TextStyle(
                 // fontFamily: "FontMain",
                ),),
                subtitle: const Text("Mobile No"),
                trailing: const Icon(Icons.edit),
              ),
            );
          },
          itemCount: employeeName.length,
          separatorBuilder: (BuildContext context, int index) {
            return const Divider(
              height: 10,
              thickness: 2,
            );
          }),
    );
  }
}*/
