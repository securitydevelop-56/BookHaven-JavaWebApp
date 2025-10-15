# BookHaven - Application Flow Diagrams

## 📊 System Architecture

```
┌──────────────────────────────────────────────────────────────────┐
│                         CLIENT BROWSER                            │
│                    (HTML/CSS/JavaScript)                          │
└───────────────────────┬──────────────────────────────────────────┘
                        │
                        │ HTTP Request
                        ▼
┌──────────────────────────────────────────────────────────────────┐
│                      APACHE TOMCAT SERVER                         │
│  ┌────────────────────────────────────────────────────────────┐  │
│  │                    WEB APPLICATION                          │  │
│  │                     (BookHaven.war)                         │  │
│  │                                                             │  │
│  │  ┌──────────────┐        ┌──────────────┐                 │  │
│  │  │   JSP Views  │        │   Servlets   │                 │  │
│  │  │  (Presentation)       │ (Controllers)│                 │  │
│  │  │              │◄───────┤              │                 │  │
│  │  │  - home.jsp  │        │ - HomeServlet│                 │  │
│  │  │  - contact.jsp        │ - ContactServ│                 │  │
│  │  │  - admin-*.jsp        │ - AdminLogin │                 │  │
│  │  └──────────────┘        └──────┬───────┘                 │  │
│  │                                  │                         │  │
│  │                                  ▼                         │  │
│  │                        ┌──────────────┐                   │  │
│  │                        │   DAO Layer  │                   │  │
│  │                        │  (Data Access)                   │  │
│  │                        │              │                   │  │
│  │                        │ - AdminDAO   │                   │  │
│  │                        │ - BookDAO    │                   │  │
│  │                        │ - ContactDAO │                   │  │
│  │                        └──────┬───────┘                   │  │
│  │                               │                           │  │
│  │                               ▼                           │  │
│  │                     ┌────────────────┐                    │  │
│  │                     │  DBConnection  │                    │  │
│  │                     │    (Utility)   │                    │  │
│  │                     └────────┬───────┘                    │  │
│  └──────────────────────────────┼────────────────────────────┘  │
└─────────────────────────────────┼───────────────────────────────┘
                                  │ JDBC
                                  ▼
                     ┌─────────────────────────┐
                     │  PostgreSQL Database    │
                     │                         │
                     │  Tables:                │
                     │  - admins              │
                     │  - contacts            │
                     │  - books               │
                     └─────────────────────────┘
```

## 🔄 User Flow - Public User

```
┌─────────┐
│  START  │
└────┬────┘
     │
     ▼
┌──────────────┐
│ Access /home │
│  or /        │
└────┬─────────┘
     │
     ▼
┌──────────────────────┐
│ HomeServlet.doGet()  │
│ - Fetch featured     │
│   books from DB      │
└────┬─────────────────┘
     │
     ▼
┌──────────────────────┐
│  Display home.jsp    │
│  - Show featured     │
│    books in cards    │
└────┬─────────────────┘
     │
     ├─────► Want to contact?
     │            │
     │            ▼
     │       ┌──────────────────┐
     │       │ Navigate to      │
     │       │   /contact       │
     │       └────┬─────────────┘
     │            │
     │            ▼
     │       ┌──────────────────┐
     │       │ Display          │
     │       │  contact.jsp     │
     │       └────┬─────────────┘
     │            │
     │            ▼
     │       ┌──────────────────┐
     │       │ User fills form  │
     │       │ - Name           │
     │       │ - Email          │
     │       │ - Message        │
     │       └────┬─────────────┘
     │            │
     │            ▼
     │       ┌──────────────────┐
     │       │ Submit POST to   │
     │       │ ContactServlet   │
     │       └────┬─────────────┘
     │            │
     │            ▼
     │       ┌──────────────────┐
     │       │ ContactDAO       │
     │       │ .saveContact()   │
     │       └────┬─────────────┘
     │            │
     │            ▼
     │       ┌──────────────────┐
     │       │ Insert into      │
     │       │ contacts table   │
     │       └────┬─────────────┘
     │            │
     │            ▼
     │       ┌──────────────────┐
     │       │ Show success     │
     │       │   message        │
     │       └──────────────────┘
     │
     ▼
┌────────┐
│  END   │
└────────┘
```

## 🔐 Admin Flow - Authentication & Dashboard

```
┌─────────┐
│  START  │
└────┬────┘
     │
     ▼
┌────────────────────┐
│ Navigate to        │
│  /admin-login      │
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ Display            │
│ admin-login.jsp    │
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ Admin enters       │
│ credentials        │
│ - Username         │
│ - Password         │
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ Submit POST to     │
│ AdminLoginServlet  │
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ AdminDAO           │
│ .authenticate()    │
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ Query admins       │
│ table              │
└────┬───────────────┘
     │
     ├───► Valid? ───────► NO ──┐
     │                           │
     │ YES                       ▼
     │                  ┌────────────────┐
     │                  │ Show error msg │
     │                  │ Stay on login  │
     │                  └────────────────┘
     │
     ▼
┌────────────────────┐
│ Create session     │
│ Set attributes:    │
│ - admin object     │
│ - username         │
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ Redirect to        │
│ admin-dashboard.jsp│
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ Check session      │
│ authentication     │
└────┬───────────────┘
     │
     ├───► Not logged in? ──► Redirect to login
     │
     │ Authenticated
     │
     ▼
┌────────────────────┐
│ ContactDAO         │
│ .getAllContacts()  │
└────┬───────────────┘
     │
     ▼
┌────────────────────┐
│ Display dashboard  │
│ - Statistics       │
│ - Contact leads    │
│ - Logout option    │
└────┬───────────────┘
     │
     ├───► Logout clicked?
     │            │
     │            ▼
     │     ┌──────────────┐
     │     │ /admin-logout│
     │     └────┬─────────┘
     │          │
     │          ▼
     │     ┌──────────────┐
     │     │ Invalidate   │
     │     │  session     │
     │     └────┬─────────┘
     │          │
     │          ▼
     │     ┌──────────────┐
     │     │ Redirect to  │
     │     │  login page  │
     │     └──────────────┘
     │
     ▼
┌────────┐
│  END   │
└────────┘
```

## 📦 Database Entity Relationships

```
┌───────────────────┐
│     admins        │
├───────────────────┤
│ id (PK)           │
│ username (UNIQUE) │
│ password          │
│ created_at        │
└───────────────────┘
        │
        │ 1:N (one admin manages many contacts)
        │
        ▼
┌───────────────────┐
│    contacts       │
├───────────────────┤
│ id (PK)           │
│ name              │
│ email             │
│ message           │
│ created_at        │
└───────────────────┘

┌───────────────────┐
│      books        │
├───────────────────┤
│ id (PK)           │
│ title             │
│ author            │
│ description       │
│ image_url         │
│ price             │
│ featured (BOOL)   │
│ created_at        │
└───────────────────┘
        │
        │ Featured books displayed on home page
        │
```

## 🎯 Request-Response Flow

### Example: Home Page Request

```
1. Browser → GET /home → Tomcat
                           │
2. Tomcat → HomeServlet.doGet()
                           │
3. HomeServlet → BookDAO.getFeaturedBooks()
                           │
4. BookDAO → Database Query: SELECT * FROM books WHERE featured = true
                           │
5. Database → Returns List<Book>
                           │
6. BookDAO → Returns to HomeServlet
                           │
7. HomeServlet → request.setAttribute("featuredBooks", books)
                           │
8. HomeServlet → Forward to home.jsp
                           │
9. home.jsp → Renders HTML with book data
                           │
10. Tomcat → Returns HTML Response
                           │
11. Browser ← Displays rendered page
```

### Example: Contact Form Submission

```
1. Browser → POST /contact → Tomcat
   (form data: name, email, message)
                           │
2. Tomcat → ContactServlet.doPost()
                           │
3. ContactServlet → Extract form parameters
                           │
4. ContactServlet → Create Contact object
                           │
5. ContactServlet → ContactDAO.saveContact(contact)
                           │
6. ContactDAO → Database Query: INSERT INTO contacts...
                           │
7. Database → Returns success/failure
                           │
8. ContactDAO → Returns boolean to ContactServlet
                           │
9. ContactServlet → Set success/error message attribute
                           │
10. ContactServlet → Forward to contact.jsp
                           │
11. contact.jsp → Renders with success/error message
                           │
12. Tomcat → Returns HTML Response
                           │
13. Browser ← Displays confirmation page
```

## 🔧 Technology Stack Flow

```
┌─────────────────────────────────────────────┐
│            Frontend Layer                    │
│  ┌────────────────────────────────────┐    │
│  │ HTML5 + CSS3 + JavaScript          │    │
│  │ Bootstrap 5.3.0 (responsive UI)    │    │
│  │ Font Awesome 6.4.0 (icons)         │    │
│  └────────────────────────────────────┘    │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│           Presentation Layer                 │
│  ┌────────────────────────────────────┐    │
│  │ JSP Pages                          │    │
│  │ - Dynamic content rendering        │    │
│  │ - Server-side processing           │    │
│  │ - JSTL for logic                   │    │
│  └────────────────────────────────────┘    │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│            Controller Layer                  │
│  ┌────────────────────────────────────┐    │
│  │ Servlets                           │    │
│  │ - Request handling                 │    │
│  │ - Business logic coordination      │    │
│  │ - Session management               │    │
│  └────────────────────────────────────┘    │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│          Data Access Layer                   │
│  ┌────────────────────────────────────┐    │
│  │ DAO Classes                        │    │
│  │ - Database operations              │    │
│  │ - CRUD methods                     │    │
│  │ - Result set mapping               │    │
│  └────────────────────────────────────┘    │
└─────────────────┬───────────────────────────┘
                  │
┌─────────────────▼───────────────────────────┐
│           Database Layer                     │
│  ┌────────────────────────────────────┐    │
│  │ PostgreSQL                         │    │
│  │ - Data persistence                 │    │
│  │ - ACID compliance                  │    │
│  │ - Relational integrity             │    │
│  └────────────────────────────────────┘    │
└──────────────────────────────────────────────┘
```

## 📱 Responsive Design Flow

```
┌──────────────────────────────────────────────┐
│        Bootstrap Grid System                  │
├──────────────────────────────────────────────┤
│                                               │
│  Desktop (≥992px)                            │
│  ┌───────────────────────────────────┐      │
│  │ [Nav]  Home  Contact  Admin       │      │
│  │                                   │      │
│  │ [Book1] [Book2] [Book3]          │      │
│  │ [Book4] [Book5] [Book6]          │      │
│  └───────────────────────────────────┘      │
│                                               │
│  Tablet (768-991px)                          │
│  ┌───────────────────────────────────┐      │
│  │ [Nav] ≡ Home Contact Admin        │      │
│  │                                   │      │
│  │ [Book1] [Book2]                  │      │
│  │ [Book3] [Book4]                  │      │
│  │ [Book5] [Book6]                  │      │
│  └───────────────────────────────────┘      │
│                                               │
│  Mobile (<768px)                             │
│  ┌───────────────────────────────────┐      │
│  │ [Nav] ≡ Menu                      │      │
│  │                                   │      │
│  │ [Book1]                          │      │
│  │ [Book2]                          │      │
│  │ [Book3]                          │      │
│  └───────────────────────────────────┘      │
└──────────────────────────────────────────────┘
```
