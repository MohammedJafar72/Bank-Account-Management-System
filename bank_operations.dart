import 'utilities/my_extensions.dart';
import 'utilities/my_mixins.dart';

class BankOperations with Logger {
  String? _accHolderName;
  int? _initialBalance, _accNumber;

  List<int> _allAccNumbers = [];
  Map<int, int> _allAccBalances = {};

  BankOperations(this._accHolderName, this._accNumber, this._initialBalance);

  void openNewAccount() {
    try {
      if(_allAccNumbers.contains(this._accNumber!)) {
        throw "Account number already exists";
      } else {
        _allAccNumbers.add(this._accNumber!);
        _allAccBalances.putIfAbsent(this._accNumber!, () => this._initialBalance!);
        Logger.success("Account $_accNumber opened for $_accHolderName with initial balance $_initialBalance");
      }
    } catch (e) {
      rethrow;
    }
    // _allAccNumbers.add(accNumber);
  }

  void dipositAmount(int accNo, int depositAmount) {
    try {
      if (_allAccBalances.keys.contains(this._accNumber)) {
        Logger.log("${_allAccBalances.toString()}");
        _allAccBalances.update(accNo, (value) => value + depositAmount);
      } else {
        throw "Something went wrong while depositing your amount of $_initialBalance to account number $_accNumber";
      }
      // Logger.log("Withdrawal of $_initialBalance from account number $_accNumber successful");
      Logger.log("${_allAccBalances.toString()}");
    } catch (e) {
      rethrow;
    }
  }

  // Getters
  get getDetailsStatus => this._accHolderName!.isNotEmpty && this._initialBalance! > 0 && this._accNumber! > 0 ? true : false;
  get getAllAccountNumbers => _allAccNumbers;

  // Setters 
  set setName(String name) {
    try {
      (bool, String) isValidName = name.isValidName();
      isValidName.$1 ?
      this._accHolderName = isValidName.$2 :
      throw "Account holder name you provided is not valid";
    } catch (e) {
      rethrow;
    }
  }
  set setbalance(int initBal) {
    try {
      initBal > 0 ?
      this._initialBalance = initBal :
      throw "Initial balance you provided is not a valid amount";
    } catch (e) {
      rethrow;
    }
  }
  set setAccNumber(String accNumber) {
    try {
      (bool, int) isValidAndAccNumber = accNumber.isValidAccountNumber();
      isValidAndAccNumber.$1 ? 
      this._accNumber = isValidAndAccNumber.$2 :
      throw "Account number you provided is not valid";
    } catch (e) {
      rethrow;
    }
  }
}