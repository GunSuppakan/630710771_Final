class TeamItem {
  final String name;
  final String group;
  final String image;

  TeamItem({
    required this.name,
    required this.group,
    required this.image,
  });

  factory TeamItem.fromJson(Map<String, dynamic>json){
    return TeamItem(
      name: json['name'],
      group: json['group'],
      image: json['image'],
    );
  }
  TeamItem.fromJson2(Map<String, dynamic> json)
      : name = json['name'],
        group = json['group'],
        image = json['image'];


}
