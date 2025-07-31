void main() {
  List<MyClass> myClass1 = [
    MyClass(
      id: "1",
      title: "awais",
      subTitle: "khan",
      description: "ohdwfno weonfwdnfnw",
      price: 100,
      online: false,
    ),
    MyClass(
      id: "2",
      title: "awais",
      subTitle: "khan",
      description: "ohdwfno weonfwdnfnw",
      price: 100,
      online: false,
    ),
    MyClass(
      id: "3",
      title: "awais",
      subTitle: "khan",
      description: "ohdwfno weonfwdnfnw",
      price: 100,
      online: false,
    ),
    MyClass(
      id: "4",
      title: "awais",
      subTitle: "khan",
      description: "ohdwfno weonfwdnfnw",
      price: 100,
      online: false,
    ),
    MyClass(
      id: "5",
      title: "awais",
      subTitle: "khan",
      description: "ohdwfno weonfwdnfnw",
      price: 100,
      online: false,
    ),
  ];

  print("Total items: ${myClass1.length}\n");

  for (var item in myClass1) {
    print("ID: ${item.id}");
    print("Title: ${item.title}");
    print("SubTitle: ${item.subTitle}");
    print("Description: ${item.description}");
    print("Price: ${item.price}");
    print("Online: ${item.online}");
    print("-----------------------");
  }
}

class MyClass {
  String? id;
  String? title;
  String? subTitle;
  String? description;
  double? price;
  bool? online;

  MyClass({
    this.id,
    this.title,
    this.subTitle,
    this.description,
    this.price,
    this.online,
  });
}
