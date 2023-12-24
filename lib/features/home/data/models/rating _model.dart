import 'package:mnjz_task/features/home/domain/entities/rating_entity.dart';

class RatingModel extends RatingEntity {
  const RatingModel(super.rate, super.count);

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      json['rate']?.toDouble(),
      json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['rate'] = rate;
    json['count'] = count;

    return json;
  }
}
