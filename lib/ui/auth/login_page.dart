// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:rover/core/enum/custom_text_size.dart';
// import 'package:rover/core/widget/custom_text.dart';
// import 'package:rover/core/widget/custom_text_field.dart';



// class LoginPage extends StatelessWidget {
//   LoginPage({Key? key}) : super(key: key);

//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController passwordRetryController = TextEditingController();


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
     
//       body: Form(
//         key: _formKey,
//         child: Padding(
//           padding: EdgeInsets.all(16.0.w),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
           
//                  CustomText(
//                   text: _loginStore.signState == SignState.signin
//                       ? "Sign in to your account"
//                       : "Sign Up",
//                   textSize: CustomTextSize.headline1,
//                 ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomTextFormField(
//                 labelText: 'E-mail',
//                 controller: emailController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }

//                   return null;
//                 },
//               ),
//               SizedBox(
//                 height: 10.h,
//               ),
//               CustomTextFormField(
//                 labelText: 'Password',
//                 obscureText: true,
//                 controller: passwordController,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter some text';
//                   }

//                   return null;
//                 },
//               ),
//               Observer(builder: (_) {
//                 if (_loginStore.signState == SignState.signin) {
//                   return SizedBox.shrink();
//                 } else {
//                   return CustomTextFormField(
//                     labelText: 'Password Retry',
//                     obscureText: true,
//                     controller: passwordRetryController,
//                     validator: (value) {
//                       if ((value == null || value.isEmpty) &&
//                           _loginStore.signState == SignState.signup) {
//                         return 'Please enter some text';
//                       }

//                       return null;
//                     },
//                   );
//                 }
//               }),
//               SizedBox(
//                 height: 15.h,
//               ),
//               Observer(builder: (_) {
//                 if (_loginStore.signState == SignState.signin) {
//                   return SizedBox.shrink();
//                 } else {
//                   return Row(
//                     children: [
//                       SizedBox(
//                         width: 24.w,
//                         height: 24.w,
//                         child: Checkbox(
//                             tristate: true,
//                             value: _loginStore.grocer,
//                             onChanged: (a) {
//                               _loginStore.toggleGrocer();
//                             }),
//                       ),
//                       CustomText(
//                         text: "I'am grocer",
//                       )
//                     ],
//                   );
//                 }
//               }),
//               SizedBox(
//                 height: 15.h,
//               ),
//               Observer(builder: (_) {
//                 return CustomFlatButton(
//                   text: 'Continue',
//                   isLoading: _loginStore.loginState == LoginState.pending,
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate()) {
//                       if (_loginStore.signState == SignState.signup) {
//                         if (passwordController.text ==
//                             passwordRetryController.text) {
//                           await _loginStore.signUp(
//                               email: emailController.text.trim(),
//                               password: passwordController.text.trim());
//                         } else {
//                           print('şifreler uyuşmuyor');
//                         }
//                       } else {
//                         await _loginStore.signIn(
//                             email: emailController.text.trim(),
//                             password: passwordController.text.trim());
//                       }
//                     }
//                   },
//                   color: AppConfig.secondaryColor,
//                 );
//               }),
//               SizedBox(
//                 height: 10.h,
//               ),
//               Observer(builder: (_) {
//                 return Center(
//                   child: CustomText(
//                     text: _loginStore.signState == SignState.signin
//                         ? "Don't have an account? Sign Up"
//                         : "Already have an account? Sign in",
//                     textSize: CustomTextSize.headline3,
//                     hasUnderline: true,
//                     onTap: () {
//                       _loginStore.toggleSignState();
//                     },
//                   ),
//                 );
//               })
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
