using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ProductReviewSentiment.Data;
using ProductReviewSentiment.Models;
using ProductReviewSentiment.Services;

namespace ProductReviewSentiment.Controllers
{
    public class ReviewController : Controller
    {
        private readonly ApplicationDbContext _context;
        private readonly GeminiSentimentService _gemini;

        public ReviewController(ApplicationDbContext context, GeminiSentimentService gemini)
        {
            _context = context;
            _gemini = gemini;
        }

        public async Task<IActionResult> Index(string filter, string search)
        {
            var reviews = _context.Reviews.AsQueryable();

            if (!string.IsNullOrEmpty(filter))
                reviews = reviews.Where(r => r.Sentiment == filter);

            if (!string.IsNullOrEmpty(search))
                reviews = reviews.Where(r => r.ProductName!.Contains(search));

            return View(await reviews.ToListAsync());
        }


        public IActionResult Create() => View();

        [HttpPost]
        public async Task<IActionResult> Create(Review review)
        {
            if (!ModelState.IsValid)
                return View(review);

            try
            {
                var (sentiment, score) = await _gemini.AnalyzeSentimentAsync(review.Content ?? "");
                review.Sentiment = sentiment;
                review.ConfidenceScore = score;

                _context.Add(review);
                await _context.SaveChangesAsync();

                return RedirectToAction(nameof(Index));
            }
            catch (Exception ex)
            {
                // 👇 Log or display exact cause
                ModelState.AddModelError("", "Error saving review: " + ex.Message);
                return View(review);
            }
        }


        [HttpPost]
        public async Task<IActionResult> Edit(Review review)
        {
            if (!ModelState.IsValid)
                return RedirectToAction(nameof(Index));

            var existing = await _context.Reviews.FindAsync(review.Id);
            if (existing == null)
                return NotFound();

            existing.ProductName = review.ProductName;
            existing.Content = review.Content;

            // Re-analyze sentiment on edit
            var (sentiment, score) = await _gemini.AnalyzeSentimentAsync(review.Content ?? "");
            existing.Sentiment = sentiment;
            existing.ConfidenceScore = score;

            _context.Update(existing);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }
        [HttpPost]
        [ValidateAntiForgeryToken]

        public async Task<IActionResult> Delete(int id)
        {
            var review = await _context.Reviews.FindAsync(id);
            if (review == null)
                return NotFound();

            _context.Reviews.Remove(review);
            await _context.SaveChangesAsync();

            return RedirectToAction(nameof(Index));
        }


    }
}
