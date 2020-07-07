class Manager{

  static Manager _instance;

  factory Manager.getInstance(){
    if(_instance == null){
      _instance = new Manager._newInstance();
    }
    return _instance;
  }

//  static Manager get2(){
//    return new Manager();
//  }

  Manager._newInstance();
}

void main(){
  Manager.getInstance();
  Manager._newInstance();
}

