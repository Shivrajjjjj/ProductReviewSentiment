# Sentiment Analysis on Product Reviews

This project is a .NET 8.0 MVC web application that uses **Gemini Text Analytics API** to analyze product reviews and classify them as **Positive**, **Neutral**, or **Negative**.

## 🔧 Technologies Used
- ASP.NET Core MVC (.NET 8.0)
- Gemini Text Analytics API (Google AI)
- Entity Framework Core
- SQL Server
- Bootstrap 5

---
## NuGet Packages

-dotnet add package Azure.AI.TextAnalytics --version 5.3.0

-dotnet add package Microsoft.EntityFrameworkCore.SqlServer

-dotnet add package Microsoft.EntityFrameworkCore.Tools

-dotnet add package Microsoft.EntityFrameworkCore.Design

## 🚀 Features
- Add and save product reviews
- Analyze review sentiment using Gemini AI
- Display sentiment score and emoji/stars
- Filter reviews by sentiment
- Edit/Delete in modals
- Responsive 4x4 card layout
- Search reviews by product name

---

## 🛠️ Setup Instructions

### 1. Clone the Repository
```bash
git clone https://github.com/your-username/ProductReviewSentiment.git
cd ProductReviewSentiment
```

### 2. Set Up Gemini API Key (User Secrets)
```bash
dotnet user-secrets init
dotnet user-secrets set "Gemini:ApiKey" "YOUR_API_KEY"
```

### 3. Update Database
```bash
dotnet ef migrations add InitialCreate
dotnet ef database update
```

### 4. Run the Application
```bash
dotnet run
```


