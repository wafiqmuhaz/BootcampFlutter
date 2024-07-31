<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pengayaan Dasar PHP</title>
</head>
<body>
    <h1>Pengayaan Dasar PHP</h1>
    
    <h2>Soal 1: Struktur Kondisional</h2>
    <?php
    $number = -5;
    
    if ($number > 0) {
        echo "$number adalah bilangan positif.";
    } elseif ($number < 0) {
        echo "$number adalah bilangan negatif.";
    } else {
        echo "$number adalah nol.";
    }
    ?>
    
    <h2>Soal 2: Looping</h2>
    <?php
    for ($i = 1; $i <= 10; $i++) {
        echo $i . " ";
    }
    ?>
    
    <h2>Soal 3: Function</h2>
    <?php
    function tambah($a, $b) {
        return $a + $b;
    }
    
    // Contoh penggunaan fungsi
    $hasil = tambah(3, 4);
    echo "Hasil penjumlahan: " . $hasil;
    ?>
    
    <h2>Soal 4: Array</h2>
    <?php
    $hari = array("Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu");
    
    echo "Hari ke-4 dalam seminggu adalah: " . $hari[3];
    ?>
    
    <h2>Soal 5: Array Asosiatif</h2>
    <?php
    $data_diri = array(
        "nama" => "Wafiq Muhammad",
        "umur" => 25,
        "alamat" => "Jl. Cingcin, Bandung, Indonesia"
    );
    
    echo "Nama: " . $data_diri["nama"] . "<br>";
    echo "Umur: " . $data_diri["umur"] . " tahun<br>";
    echo "Alamat: " . $data_diri["alamat"];
    ?>
</body>
</html>
