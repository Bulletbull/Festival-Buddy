import 'package:dio/dio.dart';
import 'package:festival_buddy/domain/event.dart';

class EventApi {
  final Dio dio;

  EventApi(this.dio);

  Future<List<Event>> getEvents() async {
    final response = await dio.get('/events');

    return (response.data as List)
        .map((json) => Event.fromMap(json))
        .toList();
  }

  Future<Event> getEvent(int id) async {
    final response = await dio.get('/events/$id');

    return Event.fromMap(response.data);
  }

  Future<Event> createEvent(Event event) async {
    final response = await dio.post(
      '/events',
      data: event.toMap(),
    );

    return Event.fromMap(response.data);
  }
}