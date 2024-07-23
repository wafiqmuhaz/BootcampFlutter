import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import 'sign_up.dart';

// class HomeScreen extends StatelessWidget {
//   static String id = 'home_screen';
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       builder: (context, state) {
//         if (state is AuthenticationSuccessState) {
//           return Scaffold(
//             appBar: AppBar(
//               title: BlocBuilder<AuthenticationBloc, AuthenticationState>(
//           builder: (context, state) {
//             if (state is AuthenticationSuccessState) {
//               return Text('Hi "${state.user.email}"');
//             } else {
//               return const Text('Home');
//             }
//           },
//         ),
//         centerTitle: true,

//             ),
//             body: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'Hello User',
//                     style: TextStyle(
//                       fontSize: 20,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   BlocConsumer<AuthenticationBloc, AuthenticationState>(
//                     listener: (context, state) {
//                       if (state is AuthenticationInitialState) {
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           SignupScreen.id,
//                           (route) => false,
//                         );
//                       } else if (state is AuthenticationLoadingState) {
//                         // Show loading indicator or similar
//                       } else if (state is AuthenticationFailureState) {
//                         showDialog(
//                             context: context,
//                             builder: (context) {
//                               return const AlertDialog(
//                                 content: Text('Error logging out'),
//                               );
//                             });
//                       }
//                     },
//                     builder: (context, state) {
//                       return ElevatedButton(
//                           onPressed: () {
//                             BlocProvider.of<AuthenticationBloc>(context)
//                                 .add(SignOut());
//                           },
//                           child: const Text('logOut'));
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//         return CircularProgressIndicator();
//       },
//     );
//   }
// }

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference _emailusersCollection =
      FirebaseFirestore.instance.collection('dataUsers');

  @override
  Widget build(BuildContext context) {
    print("_usersCollection: ${_emailusersCollection.get()}");

    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if (state is AuthenticationSuccessState) {
              print("useremail: ${state.user.email}");
              var userEmail = state.user.email;
              return Text('Hi ${userEmail}');
            } else {
              return const Text('Home');
            }
          },
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              BlocProvider.of<AuthenticationBloc>(context).add(SignOut());
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _ageController,
                    decoration: const InputDecoration(
                      labelText: 'Umur',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 2,
                  child: TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nama',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () async {
                final String age = _ageController.text;
                final String name = _nameController.text;
                if (age.isNotEmpty && name.isNotEmpty) {
                  await _usersCollection.add({'umur': age, 'nama': name});
                  setState(() {}); // Refresh the UI
                }
              },
              child: const Text('Kirim Data'),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersCollection.snapshots(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  final documents = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: documents.length,
                    itemBuilder: (context, index) {
                      final data =
                          documents[index].data() as Map<String, dynamic>;
                      final umur = data['umur'];
                      final nama = data['nama'];
                      return ListTile(
                        title: Text('${index + 1}, Umur: $umur, Nama: $nama'),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
