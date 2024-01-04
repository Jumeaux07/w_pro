Map<String, String> headers(String? token) => {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": 'Bearer $token'
    };
