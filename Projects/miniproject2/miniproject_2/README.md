# Mini Project 02 - 

## Mobile Flutter Superbootcamp Hibah Disnaker Jawa Barat 2024

<h2> hi 𝐭𝐡𝐞𝐫𝐞, this my mini project 02 <programmer/>! Ready to learn Flutter? ✨ <img src="https://raw.githubusercontent.com/ABSphreak/ABSphreak/master/gifs/Hi.gif" width="30px"></h2>

##
[![Website Badge](https://img.shields.io/badge/-wafiqmuhaz-blue?style=flat-square&logo=Website&logoColor=white&link=https://wafiqmuhaz.netlify.app/)](https://www.linkedin.com/in/wafiqmuhaz/) [![Twitter Badge](https://img.shields.io/badge/-@wafiqmuhaz-1ca0f1?style=flat-square&labelColor=1ca0f1&logo=twitter&logoColor=white&link=https://twitter.com/azwamuh_)](https://twitter.com/azwamuh) [![Linkedin Badge](https://img.shields.io/badge/-wafiqmuhaz-blue?style=flat-square&logo=Linkedin&logoColor=white&link=https://www.linkedin.com/in/wafiqmuhaz/)](https://www.linkedin.com/in/wafiqmuhaz/) [![Medium Badge](https://img.shields.io/badge/-@wafiqmuhaz-03a57a?style=flat-square&labelColor=000000&logo=Medium&link=https://medium.com/@wafiqmuhaz/)](https://medium.com/@wafiqmuhaz)
[![Gmail Badge](https://img.shields.io/badge/-wafiqmuhaz@gmail.com-c14438?style=flat-square&logo=Gmail&logoColor=white&link=mailto:wafiqmuhaz@gmail.com)](mailto:wafiqmuhaz@gmail.com)
##
[![GitHub followers](https://img.shields.io/github/followers/wafiqmuhaz?logo=GitHub&style=for-the-badge)](https://github.com/wafiqmuhaz?tab=followers) &nbsp; [![GitHub Stars](https://img.shields.io/github/stars/wafiqmuhaz?logo=github&style=for-the-badge)](https://github.com/wafiqmuhaz?tab=repositories) &nbsp; [![GitHub Sponsors](https://img.shields.io/github/sponsors/wafiqmuhaz?color=BF4B8A&logo=githubsponsors&style=for-the-badge&label=Sponsor%20on%20Github)](https://github.com/sponsors/wafiqmuhaz)
##

## About this project

Aplikasi ini merupakan hasil dari program Mobile Flutter Superbootcamp Hibah Disnaker Jawa Barat 2024. Proyek ini lanjutan dari mini project pertama dan bertujuan untuk mengembangkan aplikasi e-commerce(seperti Shopee, Lazada, Tokopedia dll) dengan memanfaatkan beberapa API yang telah disediakan, yaitu API Profil, API Produk, dan API Keranjang. Dan dengan penambahan Splash screen dengan tambahan animasi, Login screen dengan untuk rule, penambahan local notifikasi pada Home screen dan fitur search dengan dapat diisi input untuk mencari item dengan string dan juga dengan menambahkan unit test untuk menguji endpoint.

## Catatan
pada aplikasi kali ini dikarenakan menggunakan fitur login maka saya telah menambahkan berikut ini:
- username: wafiqmuhaz
- password: superbootcamp

## Fitur Utama

- Splash Screen: Menampilkan Splash Screen dengan animasi sebelum ke Login Screen
- Login Screen: Halaman Login untuk menentukan user apakah dapat / boleh masuk ke halaman Home / Daftar Product
- Pencarian Produk : Terdapat fitur Searching dengan memasukkan input pada Textfield
- Daftar Produk: Menampilkan daftar produk yang tersedia.
- Detail Produk: Menyediakan informasi lengkap tentang produk.
- Keranjang: Memungkinkan pengguna untuk menambahkan dan mengelola produk dalam keranjang belanja.
- Profil Pengguna: Menampilkan informasi profil pengguna.
- Lokal Notifikasi: ketika user menekan tombol pada item pada Home / tambah item pada detail item maka akan memunculkan notifikasi
- Unit testing: melakukan unit testing pada API yang telah disediakan (User Profile, Cart dan Product)

## Teknologi dan Manajemen State

Aplikasi ini menggunakan manajemen state Bloc dengan struktur folder yang rapi untuk memastikan kode yang bersih dan terorganisir.

## Struktur Project

```bash
miniproject_1/
├── android/
├── ios/
├── lib/
│   ├── bloc
│         ├── cart_bloc
│                 ├── cart_bloc.dart
│                 ├── cart_event.dart
│                 ├── cart_state.dart
│         ├── notification
│                 ├── notification_bloc.dart
│                 ├── notification_event.dart
│                 ├── notification_state.dart
│         ├── product_bloc
│                 ├── product_bloc.dart
│                 ├── product_event.dart
│                 ├── product_state.dart
│         ├── searchproduct
│                 ├── searchproduct_bloc.dart
│                 ├── searchproduct_event.dart
│                 ├── searchproduct_state.dart
│         ├── user_bloc
│                 ├── user_bloc.dart
│                 ├── user_event.dart
│                 ├── user_state.dart
│   ├── const
│         ├── const.dart
│   ├── helpers
│         ├── notification_helper.dart
│   ├── model
│         ├── cart_model.dart
│         ├── product_model.dart
│         ├── user_model.dart
│   ├── pages
│         ├── cart_page
│                 ├── cart_screen.dart
│                 ├── listview_cart.dart
│         ├── login_page
│                 ├── login_page.dart
│         ├── home_page
│                 ├── home_page.dart
│         ├── product_page
│                 ├── product_detail_page.dart
│                 ├── product_page.dart
│         ├── splash_page
│                 ├── splash_page.dart
│         ├── user_page
│                 ├── user_page.dart
│   ├── routes
│         ├── routers.dart
│         ├── routes_name.dart
│   ├── server
│         ├── app_socket_server.dart
│   ├── services
│         ├── api_services.dart
│   ├── main.dart
│   
├── test
│   ├── api_service_test.dart
│   
├── pubspec.yaml
```

## Penjelasan dan Kode
1. Splash screen dengan tambahan animasi untuk masuk dari splash ke login screen
- pada folder miniproject_1/lib/pages/splash_page/splash_page.dart
- dengan animasi 5 detik setelah selesai menuju loginScreen pada kode dibawah ini:
```bash
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    //ANIMASI
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
    )..repeat(); // AnimationController
    //DELAY 6 DETIK
    Future.delayed(const Duration(seconds: 6), () {
      context.go(RouteNames.loginScreen);
    });
  }
```
2. Login screen dengan username: wafiqmuhaz dan password: superbootcamp, sebelum menuju Home Screen
- pada folder miniproject_1/lib/pages/login_page/login_page.dart
- dengan logic jika di input pada Textfield username = "nama_sendiri(wafiqmuhaz)" dan password = "superbootcamp" maka akan dialihkan ke halaman beranda/product dan apabila salah maka akan di beri snackbar "Username dan password tidak sesuai"
- dan kode sperti dibawah ini:
```bash
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    if (_usernameController.text == 'wafiqmuhaz' && _passwordController.text == 'superbootcamp') {
      context.pushReplacementNamed(RouteNames.home);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Username dan password tidak sesuai')),
      );
    }
  }
```
3. Dihalaman beranda/ product bisa ditambahkan local notifikasi apabila ada notifikasi maka bisa tampil
- pada folder miniproject_1/lib/helpers/notification_helper.dart untuk mengatur Notifikasi
- dan notifikasi akan ke-trigger dan muncul jika user menekan pada:
  - miniproject_1/lib/pages/product_page/product_page.dart pada bagian GestureDetector setelah GridView.builder dengan kode:
```bash
onTap: () async {
                            // Reset Payload Value
                            NotificationHelper.payload.value = "";
                            Color randomColor = Color(
                                    (math.Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1.0);
                            // Kirim Notifikasi
                            await NotificationHelper.flutterLocalNotificationsPlugin
                                .show(
                              math.Random().nextInt(99),
                              "Menampilkan notifikasi",
                              "Menuju ke detail item berhasil",
                              NotificationHelper.notificationDetails(randomColor),
                              payload: jsonEncode({"data": "test"}),
                            );
                            context.push(Uri(
                                    path: RouteNames.detailProduct,
                                    queryParameters: product.toMap())
                                .toString());
                          }
```
  - miniproject_1/lib/pages/product_page/product_page.dart pada bagian Item dari product pada Elevated button dengan kode:
```bash
onTap: () async {
                            // Reset Payload Value
                            NotificationHelper.payload.value = "";
                            Color randomColor = Color(
                                    (math.Random().nextDouble() * 0xFFFFFF).toInt())
                                .withOpacity(1.0);
                            // Kirim Notifikasi
                            await NotificationHelper.flutterLocalNotificationsPlugin
                                .show(
                              math.Random().nextInt(99),
                              "Menampilkan notifikasi",
                              "Menuju ke detail item berhasil",
                              NotificationHelper.notificationDetails(randomColor),
                              payload: jsonEncode({"data": "test"}),
                            );
                            context.push(Uri(
                                    path: RouteNames.detailProduct,
                                    queryParameters: product.toMap())
                                .toString());
                          }
```
  - miniproject_1/lib/pages/cart_page/cart_page.dart pada bagian Elevated button "checkout" dengan kode:
```bash
onPressed: () async {
                  NotificationHelper.payload.value = "";
                  Color randomColor =
                      Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                          .withOpacity(1.0);
                  await NotificationHelper.flutterLocalNotificationsPlugin.show(
                    math.Random().nextInt(99),
                    "Menampilkan notifikasi",
                    "Tombol Checkout berhasil ditekan!",
                    NotificationHelper.notificationDetails(randomColor),
                    payload: jsonEncode({"data": "test"}),
                  );
                },
```
4. Dihalaman beranda/ product tambahlah textfields yang bisa diberi input untuk filter data list product yang ada search by string
- pada folder miniproject_1/lib/page/product_page/product_page.dart dibagian atas product, dengan kode:
```bash
  String searchQuery = '';
TextField(
              decoration: const InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value.toLowerCase();
                });
              },
            ),
```
5. Dan berikan unit test untuk menguji endpoint profile api yang ada pada halaman profile
- pada folder miniproject_1/test/api_service_test.dart, dengan kode:
  - untuk mengetest api dari profile user:
```bash
test('fetchUser returns a User object', () async {
      final client = MockClient((request) async {
        return http.Response(
            '{"id": 1, "username": "testuser", "email": "test@example.com"}',
            200);
      });
      final apiService = ApiService(client);

      final user = await apiService.fetchUser();
      expect(user, isA<User>());
      expect(user.username, 'testuser');
      expect(user.email, 'test@example.com');
    });
```
  - untuk mengetest api dari Cart:
```bash
test('fetchCart returns a CartModel object', () async {
      final client = MockClient((request) async {
        return http.Response(
            '{"id": 1, "userId": 1, "date": "2020-03-02T00:00:00.000Z", "products": []}',
            200);
      });
      final apiService = ApiService(client);

      final cart = await apiService.fetchCart();
      expect(cart, isA<CartModel>());
      expect(cart.id, 1);
      expect(cart.userId, 1);
    });
```
  - untuk mengetest api dari profile user:
```bash
test('fetchProducts returns a list of ProductModel', () async {
      final client = MockClient((request) async {
        return http.Response(
            '[{"id": 1, "title": "Test Product", "price": 29.99}]', 200);
      });
      final apiService = ApiService(client);

      final products = await apiService.fetchProducts();
      expect(products, isA<List<ProductModel>>());
      expect(products.isNotEmpty, true);
      expect(products.first.title, 'Test Product');
    });
```

## screenshoot 1

| Splash screen | Login screen | product screen | notif popup | Filter feature | 
| --------------- | --------------- | --------------- | --------------- | --------------- | 
| ![Splash screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/1.png)   | ![Login screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/2.png)  | ![product screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/3.png)   | ![notif popup](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/4.png)  | ![Filter feature](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/5.png)   | 
| --------------- | --------------- | --------------- | --------------- | --------------- | 

## screenshot 2

| detail produk | cart screen | profile screen | Unit testing | Testing result |
| --------------- | --------------- | --------------- | --------------- | --------------- | 
| ![detail produk](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/6.png)  | ![cart screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/7.png)   | ![profile screen](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/8.png)  | ![Unit testing](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/9.png)   | ![Testing result](https://github.com/wafiqmuhaz/BootcampFlutter/blob/main/Projects/miniproject2/miniproject_2/assets/docs/10.png)  | 
| --------------- | --------------- | --------------- | --------------- | 

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

- Link Figma Design : [Figma]()



## Deployment Link APK

Download Link APK MiniProject1:<br>
[MiniProject1 (Google Drive)]()
