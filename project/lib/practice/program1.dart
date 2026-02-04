class Bank{
  double _balance;
  Bank(this._balance);
  double get Balance =>_balance;
  set balance(double newBalance){
    if(newBalance>=0){
          _balance=newBalance;
    }
    else{
      print("Invalid balance");
    }
  }
}