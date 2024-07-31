<?php
echo "Pengayaan Dasar PHP\n";

// Soal 1: Struktur Kondisional
echo "\nSoal 1: Struktur Kondisional\n";
$number = -5;
if ($number > 0) {
    echo "$number adalah bilangan positif.\n";
} elseif ($number < 0) {
    echo "$number adalah bilangan negatif.\n";
} else {
    echo "$number adalah nol.\n";
}

// Soal 2: Looping
echo "\nSoal 2: Looping\n";
for ($i = 1; $i <= 10; $i++) {
    echo $i . " ";
}
echo "\n";

// Soal 3: Function
echo "\nSoal 3: Function\n";
function tambah($a, $b) {
    return $a + $b;
}

// Contoh penggunaan fungsi
$hasil = tambah(3, 4);
echo "Hasil penjumlahan: " . $hasil . "\n";

// Soal 4: Array
echo "\nSoal 4: Array\n";
$hari = array("Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu");
echo "Hari ke-4 dalam seminggu adalah: " . $hari[3] . "\n";

// Soal 5: Array Asosiatif
echo "\nSoal 5: Array Asosiatif\n";
$data_diri = array(
    "nama" => "Wafiq Muhammad",
    "umur" => 25,
    "alamat" => "Jl. Cingcin, Bandung, Indonesia"
);

echo "Nama: " . $data_diri["nama"] . "\n";
echo "Umur: " . $data_diri["umur"] . " tahun\n";
echo "Alamat: " . $data_diri["alamat"] . "\n";
?>
