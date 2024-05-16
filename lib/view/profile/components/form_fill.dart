import 'package:coffee_ui/api/StaffController.dart';
import 'package:coffee_ui/entity/response/StaffResponse.dart';
import 'package:flutter/material.dart';

class FormProfile extends StatefulWidget {
  final StaffResponse? staffInfo;
  FormProfile({super.key, required this.staffInfo});

  @override
  _FormProfileState createState() => _FormProfileState();
}
class _FormProfileState extends State<FormProfile> {

  final TextEditingController fstNameController = TextEditingController();
  final TextEditingController lstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.staffInfo != null && widget.staffInfo!.result != null) {
      fstNameController.text = widget.staffInfo!.result!.firstName ?? '';
      lstNameController.text = widget.staffInfo!.result!.lastName ?? '';
      emailController.text = widget.staffInfo!.result!.email ?? '';
      phoneController.text = widget.staffInfo!.result!.phoneNumber ?? '';
      addressController.text = widget.staffInfo!.result!.address ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: fstNameController,
                    decoration: const InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.text_fields),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 10), // Add some spacing between the fields
                Expanded(
                  child: TextFormField(
                    controller: lstNameController,
                    decoration: const InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.text_fields),
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.email),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: addressController,
              decoration: const InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.location_city),
                fillColor: Colors.white,
                filled: true,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                try {
                  await StaffAPI.updateInfo(
                      fstNameController.text,
                      lstNameController.text,
                      addressController.text,
                      phoneController.text,
                      emailController.text
                  );
                } catch (e) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Notice'),
                        content: Text(e.toString()),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Close'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
                child: const Center(
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}