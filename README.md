# Book Club – Serverless Backend (AWS)

Welcome to the backend repo for the Book Club app – a fully serverless, AWS-native backend designed with scalability, simplicity, and modern cloud practices in mind. This project powers a social reading experience with AI-based recommendations, personalized bookshelves, and collaborative book clubs.

---

## Project Goals

- Fully **serverless architecture**
- 100% deployed on **AWS**
- Use **best practices** for security, scalability, and cost-efficiency
- Clean onboarding, real-time book tracking, AI-powered recommendations
- Built for iteration and future features

---

## Tech Stack

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

## Core Features

### Authentication
- Cognito user pools
- Email + password signup/login
- Store username + profile image

### Onboarding
- Pick 3–5 favorite books
- Book data from ISBNdb
- Save books to user bookshelf
- Cache book data to reduce API cost

### User Bookshelf
- Add/remove books
- Track reading status (reading, finished, etc.)
- Track page number
- Rate books 1–5 stars

### Book Clubs
- Create, join, leave, invite users
- Each club has:
  - Name, optional image
  - Shared bookshelf
  - Book status per club

### AI Recommendations (Phase 2)
- Recommend books based on user's 4–5 star rated books
- Will use OpenAI or AWS Bedrock

---

##  Planned Database Models

### Users
```sql
id (UUID), email, username, password_hash, profile_image_url, created_at
```

### Books (Cached)
```sql
isbn, title, author, cover_url, published_year, cached_at
```

### UserBookshelf
```sql
user_id, book_id, status, rating, page, added_at
```

### Bookclub
```sql
id, name, image_url, owner_id, created_at
```

### BookClubMembership
```sql
user_id, bookclub_id, role, joined_at
```

### BookClubShelf
```sql
bookclub_id, book_id, status, added_by, added_at
```

## Storage 
- Profile Pictures → S3 (```bookclub-user-profiles/```)
- Book Club Images → S3 (```bookclub-images/```)
- All uploads via presigned URLs

## MVP Checklist
### Core
 - [ ] Setup API Gateway + Lambda
 - [ ] Setup Aurora Serverless Postgres
 - [ ] Setup Cognito user pool
 - [ ] Setup S3 buckets (profile images, club images)
 - [ ] Implement signup/login/auth middleware
 - [ ] ISBNdb search integration
 - [ ] Book cache DB logic
 - [ ] User bookshelf CRUD
 - [ ] Book club CRUD
 - [ ] Membership handling
 - [ ] Presigned URL endpoints
 - [ ] GitHub Actions CI/CD
 - [ ] Terraform IaC

### Nice to Have
 - [ ] AI recommendations engine
 - [ ] Book reviews
 - [ ] Notifications (invite alerts)
 - [ ] Email (SES integration)
 - [ ] Public/private club visibility

## Folder Structure
```bash
/backend
├── /functions         # Lambda handlers
├── /lib               # Shared utilities (DB, auth, S3, etc.)
├── /infra             # Terraform configs
├── /models            # DB schema definitions
└── serverless.yml or main.tf
```

## API Endpoints
| Route                   | Method | Description                       |
| ----------------------- | ------ | --------------------------------- |
| `/auth/signup`          | POST   | Register new user                 |
| `/auth/login`           | POST   | Authenticate user                 |
| `/users/me`             | GET    | Get current user profile          |
| `/users/upload-url`     | GET    | Get presigned S3 URL              |
| `/books/search?q=`      | GET    | Search books via ISBNdb           |
| `/bookshelf`            | GET    | Get user's bookshelf              |
| `/bookshelf`            | POST   | Add a book to bookshelf           |
| `/bookshelf/:id`        | PATCH  | Update reading status/page/rating |
| `/bookclubs`            | GET    | Get user's book clubs             |
| `/bookclubs`            | POST   | Create a book club                |
| `/bookclubs/:id/invite` | POST   | Invite user to club               |
| `/bookclubs/:id/books`  | POST   | Add book to club bookshelf        |

## Future Thoughts
- Role-based permissions for clubs
- Push notifications (SNS or Firebase)
- Real-time discussion threads per book
- Export reading history
- Mobile-first optimization with Expo frontend

## Contributing
- Use PRs with a feature/ prefix
- Add checklist to each PR description
- Run format/lint before pushing