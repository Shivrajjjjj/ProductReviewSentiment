using System.Net.Http.Headers;
using System.Text;
using System.Text.Json;

namespace ProductReviewSentiment.Services
{
    public class GeminiSentimentService
    {
        private readonly HttpClient _httpClient;
        private readonly string _apiKey;
        private readonly string _endpoint;

        public GeminiSentimentService(IConfiguration config)
        {
            _httpClient = new HttpClient();
            _apiKey = config["Gemini:ApiKey"]!;
            _endpoint = config["Gemini:Endpoint"]!;
        }

        public async Task<(string Sentiment, double Score)> AnalyzeSentimentAsync(string reviewText)
        {
            var payload = new
            {
                contents = new[]
                {
                    new
                    {
                        parts = new[]
                        {
                            new { text = $"Classify the sentiment (Positive, Negative, or Neutral) of this review:\n\n\"{reviewText}\".\n\nRespond only with the sentiment word." }
                        }
                    }
                }
            };

            var request = new HttpRequestMessage(HttpMethod.Post, $"{_endpoint}?key={_apiKey}")
            {
                Content = new StringContent(JsonSerializer.Serialize(payload), Encoding.UTF8, "application/json")
            };

            var response = await _httpClient.SendAsync(request);
            if (!response.IsSuccessStatusCode)
                return ("Unknown", 0.0);

            var responseString = await response.Content.ReadAsStringAsync();

            var jsonDoc = JsonDocument.Parse(responseString);
            var contentText = jsonDoc.RootElement
                .GetProperty("candidates")[0]
                .GetProperty("content")
                .GetProperty("parts")[0]
                .GetProperty("text")
                .GetString();

            string sentiment = ExtractSentiment(contentText ?? "");
            double score = sentiment switch
            {
                "Positive" => 1.0,
                "Neutral" => 0.5,
                "Negative" => 0.0,
                _ => 0.0
            };

            return (sentiment, score);
        }

        private string ExtractSentiment(string response)
        {
            response = response.ToLower();
            if (response.Contains("positive")) return "Positive";
            if (response.Contains("negative")) return "Negative";
            if (response.Contains("neutral")) return "Neutral";
            return "Unknown";
        }
    }
}
