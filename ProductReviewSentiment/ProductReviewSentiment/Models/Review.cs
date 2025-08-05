using System.ComponentModel.DataAnnotations;

namespace ProductReviewSentiment.Models
{
	public class Review
	{
		public int Id { get; set; }

		[Required]
		public string? ProductName { get; set; }

		[Required]
		public string? Content { get; set; }

		public string? Sentiment { get; set; }
		public double ConfidenceScore { get; set; }
	}
}
