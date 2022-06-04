import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/resources/auth_methods.dart';
import 'package:instagram/responsive/mobile_screen_layout.dart';
import 'package:instagram/responsive/responsive_layout_screen.dart';
import 'package:instagram/responsive/web_screen_layout.dart';
import 'package:instagram/utils/color.dart';
import 'package:instagram/widgets/text_field_widget.dart';
import '../utils/utils.dart';
import '';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();

  Uint8List? _image;
  bool isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passController.dispose();
    _bioController.dispose();
    _userNameController.dispose();
  }

  void signupUser() async {
    setState(() {
      isLoading = true;
    });
    String res = await AuthMethods().signupUser(
      email: _emailController.text,
      password: _passController.text,
      userName: _userNameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    setState(() {
      isLoading = false;
    });
    if (res != 'successs') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => ResponsiveLayoutScreen(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout())));
    }
    print(res);
  }

  void navigateToLogin() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Signup()));
  }

  void selectImage() async {
    Uint8List image = await pickImage(ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                SvgPicture.asset(
                  "assets/ic_instagram.svg",
                  color: primaryColor,
                  height: 50,
                ),
                SizedBox(
                  height: 40,
                ),
                Stack(
                  children: [
                    _image != null
                        ? CircleAvatar(
                            radius: 60,
                            backgroundImage: MemoryImage(_image!),
                          )
                        : CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(
                              "https://media.istockphoto.com/photos/kitten-picture-id185304274?k=20&m=185304274&s=612x612&w=0&h=TN3atnMpm434a01-r6IrViPTE3b9XGGUynBsftJdsTU=",
                            ),
                          ),
                    Positioned(
                        bottom: -10,
                        left: 80,
                        child: IconButton(
                            onPressed: () {
                              selectImage();
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            )))
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                //user Name
                TextFieldWidget(
                    textEditingController: _userNameController,
                    hintText: 'Enter your User Name',
                    textInputType: TextInputType.text),
                SizedBox(
                  height: 20,
                ),
                //Email
                TextFieldWidget(
                    textEditingController: _emailController,
                    hintText: 'Enter email',
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    textEditingController: _bioController,
                    hintText: 'Enter bio',
                    textInputType: TextInputType.emailAddress),
                SizedBox(
                  height: 20,
                ),
                //Password
                TextFieldWidget(
                  textEditingController: _passController,
                  hintText: 'Enter Password',
                  textInputType: TextInputType.emailAddress,
                  isPass: true,
                ),
                SizedBox(
                  height: 30,
                ),
                //login Button
                InkWell(
                  onTap: signupUser,
                  child: Container(
                    height: 45,
                    child: isLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: primaryColor,
                          ))
                        : const Text(
                            "Signup",
                            style: TextStyle(),
                          ),
                    width: double.infinity,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: ShapeDecoration(
                        color: blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //dont have an account? signup
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Text("Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      padding: EdgeInsets.symmetric(vertical: 8),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: navigateToLogin,
                      child: Container(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    )
                  ],
                ),
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
