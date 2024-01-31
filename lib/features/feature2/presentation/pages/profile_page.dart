import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});
  static String path = "/profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile Page"),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            pickImageFromCamera();
          },
          child: const CircleAvatar(
            radius: 100,
          ),
        ),
      ),
    );
  }

  void pickImageFromCamera() async {
    final ImagePicker _picker = ImagePicker();
    XFile? pickedImage = await _picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      final path = pickedImage.path;
    }
  }
}
