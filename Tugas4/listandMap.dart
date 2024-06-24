void main(){
  funForEach();
  funContains();
  funSort();
  funReduceandFold();
  funWhereFirstWhereandSingleWhere();
  funTakeandSkip();
  funExpand();
  funListComprehensions();
}

void funForEach(){
  print("========= ForEach =========");

  var perusahaan = ["bukalapak", "tokopedia", "blibli"];
  var urutPerusahaan = perusahaan.forEach((data)=> print(data));
  print("perusahaan = ${perusahaan}");
}

void funContains(){
  print("========= Contains =========");

  var perusahaan = ["bukalapak", "tokopedia", "blibli", "salestock"];
  print(perusahaan.contains("bukalapak"));
}

void funSort(){
  print("========= Sort =========");

  var randomdata = [1,3,5,20,4,2];
  randomdata.sort((a, b)=> a.compareTo(b));
  print(randomdata);
}

void funReduceandFold(){
  print("========= Reduce and Fold =========");


  var randomdata = [1, 3, 5, 20, 4, 2];
  randomdata.sort((a, b) => a.compareTo(b));
  print(randomdata);
  var sumData = randomdata.reduce((cur, next) => cur + next);
  print(sumData);
  const currentValue = 10;
  //var currentValue = [1, 2, 3, 4, 5];
  var nextSum =
      randomdata.fold<int>(currentValue, (cur, next) => cur + next);
  print(nextSum); // 45
}

void funEvery(){
  print("========= Reduce and Fold =========");

  List<Map<String, dynamic>> listUser = [
 {"nama": "bekasi", "umur": 240},
 {"nama": "boyolali", "umur": 200},
 {"nama": "jakarta", "umur": 100},
 {"nama": "surabaya", "umur": 100},
];
var example = listUser.every((data) => data["umur"] >= 100);
print(example); ///true
}

void funWhereFirstWhereandSingleWhere() {
  print("========= Where, FirstWhere and SingleWhere =========");

  List<Map<String, dynamic>> listUser = [
    {"nama": "bekasi", "umur": 240},
    {"nama": "boyolali", "umur": 200},
    {"nama": "jakarta", "umur": 100},
    {"nama": "surabaya", "umur": 100},
  ];

  var userYoung = listUser.where((data) => data["umur"] > 100);
  print(userYoung);
  
  var userFirstYoung = listUser.firstWhere((data) => data["umur"] < 200);
  print(userFirstYoung); // {'nama': 'jakarta', 'umur': 100}

  // var userSingle = listUser.singleWhere((data)=> data["umur"] <= 100);
  // print(userSingle); /// error karena ada dua kondisi yang benar

  try {
    var userSingle = listUser.singleWhere((data) => data["umur"] <= 100);
    print(userSingle); // error karena ada dua kondisi yang benar
  } catch (e) {
    print('Error: ${e}');
  }
}

void funTakeandSkip() {
  print("========= Take and Skip =========");

  var dataTestCase = [1, 2, 3, 4, 10, 90];
  print(dataTestCase.take(2)); /// (1, 2)
  print(dataTestCase.skip(2)); /// (3, 4, 10, 90)
}

void funExpand() {
  print("========= Expand =========");

  var pairs = [[1, 2], ["a", "b"], [3, 4]];
  var flatmaps = pairs.expand((pair)=> pair);
  print(flatmaps);
}

void funListComprehensions() {
  print("========= List Comprehensions =========");

  var comph = [1,2,3,4];
  var newCom = [for(var a in comph) "new ${a}"];


  // Add dan AddAll
  // ini merupakan method yang di pakai untuk menambahkan index pada list kita contohnya :

      // void mainList(){

        List<int> myList = [];

        List<int> list = [1,2,3];

        myList.add(1);

        myList.addAll(list);

        myList.forEach((bilangan)=>{

          print(bilangan)

      }
    );

  // }

}