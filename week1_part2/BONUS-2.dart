class BracketsChecker {
  String text;

  BracketsChecker({ required this.text});

  String get result{
    List<String> check = [];
    const pairs = {')':'(', ']':'[', '}':'{'};

    for (var c in text.split('')) {
      if(pairs.containsValue(c)){
        check.add(c);
      }
      else if (pairs.containsKey(c) && (check.isEmpty || check.removeLast() != pairs[c])){
        return "Not balanced";
      }
    } 
    return check.isEmpty? "Balanced" : "Not balanced";
  }
}

void main() {
  BracketsChecker b1 = BracketsChecker(text: "{what is (42)}?");
  BracketsChecker b2 = BracketsChecker(text:  "[text}");
  BracketsChecker b3 = BracketsChecker(text: "{[[(a)b]c]d}");

  print(b1.result);
  print(b2.result);
  print(b3.result);
}