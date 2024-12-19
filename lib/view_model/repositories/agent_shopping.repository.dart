import 'package:dio/dio.dart';
import 'package:sheba_plus/data/api/api_urls.dart';
import 'package:sheba_plus/models/agent-order/agent_order.dto.dart';

class AgentShoppingRepository{
  final Dio _dio;
  AgentShoppingRepository(this._dio);

  Future<Response> createAgentBooking({required AgentOrderDTO agentOrderInfo})async{
    return await _dio.post(ApiUrls.createAgentBooking, data: agentOrderInfo.toJson());
  }

  Future<Response> getOrderDetails({required int orderId})async{
    return await _dio.get("${ApiUrls.getOrderApiUrl}/$orderId");
  }

  Future<Response> updateAgentBookingSchedule({required int orderId, required List<String> meetingLocations, required int meetingTime})async{
    return await _dio.put("${ApiUrls.updateAgentBookingSchedule}/$orderId", data: {
      "meetingLocations": meetingLocations,
      "meetingTime": meetingTime
    });
  }
}