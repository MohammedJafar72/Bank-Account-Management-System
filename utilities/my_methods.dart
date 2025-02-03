import 'dart:io';
import 'my_extensions.dart';

(String, String, int) getNewAccDetails() {
  stdout.write("Enter your name: ");
  final String getName = stdin.readLineSync()!;
  stdout.write("Enter account number: ");
  final String getAccNo = stdin.readLineSync()!;
  stdout.write("Enter initial balance: ");
  final int getInitialBalance = int.tryParse(stdin.readLineSync()!) ?? 0;

  return (getName, getAccNo, getInitialBalance);
}

({int accNumber, int balance}) getDipositWithdrawDetails() {
  try {
    stdout.write("Enter account number: ");
    final String getAccNo = stdin.readLineSync()!;
    stdout.write("Enter Amount: ");
    final int getBalance = int.tryParse(stdin.readLineSync()!) ?? 0;

    (bool, int) isValidAndAccNumber = getAccNo.isValidAccountNumber();
    if (!isValidAndAccNumber.$1 || getBalance == 0) {
      throw "Eighter account number or amount you provided is invalid";
    } else {
      return(accNumber: isValidAndAccNumber.$2, balance: getBalance);
    }
  } catch (e) {
    rethrow;
  }
}