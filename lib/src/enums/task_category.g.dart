// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCategoryAdapter extends TypeAdapter<TaskCategory> {
  @override
  final int typeId = 1;

  @override
  TaskCategory read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskCategory.all;
      case 1:
        return TaskCategory.home;
      case 2:
        return TaskCategory.work;
      case 3:
        return TaskCategory.personal;
      default:
        return TaskCategory.all;
    }
  }

  @override
  void write(BinaryWriter writer, TaskCategory obj) {
    switch (obj) {
      case TaskCategory.all:
        writer.writeByte(0);
        break;
      case TaskCategory.home:
        writer.writeByte(1);
        break;
      case TaskCategory.work:
        writer.writeByte(2);
        break;
      case TaskCategory.personal:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
