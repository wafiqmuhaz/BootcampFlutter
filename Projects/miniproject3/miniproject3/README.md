# Mini Project 03 - 

## Mobile Flutter Superbootcamp Hibah Disnaker Jawa Barat 2024

<h2> hi 𝐭𝐡𝐞𝐫𝐞, this my mini project 02 <programmer/>! Ready to learn Flutter? ✨ <img src="https://raw.githubusercontent.com/ABSphreak/ABSphreak/master/gifs/Hi.gif" width="30px"></h2>

##
[![Website Badge](https://img.shields.io/badge/-wafiqmuhaz-blue?style=flat-square&logo=Website&logoColor=white&link=https://wafiqmuhaz.netlify.app/)](https://www.linkedin.com/in/wafiqmuhaz/) [![Twitter Badge](https://img.shields.io/badge/-@wafiqmuhaz-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/azwamuh_)](https://twitter.com/azwamuh) [![Linkedin Badge](https://img.shields.io/badge/-wafiqmuhaz-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/wafiqmuhaz/)](https://www.linkedin.com/in/wafiqmuhaz/) [![Medium Badge](https://img.shields.io/badge/-@wafiqmuhaz-03a57a?style=flat-square&labelColor=000000&logo=Medium&link=https://medium.com/@wafiqmuhaz/)](https://medium.com/@wafiqmuhaz)
[![Gmail Badge](https://img.shields.io/badge/-wafiqmuhaz@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:wafiqmuhaz@gmail.com)](mailto:wafiqmuhaz@gmail.com)
##
[![GitHub followers](https://img.shields.io/github/followers/wafiqmuhaz?logo=GitHub&style=for-the-badge)](https://github.com/wafiqmuhaz?tab=followers) &nbsp; [![GitHub Stars](https://img.shields.io/github/stars/wafiqmuhaz?logo=github&style=for-the-badge)](https://github.com/wafiqmuhaz?tab=repositories) &nbsp; [![GitHub Sponsors](https://img.shields.io/github/sponsors/wafiqmuhaz?color=BF4B8A&logo=githubsponsors&style=for-the-badge&label=Sponsor%20on%20Github)](https://github.com/sponsors/wafiqmuhaz)
##

## About this project

Aplikasi ini merupakan hasil dari program Mobile Flutter Superbootcamp Hibah Disnaker Jawa Barat 2024. Proyek ini lanjutan sekaligus penyempurnaan dari mini project pertama dan kedua, dan bertujuan untuk mengembangkan aplikasi e-commerce(seperti Shopee, Lazada, Tokopedia dll) dengan memanfaatkan beberapa fitur dari Firebase seperti Firestore, Authentications dan Storage Database yang telah disediakan, dan aplikasi memiliki beberapa fitur yaitu Profil, Produk, dan Keranjang, Lokal dan Push Notifikasi. Dan dengan penambahan Splash screen, Login screen dengan Authentications, dan fitur search dengan dapat diisi input untuk mencari item dengan string.

## Catatan
pada aplikasi kali ini dikarenakan menggunakan fitur login maka saya telah menambahkan berikut ini:
### ROLE = ADMIN
- email: wafiqmuhaz@gmail.com
- password: Admin.1
### ROLE = USER
- email: caris.canismajoris@gmail.com
- password: User.1

## Fitur Utama

- Splash Screen: Menampilkan Splash Screen sebelum ke Login Screen
- Login Screen: Halaman Login untuk menentukan user apakah dapat / boleh masuk ke halaman Home / Daftar Product
- Register Screen: Halaman Register untuk menentukan user apakah dapat / boleh masuk ke halaman Home / Daftar Product
- Pencarian Produk : Terdapat fitur Searching dengan memasukkan input pada Textfield
- Daftar Produk: Menampilkan daftar produk yang tersedia.
- Detail Produk: Menyediakan informasi lengkap tentang produk.
- Keranjang: Memungkinkan pengguna untuk menambahkan dan mengelola produk dalam keranjang belanja.
- Profil Pengguna: Menampilkan informasi profil pengguna.
- Lokal Notifikasi: ketika user menekan tombol pada item pada Home / tambah item pada detail item maka akan memunculkan notifikasi
- Push Notifikasi Firebase: memberitahu user jika ada promo ataupun berita mengenai sesuatu yang dapat menarik perhatian user

## Teknologi dan Manajemen State

Aplikasi ini menggunakan manajemen state Bloc dengan struktur folder yang rapi untuk memastikan kode yang bersih dan terorganisir.

## Struktur Project

```bash
miniproject3/
├── android/
├── ios/
├── assets/
│   ├── docs
│   |     ├── 1,2,3,4,5,6,7,8,9,10.png // image for github docs
│   ├── fonts
│   ├── icons
│   |     ├── svg //files
│   ├── images
│   |     ├── jpg/png //files
│   |
├── lib/
│   ├── config
│   |     ├── routes.dart // go_router
│   |     
│   ├── core
│   |     ├── const //constant variables
│   |     ├── error //error handling
│   |     |       ├── exception.dart
│   |     |       ├── failure.dart
│   |     ├── service
│   |     |       ├── service_locator.dart
│   |     ├── usecase
│   |     ├── utils
│   |     ├── widgets //custom widgets
│   |     |
│   ├── data
│   |     ├── data_sources
│   |     |       ├── remote
│   |     |       |      ├── auth
│   |     |       |      ├── cart
│   |     |       |      ├── category
│   |     |       |      ├── product
│   |     |       |      ├── stripe //soon features
│   |     |       |      ├── user
│   |     ├── helper
│   |     |       ├── notification_helper.dart
│   |     |       ├── socket_helper.dart //plaining features
│   |     ├── models
│   |     |       ├── category
│   |     |       ├── product
│   |     |       ├── stripe
│   |     |       ├── user
│   |     ├── repositories
│   |     |       ├── auth
│   |     |       ├── cart
│   |     |       ├── category
│   |     |       ├── product
│   |     |       ├── stripe
│   |     |       ├── user
│   |     ├── services
│   |     |       ├── fcm_helper.dart
│   |     |       ├── notification_helper.dart
│   |     |
│   ├── domain
│   |     ├── entities
│   |     |       ├── category
│   |     |       ├── product
│   |     |       ├── stripe
│   |     |       ├── user
│   |     ├── repositories
│   |     |       ├── auth
│   |     |       ├── cart
│   |     |       ├── category
│   |     |       ├── product
│   |     |       ├──stripe
│   |     |       ├── user
│   |     ├── usecases
│   |     |       ├── auth
│   |     |       ├── cart
│   |     |       |     ├── purchase
│   |     |       ├── category
│   |     |       ├── product
│   |     |       ├──stripe
│   |     |       ├── user
│   |     |       
│   ├── presentation
│   |     ├── blocs
│   |     |       ├── admin_home 
│   |     |       ├── admin_tools
│   |     |       ├── auth
│   |     |       ├── cart
│   |     |       ├── forgot_password
│   |     |       ├── images
│   |     |       ├── network
│   |     |       ├── notification
│   |     |       ├── product_details
│   |     |       ├── purchase
│   |     |       ├── sign_in 
│   |     |       ├── sign_up
│   |     |       ├── stripe
│   |     |       ├── user_home
│   |     ├── pages
│   |     |       ├── admin_home 
│   |     |       ├── admin_tools
│   |     |       ├── auth
│   |     |       ├── base
│   |     |       ├── cart
│   |     |       ├── profile
│   |     |       ├── user_home
│   |     ├── widgets
│   |     |       ├── admin_tools
│   |     |       ├── auth
│   |     |       ├── base
│   |     |       ├── cart
│   |     |       ├── profile
│   |     |       ├── user_home
│   ├── firebase_options.dart
│   ├── main.dart
│
├── pubspec.yaml
```
#
## Penjelasan dan Kode
1. Login screen dengan Firebase Auth
- pada folder miniproject3/lib/presentation/pages/auth/sign_in.dart
- login logic
miniproject3/lib/data/data_sources/remote/auth/user_auth_remote_data_source.dart
- auth.currentUser!.reload()
```bash
  @override
  Future<String> signInUser(SignInParams signInParams) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: signInParams.email,
        password: signInParams.password,
      );
      auth.currentUser!.reload();

      return auth.currentUser!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw AuthException(errorMessage: AppStrings.invalidEmail);
      }
      if (e.code == 'user-not-found') {
        throw AuthException(errorMessage: AppStrings.userNotFound);
      }
      if (e.code == 'wrong-password') {
        throw AuthException(errorMessage: AppStrings.wrongPassword);
      }
      if (e.code == 'invalid-credential') {
        throw AuthException(errorMessage: AppStrings.invalidCredential);
      } else {
        throw AuthException(errorMessage: e.toString());
      }
    }
  }
```
#
#
2. Register screen dengan Firebase Auth, sebelum menuju Home Screen
- pada folder miniproject3/lib/presentation/pages/auth/sign_up.dart
- dengan logic jika selesai dimasukkan maka akan dimasukkan ke firestore, dengan role 'user':
```bash
fireStore.collection('users').doc(credential.user!.uid).set(
            userAuthModel.toJson(),
          );
```
- dan kode sperti dibawah ini:
#
```bash
@override
  Future<String> signUpUser(SignUpParams signUpParams) async {
    try {
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: signUpParams.email,
        password: signUpParams.password,
      );

      UserModel userAuthModel = UserModel(
        userId: credential.user!.uid,
        userType: 'user',
        userName: signUpParams.userName,
        email: signUpParams.email,
        password: signUpParams.password,
      );

      await fireStore.collection('users').doc(credential.user!.uid).set(
            userAuthModel.toJson(),
          );

      await fireStore
          .collection('cart')
          .doc(credential.user!.uid)
          .set({'ids': []});

      return ResponseTypes.success.response;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AuthException(errorMessage: AppStrings.weekPassword);
      } else if (e.code == 'email-already-in-use') {
        throw AuthException(errorMessage: AppStrings.emailAlreadyUsed);
      } else if (e.code == 'invalid-email') {
        throw AuthException(errorMessage: AppStrings.invalidEmail);
      } else {
        throw AuthException(errorMessage: e.toString());
      }
    }
  }
```
#
#
3. Dihalaman beranda/ product berada:
- pada folder miniproject3/lib/presentation/pages/user_home/user_home_page.dart
#
- dan product juga detail product akan diambil dari Firestore malalui Bloc:
```bash
  _handleSearchQuery(
    String value,
  ) {
    context.read<UserHomeBloc>().add(SearchFieldChangeEvent(query: value));
    context.read<UserHomeBloc>().add(GetProductsListByQueryEvent());
  }
```
#
#
4. Dihalaman Order/Cart product berada:
- pada folder miniproject3/lib/presentation/pages/cart/cart_page.dart
#
- dan product juga detail product akan diambil dari Firestore malalui Bloc:
```bash
  @override
  void initState() {
    context.read<CartBloc>().add(GetAllCartedProductsDetailsByIdEvent());

    super.initState();
  }
```
#
#
5. Dihalaman Profile User berada:
- pada folder miniproject3/lib/presentation/pages/profile/profile_page.dart
#
- dan user dapat mengupload foto profil mereka dan juga foto akan akan upload dan disimpan ke Firebase Storage, dengan kode dibawah ini:
```bash
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
```
- dengan menggunakan fungsi pickFile sebagai menangani gambar yang dipilih dan diupload:
```bash
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
```
#
#
6. Dihalaman Home product berada:
- pada folder miniproject3/lib/presentation/pages/user_home/user_home_page.dart
#
- dan lokal notifikasi akan dimunculkan ketika user menekan teks value dari Promo hari ini:
```bash
Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "Promo Hari ini : ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              GestureDetector(
                                onTap: () async {
                                  // Reset Payload Value
                                  // NotificationHelper.payload.value = "";
                                  // Kirim Notifikasi
                                  await NotificationHelper
                                      .flutterLocalNotificationsPlugin
                                      .show(
                                    math.Random().nextInt(99),
                                    "Menampilkan notifikasi Promo!",
                                    "Promo Hari ini : ${valueJson["title"] ?? 'Belum ada'}",
                                    NotificationHelper.notificationDetails,
                                    payload: jsonEncode({"data": "test"}),
                                  );
                                },
                                child: Text(
                                  "${valueJson["title"] ?? 'Belum ada'}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blueGrey,
                                  ),
                                ),
                              ),
                            ],
                          ),
```
- dan lokal notifikasi akan dimunculkan ketika admin mengirimkan dari Firebase message, dan aplikasi akan menangkapnya dengan kode dibawah ini:
```bash
ValueListenableBuilder(
                valueListenable: NotificationHelper.payload,
                builder: (context, value, child) {
                  // Actual Data
                  final valueJson = FcmHelper.tryDecode(value);
```

#
#


## screenshoot 1

| Splash screen | Login screen | Register screen | Home screen | Filter feature | 
| --------------- | --------------- | --------------- | --------------- | --------------- | 
| ![Splash screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/1.png)   | ![Login screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/2.png)  | ![Register screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/3.png)   | ![Home screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/4.png)  | ![Filter feature](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/5.png)   | 
| --------------- | --------------- | --------------- | --------------- | --------------- | 

## screenshot 2

| Local Notification | Firebase Notification | Detail screen | CartOrder screen | Profile screen | 
| --------------- | --------------- | --------------- | --------------- | --------------- | 
| ![Local Notification](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/6.png)  | ![Firebase Notification](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/7.png)   | ![Detail screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/8.png)  | ![CartOrder screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/9.png)   | ![Profile screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/10.png)  | 
| --------------- | --------------- | --------------- | --------------- |  --------------- | 

## screenshot 3

| Firebase Push Notification | Email Verification | Product Firebase | 
| --------------- | --------------- | --------------- | 
| ![Firebase Push Notification](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/11.png)  | ![Email Verification](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/12.png)   | ![Product Firebase](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject3/miniproject3/assets/docs/13.png)  | 
| --------------- | --------------- | --------------- | 
## System Architecture
|    ![SystemArchitecture](https://bloclibrary.dev/_astro/bloc.DJLDGT9c_1KXLNj.svg)     | 
| :----------------: | 




Bloc State Management (Business Logic Components) It aims to separate the application's business logic from the User Interface, making the application code more unambiguous, scalable, and testable.


## Business
-

## Logic
-

## Components
-

## Repositories

|    Branch Name     |                                      Branch Link                                         |
| :----------------: | :--------------------------------------------------------------------------------------: |
| Mobile Development | [MD Branch](https://github.com/wafiqmuhaz/miniproject1)                                  |
|  API profile       | [API lINKS](https://fakestoreapi.com/users/1)                                            |
|  API product       | [API lINKS](https://fakestoreapi.com/products)                                           |
|  API cart          | [API lINKS](https://fakestoreapi.com/carts)                                              |

## API Documentations

API Documentation Endpoint profile: [Endpoint](https://fakestoreapi.com/users/1)
API Documentation Endpoint product: [Endpoint](https://fakestoreapi.com/products)
API Documentation Endpoint cart   : [Endpoint](https://fakestoreapi.com/carts)

## UI/UX Design

- Link Figma Design : [Figma](https://wafiqmuhaz.netlify.app/)



## Deployment Link APK

Download Link APK MiniProject1:<br>
[MiniProject1 (https://wafiqmuhaz.netlify.app/)]()
