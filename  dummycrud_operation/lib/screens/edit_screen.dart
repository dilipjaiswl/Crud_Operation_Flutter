import 'package:flutter/material.dart';

class EditScreen extends StatefulWidget {
  final String name;
  final String mobile;
  final String imagePath;

  const EditScreen({
    super.key,
    required this.name,
    required this.mobile,
    required this.imagePath,
  });

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController nameController;
  late TextEditingController mobileController;
  late String imagePath;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.name);
    mobileController = TextEditingController(text: widget.mobile);
    imagePath = widget.imagePath; // Initialize with current image path
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Employee'),
        backgroundColor: Colors.greenAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Name TextField
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 20),

            // Mobile TextField
            TextField(
              controller: mobileController,
              decoration: const InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 20),

            // Image Picker (optional, you can later replace it with an actual image picker)
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(imagePath),
              backgroundColor: Colors.greenAccent,
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                // Return the updated data
                Navigator.pop(context, {
                  'name': nameController.text,
                  'mobile': mobileController.text,
                  'imagePath': imagePath, // Pass the updated image path if needed
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
