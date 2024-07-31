import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/utils/enum.dart';
import '../../../core/utils/helper.dart';
import '../../blocs/images/images_cubit.dart';
import '../../blocs/user_home/user_home_bloc.dart';
import '../../widgets/profile/profile_card_widget.dart';

import '../../../core/constants/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/widgets/app_bar_title_widget.dart';
import '../../../core/widgets/elevated_button_widget.dart';
import '../../../core/constants/colors.dart';
import '../../blocs/auth/auth_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadProfileImage();
  }

  Future<void> _loadProfileImage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final databaseRef = FirebaseFirestore.instance.collection('users');
      final snapshot = await databaseRef.doc(user.uid).get();
      if (snapshot.exists) {
        setState(() {
          profileImageUrl = snapshot.data()?["photoURL"] as String?;
        });
      }
    }
  }

  Future<void> pickImage() async {
    // Inisialisasi Image Picker
    final ImagePicker picker = ImagePicker();

    // Pilih Image dari Sumber Galery
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    // Kembalikan path dari gambar
    if (image?.path != null) {
      // Upload the image to Firebase Storage
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('profileImages')
          .child(FirebaseAuth.instance.currentUser!.uid);
      final uploadTask = storageRef.putFile(File(image!.path));

      final TaskSnapshot snapshot = await uploadTask;

      final String downloadUrl = await snapshot.ref.getDownloadURL();

      setState(() {
        profileImageUrl = downloadUrl;
      });

      // Save the image URL to Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'photoURL': downloadUrl});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    final authState = context.watch<AuthBloc>().state;
    final user = FirebaseAuth.instance.currentUser;

    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BlocBuilder<ImagesCubit, ImageState>(
          builder: (context, state) {
            return StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(user!.uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  final userData =
                      snapshot.data!.data() as Map<String, dynamic>;
                  // userrname = userData['fullName'];
                  var username = userData['userName'];
                  var usertype = userData['userType'];
                  return SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0).copyWith(bottom: 0),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const AppBarTitleWidget(
                              title: 'Profile',
                            ),
                            Center(
                              child: Card(
                                child: SizedBox(
                                  width: Helper.screeWidth(context) * 0.6,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Center(
                                      child: Text(
                                        usertype ?? '',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                          color: Colors.black,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Helper.screeHeight(context) * 0.718,
                              child: ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Visibility(
                                    visible: profileImageUrl != null,
                                    child: Container(
                                      height: 150,
                                      margin: const EdgeInsets.all(8),
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all()),
                                      child: profileImageUrl != null
                                          ? Image.network(profileImageUrl!)
                                          : Container(),
                                    ),
                                  ),
                                  // Button Pilih Gambar
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: AnimatedSwitcher(
                                      duration:
                                          const Duration(milliseconds: 500),
                                      child: state.isLoading
                                          ? CircularProgressIndicator(
                                              value: state.uploadProgress,
                                              backgroundColor: Colors.grey,
                                            )
                                          : ElevatedButton.icon(
                                              onPressed: () async {
                                                await pickImage();
                                              },
                                              icon: const Icon(
                                                  Icons.image_rounded),
                                              label:
                                                  const Text('Upload Gambar'),
                                            ),
                                    ),
                                  ),
                                  // Link Hasil Upload
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: SelectableText.rich(
                                      TextSpan(
                                        children: [
                                          const TextSpan(
                                              text: 'Link Hasil Upload : '),
                                          TextSpan(
                                            text: profileImageUrl ?? '',
                                            style: TextStyle(
                                              color: Colors.blue.shade800,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //
                                  Center(
                                    child: Card(
                                      child: SizedBox(
                                        width: Helper.screeWidth(context) * 0.6,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                            child: Text(
                                              username ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Colors.black,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 12,
                                  ),
                                  Center(
                                    child: Card(
                                      child: SizedBox(
                                        width: Helper.screeWidth(context) * 0.9,
                                        child: Padding(
                                          padding: const EdgeInsets.all(12.0),
                                          child: Center(
                                            child: Text(
                                              authState.user!.email ?? '',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22,
                                                color: Colors.black,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //
                                  // ProfileCardWidget(
                                  //   title: 'User Info',
                                  //   function: () => _moveToPage(
                                  //     context,
                                  //     AppRoutes.profilePageName,
                                  //   ),
                                  // ),
                                  // const SizedBox(
                                  //   height: 16,
                                  // ),
                                  // authState.userType == UserTypes.user.name
                                  //     ? ProfileCardWidget(
                                  //         title: 'Purchase History',
                                  //         function: () => _moveToPage(
                                  //           context,
                                  //           AppRoutes.purchaseHistoryPageName,
                                  //         ),
                                  //       )
                                  //     : const SizedBox(),
                                  // authState.userType == UserTypes.user.name
                                  //     ? const SizedBox(
                                  //         height: 16,
                                  //       )
                                  //     : const SizedBox(),
                                  // ProfileCardWidget(
                                  //   title: 'Settings',
                                  //   function: () => _moveToPage(
                                  //     context,
                                  //     AppRoutes.profilePageName,
                                  //   ),
                                  // ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                ],
                              ),
                            ),
                            BlocListener<AuthBloc, AuthState>(
                              listener: (context, state) {
                                if (state.signOutStatus == BlocStatus.success) {
                                  context
                                      .read<UserHomeBloc>()
                                      .add(SetUserDetailsToDefault());
                                  context
                                      .read<AuthBloc>()
                                      .add(SetAuthStatusToDefault());
                                  context.goNamed(AppRoutes.signInPageName);
                                }
                              },
                              child: ElevatedButtonWidget(
                                title: const Text(
                                  'Sign Out',
                                  style: TextStyle(color: AppColors.white),
                                ),
                                function: () => _handleSignOut(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
          },
        );
      },
    );
  }

  _handleSignOut(BuildContext context) {
    context.read<AuthBloc>().add(SignOutEvent());
  }

  _moveToPage(BuildContext context, String pathName) {
    context.goNamed(pathName);
  }
}
