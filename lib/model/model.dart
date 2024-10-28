class Model {
  final int userId;
  final int id;
  final String title;
   bool completed;

  Model({required this.userId, required this.id, required this.title, this.completed = false});

  factory Model.fromJson({required Map<String,dynamic> json}){
    return Model(userId: json['userId'], id: json['id'], title: json['title'], completed: json['completed']);

  }
  
  Map<String, dynamic>toJson(){
    return {
      'userId':userId,
      'id':id, 
      'title':title,
      'completed':completed,
    };
  }
}