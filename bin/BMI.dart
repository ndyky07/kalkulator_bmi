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
