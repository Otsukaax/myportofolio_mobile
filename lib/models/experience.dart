import 'package:json_annotation/json_annotation.dart';

part 'experience.g.dart';

/// Portfolio experience synchronized with the Django REST Framework API.
@JsonSerializable(fieldRename: FieldRename.snake)
class Experience {
  const Experience({
    required this.title,
    // TODO: Add required parameters for description and category
    required this.description,
    required this.category,
    // TODO: Add optional parameter thumbnail (default '') and nullable id
    this.thumbnail = '',
    this.id,
    this.categoryDisplay = '',
    this.startedAt,
    this.endedAt,
    this.isOngoing = true,
  });

  // TODO: Implement factory Experience.fromJson(Map<String, dynamic> json)
  // delegating to _$ExperienceFromJson(json)
  factory Experience.fromJson(Map<String, dynamic> json) =>
      _$ExperienceFromJson(json);

  @JsonKey(includeToJson: false)
  final String? id;
  final String title;
  // TODO: Declare final String fields for description, category,
  // and thumbnail (annotated with @JsonKey(defaultValue: ''))
  final String description;
  final String category;
  @JsonKey(defaultValue: '')
  final String thumbnail;

  @JsonKey(defaultValue: '', includeToJson: false)
  final String categoryDisplay;

  @JsonKey(includeToJson: false)
  final String? startedAt;

  @JsonKey(includeToJson: false)
  final String? endedAt;

  @JsonKey(defaultValue: true, includeToJson: false)
  final bool isOngoing;

  // TODO: Implement Map<String, dynamic> toJson() delegating to _$ExperienceToJson(this)
  Map<String, dynamic> toJson() => _$ExperienceToJson(this);
}
