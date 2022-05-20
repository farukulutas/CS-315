// In this main class, scope analysis
// of the Dart language is performed.
main() {
  // Initialize local variable inside Main
  String msg = "I am defined in Main.";
  void outer() {
    // Initialize local variable inside outer
    int scope = 1;
    String msgOuter = "I am defined in Outer";

    void inner() {
      // redefining scope variable found in outer()
      // It will work until it disappears where it is defined.
      scope = 2; // static (lexical) scoping

      print('-----');
      print('inner::msg ' + msg); // prints I am defined in Main.
      print('inner::msg_outer ' + msgOuter); // prints I am defined in Outer
      print('inner::scope $scope'); // prints 2
    }

    // Each part can access variables defined in its own scope and outside scopes.
    print('-----');
    print('outer::msg ' + msg); // prints I am defined in Main.
    print('outer::msg_outer ' + msgOuter); // prints I am defined in Outer
    print('outer::scope $scope'); // prints 1
    inner();
  }

  print('-----');
  print('main::msg ' + msg); // prints I am defined in Main.
  //print('main::msg_outer ' + msg_outer); // Undefined name msg_outer.
  //print('main::scope + $scope'); // Undefined name 'scope'.
  outer();
}