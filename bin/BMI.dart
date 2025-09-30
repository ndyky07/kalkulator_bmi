import 'dart:io';
import 'dart:vmservice_io';

void main() {
  print('=== Kalkulator BMI ===');

  // Simpan semua hasil perhitungan
  List<Map<String, dynamic>> history = [];

  while (true) {
    stdout.write('\nMasukkan berat (kg) [atau q untuk keluar]: ');
    String? beratInput = stdin.readLineSync();
    if (beratInput == null || beratInput.toLowerCase() == 'q') break;

    stdout.write('Masukkan tinggi (cm): ');
    String? tinggiInput = stdin.readLineSync();

    if (tinggiInput == null) break;

    double berat = double.tryParse(beratInput) ?? 0;
    double tinggiCm = double.tryParse(tinggiInput) ?? 0;

    // Validasi input
    if (berat <= 0 || tinggiCm <= 0) {
      print("⚠ Input tidak valid! Berat dan tinggi harus lebih dari 0.");
      continue;
    }
    // Hitung BMI
        double tinggiM = tinggiCm / 100;
        double bmi = berat / (tinggiM * tinggiM);

        // Tentukan kategori
        String kategori;
        if (bmi < 18.5) {
          kategori = 'Kurus';
        } else if (bmi < 25) {
          kategori = 'Normal';
        } else if (bmi < 30) {
          kategori = 'Kelebihan berat badan (Overweight)';
        } else {
          kategori = 'Obesitas';
        }

        print('\nHasil:');
        print('  Berat: ${berat.toStringAsFixed(1)} kg');
        print('  Tinggi: ${tinggiCm.toStringAsFixed(1)} cm');
        print('  BMI: ${bmi.toStringAsFixed(2)}');
        print('  Kategori: $kategori');

        // Simpan ke riwayat
        history.add({
          'berat': berat,
          'tinggi': tinggiCm,
          'bmi': bmi,
          'kategori': kategori,
        });
      }
    
    // Tampilkan semua riwayat
    print('\n=== Riwayat Perhitungan ===');
    for (var i = 0; i < history.length; i++) {
      var entry = history[i];
      print('Perhitungan ${i + 1}: '
          '${entry['berat']}kg, '
          '${entry['tinggi']}cm, '
          'BMI: ${entry['bmi'].toStringAsFixed(2)}, '
          'Kategori: ${entry['kategori']}');
    }

    print('\nProgram selesai.');
  }