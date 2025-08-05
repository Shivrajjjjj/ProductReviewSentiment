CREATE DATABASE SentimentReviewsDB;
GO

USE SentimentReviewsDB;
GO

CREATE TABLE Reviews (
    Id INT IDENTITY(1,1) PRIMARY KEY,
    ProductName NVARCHAR(255) NOT NULL,
    Content NVARCHAR(MAX) NOT NULL,
    Sentiment NVARCHAR(50),
    ConfidenceScore FLOAT
);

INSERT INTO Reviews (ProductName, Content, Sentiment, ConfidenceScore)
VALUES 
('iPhone 15', 'Great phone with amazing camera', 'Positive', 0.95),
('Samsung A32', 'Battery life is not good.', 'Negative', 0.2),
('Nokia 3310', 'It works. Nothing special.', 'Neutral', 0.5);

INSERT INTO Reviews (ProductName, Content, Sentiment, ConfidenceScore)
VALUES 
('OnePlus 11', 'Very fast but battery drains quickly.', 'Neutral', 0.55),
('Redmi Note 12', 'Budget-friendly but camera is average.', 'Neutral', 0.52),
('Realme 10', 'Not bad for the price.', 'Neutral', 0.5),
('Nokia G21', 'Old-fashioned but still works.', 'Neutral', 0.51),
('Infinix Zero 5G', 'Heats up during gaming.', 'Negative', 0.2),
('Vivo V27', 'Too many ads and bloatware.', 'Negative', 0.15),
('Motorola Edge 40', 'Disappointing screen quality.', 'Negative', 0.22),
('Lava Blaze', 'Battery lasts only half a day.', 'Negative', 0.18),
('Tecno Camon', 'Hangs a lot when opening apps.', 'Negative', 0.19),
('LG Wing', 'Unique design but not practical.', 'Neutral', 0.48),
('iPad Pro', 'Amazing for artists and professionals.', 'Positive', 0.96),
('MacBook Air M2', 'Superb performance and battery life.', 'Positive', 0.97),
('Dell XPS 13', 'Lightweight and elegant.', 'Positive', 0.92),
('HP Pavilion', 'Decent laptop for students.', 'Neutral', 0.58),
('Lenovo IdeaPad', 'Good value for money.', 'Positive', 0.88),
('Asus ROG', 'Beast for gaming.', 'Positive', 0.94),
('Acer Aspire', 'Average keyboard and trackpad.', 'Neutral', 0.5),
('Samsung TV', 'Crisp 4K visuals and good sound.', 'Positive', 0.93),
('Sony Bravia', 'Colors are amazing but expensive.', 'Neutral', 0.6),
('MI TV 5X', 'Affordable and feature-packed.', 'Positive', 0.89),
('Boat Airdopes', 'Battery drains fast.', 'Negative', 0.25),
('Noise Smartwatch', 'Accurate fitness tracking.', 'Positive', 0.91),
('Fire-Boltt Ninja', 'UI is laggy.', 'Negative', 0.2),
('Fastrack Reflex', 'Design is cool but lacks features.', 'Neutral', 0.56),
('Canon EOS 200D', 'Perfect for beginners.', 'Positive', 0.94),
('Nikon D3500', 'Great photos, easy to use.', 'Positive', 0.92),
('Sony Alpha A6100', 'Focus is very fast.', 'Positive', 0.95),
('GoPro Hero 11', 'Perfect for adventure shooting.', 'Positive', 0.97),
('DJI Osmo', 'Stabilization is impressive.', 'Positive', 0.93),
('Samsung Tab S9', 'Excellent for entertainment.', 'Positive', 0.91),
('iPad Mini 6', 'Compact and powerful.', 'Positive', 0.92),
('HP Ink Tank', 'Prints fast but setup is difficult.', 'Neutral', 0.53),
('Epson EcoTank', 'Economical in the long run.', 'Positive', 0.87),
('Canon Pixma', 'Ink dries up too quickly.', 'Negative', 0.28),
('LG Refrigerator', 'Spacious and efficient.', 'Positive', 0.9),
('Samsung Fridge', 'Water leaks sometimes.', 'Negative', 0.22),
('Whirlpool Washer', 'Vibrates too much during spin.', 'Negative', 0.3),
('Bosch Washing Machine', 'Cleans clothes very well.', 'Positive', 0.91),
('IFB Dryer', 'Takes time but clothes are soft.', 'Neutral', 0.55),
('Voltas AC', 'Cools fast and silent.', 'Positive', 0.9),
('Blue Star AC', 'Remote feels outdated.', 'Neutral', 0.52),
('Daikin AC', 'Power-efficient and silent.', 'Positive', 0.94),
('Haier AC', 'Installation took too long.', 'Negative', 0.23),
('Havells Fan', 'Very silent, elegant design.', 'Positive', 0.91),
('Crompton Fan', 'Noisy even at low speed.', 'Negative', 0.2),
('Bajaj Iron', 'Heats up quickly.', 'Positive', 0.89),
('Usha Iron', 'Cord is too short.', 'Negative', 0.2),
('Philips Mixer', 'Very noisy.', 'Negative', 0.19),
('Prestige Induction', 'Heats evenly.', 'Positive', 0.9),
('Pigeon Kettle', 'Stopped working in 2 months.', 'Negative', 0.1),
('Syska Trimmer', 'Good battery backup.', 'Positive', 0.91),
('MI Trimmer', 'Vibrates too much.', 'Negative', 0.25),
('Vega Hair Dryer', 'Compact and easy to carry.', 'Positive', 0.92),
('Havells Straightener', 'Hair sticks to plates.', 'Negative', 0.15),
('Zebronics Speaker', 'Bass is not good.', 'Negative', 0.2);
select *from Reviews

