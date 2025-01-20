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
                  backgroundImage: AssetImage('assets/image/avatar2.png'),
                  maxRadius: 40,
                  backgroundColor: Colors.greenAccent,
                  //  child: Text("DJ",style: TextStyle(color: Colors.white),),
                ),
                title: Text(employeeName[index],style: const TextStyle(
                  fontFamily: "FontMain",
                ),),
                subtitle: const Text("Mobile No"),
                trailing: const Icon(Icons.add_ic_call_sharp),
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
}