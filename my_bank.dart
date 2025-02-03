import 'dart:io';
import 'bank_operations.dart';
import 'utilities/my_methods.dart';
import 'utilities/my_mixins.dart';

void main() {
  late int choice;
  BankOperations? theAcc = BankOperations(null, null, null);
  do {
    ["1. Open Account", "2. Show Accounts", "3. Deposit", "4. Withdraw", "5. Check Balance", "6. Close Account", "7. Transfer Money", "8. Quit"].forEach(print);

  try {
    stdout.write("Enter your choice: ");
    choice = int.tryParse(stdin.readLineSync()!) ?? 0;
    
    switch (choice) {
      case 1: // open new account
        final (name, accNo, initBalance) = getNewAccDetails();
        theAcc.setName = name;
        theAcc.setbalance = initBalance;
        theAcc.setAccNumber = accNo;
        theAcc.getDetailsStatus ? theAcc.openNewAccount() : null;
        break;
      case 2: // show all accounts
        theAcc.getAllAccountNumbers.isNotEmpty ?
        print("Your Account(s):\n${theAcc.getAllAccountNumbers.join('\n')}\n") :
        Logger.error("No accounts found. You should add one first.");
        break;
      case 3: // deposit
        final ({int accNumber, int balance}) withdrawInput = getDipositWithdrawDetails();
        int accNo = withdrawInput.accNumber;
        int depositAmount = withdrawInput.balance;
        // theAcc.setAccNumber = withdrawInput.accNumber.toString();
        // theAcc.setbalance = withdrawInput.balance;

        // when no exception
        theAcc.dipositAmount(accNo, depositAmount);
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