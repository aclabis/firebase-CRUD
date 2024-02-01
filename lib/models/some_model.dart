class Bird {
  String? name;
  String? job;
  int? age;
  String? id;
  String? work;

  Bird({this.name, this.job, this.age, this.id, this.work});

  Bird.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    job = json['job'];
    age = json['age'];
    id = json['id'];
    work = json['work'];
  }

  toJson(Bird bird) {
    Map<String, dynamic> json = {};
    json['name'] = bird.name;
    json['job'] = bird.job;
    json['age'] = bird.age;
    json['id'] = bird.id;
    json['work'] = bird.work;

    return json;
  }
}
