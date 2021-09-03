import 'dart:io';
import 'atm.dart';

List<Atm> atmData = initData();
late Atm atmSession;

void main(List<String> arguments) {
  showWelcomeMessage();
}

List<Atm> initData() {
  return [
    Atm('00112233445566', 'Alif', 20000),
    Atm('33445566778899', 'Irfandi', 50000)
  ];
}

void showWelcomeMessage() {
  print('Selamat datang di ATM Bersama!');
  print('------------------------------');
  print('||||| Masukkan nomor ATM |||||');
  stdout.write('\t');

  String? atmNumber = stdin.readLineSync();
  int indexFound = checkAtmExist(atmNumber);

  if (indexFound == -1) {
    print('Nomor ATM tidak valid');
  } else {
    atmSession = atmData[indexFound];
    menuAtm();
  }
}

void menuAtm() {
  print('------------------------------');
  print('Selamat datang ${atmSession.name}');
  print('Saldo anda : ${atmSession.balance}');
  print('Menu : ');
  print('1. Setor tunai');
  print('2. Transfer saldo');
  print('3. Tarik tunai');
  print('4. Keluar');
  stdout.write('=> ');

  String? menu = stdin.readLineSync();
  switch (menu) {
    case '1':
      deposit();
      break;
    case '2':
      transfer();
      break;
    case '3':
      withdraw();
      break;
    case '4':
      showWelcomeMessage();
      break;
    default:
      menuAtm();
  }
}

int checkAtmExist(String? atmNumber) {
  return atmData.indexWhere((element) => element.cardNumber == atmNumber);
}

void deposit() {
  stdout.write('Jumlah Setor => ');
  String? amountInput = stdin.readLineSync();
  int amount = amountInput == null ? 0 : int.parse(amountInput);

  if (amount < 1) {
    print('Gagal!');
    print('Masukkan jumlah dengan benar!');
    menuAtm();
  } else {
    print('Berhasil setor tunai');
    atmSession.depositBalance(amount);
    menuAtm();
  }
}

void transfer() {
  print('------------------------------');
  print('||||| Masukkan nomor ATM |||||');
  stdout.write('\t');

  String? cardDestination = stdin.readLineSync();

  int indexCardDestination = checkAtmExist(cardDestination);
  if (indexCardDestination == -1) {
    print('Nomor ATM tidak valid');
    menuAtm();
  } else {
    Atm cardDestination = atmData[indexCardDestination];
    print('------------------------------');
    print('Nomor ditemukan!');
    print('Pemilik: ${cardDestination.name}');
    print('------------------------------');
    stdout.write('Jumlah Transfer => ');

    String? amountInput = stdin.readLineSync();
    int amount = amountInput == null ? 0 : int.parse(amountInput);

    if (amount > atmSession.balance) {
      print('Saldo tidak cukup!');
    } else {
      atmSession.transferBalance(cardDestination, amount);
      print(
          'Berhasil transfer sejumlah $amount kepada ${cardDestination.name}');
    }
    menuAtm();
  }
}

void withdraw() {
  stdout.write('Jumlah => ');
  String? amountInput = stdin.readLineSync();
  int amount = amountInput == null ? 0 : int.parse(amountInput);

  if (amount == 0) {
    print('Masukkan jumlah dengan benar');
    menuAtm();
  } else if (amount > atmSession.balance) {
    print('Saldo tidak cukup!');
  } else {
    print('Berhasil tarik tunai');
    atmSession.withdrawBalance(amount);
  }
  menuAtm();
}
