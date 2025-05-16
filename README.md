# 📚 Book Club – Serverless Backend (AWS)

Welcome to the backend repo for the Book Club app – a fully serverless, AWS-native backend designed with scalability, simplicity, and modern cloud practices in mind. This project powers a social reading experience with AI-based recommendations, personalized bookshelves, and collaborative book clubs.

---

## 🚀 Project Goals

- Fully **serverless architecture**
- 100% deployed on **AWS**
- Use **best practices** for security, scalability, and cost-efficiency
- Clean onboarding, real-time book tracking, AI-powered recommendations
- Built for iteration and future features

---

## 🧠 Tech Stack

| Layer                 | Tech                                    |
|----------------------|------------------------------------------|
| API                  | AWS Lambda + API Gateway (HTTP API)     |
| Authentication       | AWS Cognito                             |
| Database             | Aurora Serverless v2 (PostgreSQL)       |
| Object Storage       | Amazon S3                               |
| External Book Search | ISBNdb API                              |
| Infrastructure       | Terraform (IaC)                         |
| CI/CD                | GitHub Actions                          |
| AI Recommendations   | Lambda + OpenAI/Bedrock (Phase 2)       |

---

## ✨ Core Features

### 👤 Authentication
- Cognito user pools
- Email + password signup/login
- Store username + profile image

### 🛫 Onboarding
- Pick 3–5 favorite books
- Book data from ISBNdb
- Save books to user bookshelf
- Cache book data to reduce API cost

### 📚 User Bookshelf
- Add/remove books
- Track reading status (reading, finished, etc.)
- Track page number
- Rate books 1–5 stars

### 📖 Book Clubs
- Create, join, leave, invite users
- Each club has:
  - Name, optional image
  - Shared bookshelf
  - Book status per club

### 🤖 AI Recommendations (Phase 2)
- Recommend books based on user's 4–5 star rated books
- Will use OpenAI or AWS Bedrock

---

## 🗂️ Planned Database Models

### Users
```sql
id (UUID), email, username, password_hash, profile_image_url, created_at
```

## Books (Cached)
```sql
isbn, title, author, cover_url, published_year, cached_at
```

## User Bookshelf
```sql
user_id, book_id, status, rating, page, added_at
```

## Bookclub
```sql
id, name, image_url, owner_id, created_at
```

## BookClubMembership
```sql
