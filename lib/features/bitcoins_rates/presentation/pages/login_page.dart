import 'package:bitcoins/core/services/shared_preference_storage.dart';
import 'package:bitcoins/features/bitcoins_rates/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';

import '../../../../core/common/widgets/logos.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController userNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              bitcoinLogoBuilder(),
              const SizedBox(
                height: 60,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Form(
                    child: Column(
                  children: [
                    buildTextFormField(context,
                        controller: userNameController,
                        label: 'User Name',
                        hintText: 'Enter user name')
                  ],
                )),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0, backgroundColor: Colors.blue),
                      onPressed: () {
                        _saveUserName(context);
                      },
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ))),
            ],
          ),
        ),
      )),
    );
  }

  _saveUserName(context) async {
    final localStorage = SharedPreferencesLocalStorage.instance;
    await localStorage.setStringValue('user_name', userNameController.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }

  TextFormField buildTextFormField(context,
      {required TextEditingController controller,
      required String label,
      required String hintText}) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter user name';
        }
        return null;
      },
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)),
          hintText: hintText,
          hintStyle: Theme.of(context).textTheme.bodyMedium,
          filled: true,
          label: Text(
            label,
            style: Theme.of(context).textTheme.bodyLarge,
          )),
    );
  }
}
