import 'dart:io';
import 'open_new_acc.dart';
import 'utilities/my_mixins.dart';

void main() {
  late int choice;
  OpenNewAccount? theAcc = OpenNewAccount(null, null, null);
  do {
    ["1. Open Account", "2. Show Accounts", "3. Deposit", "4. Withdraw", "5. Check Balance", "6. Close Account", "7. Transfer Money", "8. Quit"]
    .forEach(print);

  try {
    stdout.write("Enter your choice: ");
    choice = int.tryParse(stdin.readLineSync()!) ?? 0;
    
    
    switch (choice) {
      case 1: // open new account
        final (name, accNo, initBalance) = getNewAccDetails();
        theAcc = OpenNewAccount(name, accNo, initBalance);
        theAcc.getAccCreationStatus;
        break;
      case 2: // show all accounts
        if (theAcc!.getAllAccountNumbers.isNotEmpty) {
          print("Your Account(s):\n${theAcc.getAllAccountNumbers.join('\n')}\n");
        }
        else {
          Logger.error("No accounts found. You should add one first.");
        }
        break;
      case 3: // deposit

        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      case 7:
        break;
      case 8:
        break;
      default:
        Logger.error("Invalid choice, Try again");
    }
    } catch (e) {
      Logger.error(e.toString()); 
    }
  } while (choice != 8);
}

(String, String, int) getNewAccDetails() {
  stdout.write("Enter your name: ");
  final String getName = stdin.readLineSync()!;
  stdout.write("Enter Acc. No.: ");
  final String getAccNo = stdin.readLineSync()!;
  stdout.write("Enter initial balance: ");
  final int getInitialBalance = int.tryParse(stdin.readLineSync()!) ?? 0;

  return (getName, getAccNo, getInitialBalance);
}