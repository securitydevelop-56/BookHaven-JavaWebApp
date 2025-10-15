# BookHaven - Quick Start Guide

## 📚 Application Overview

BookHaven is a Java web application that demonstrates:
- MVC architecture with JSP and Servlets
- Database connectivity using JDBC and PostgreSQL
- DAO pattern for database operations
- Session management for admin authentication
- Responsive UI with Bootstrap 5

## 🎯 Key Features

### Public Features
1. **Home Page** - Browse featured books from the catalog
2. **Contact Form** - Submit inquiries that are stored in the database

### Admin Features  
1. **Secure Login** - Admin authentication
2. **Dashboard** - View statistics and manage contact leads
3. **Session Management** - Secure logout functionality

## 🗂️ Architecture

### MVC Structure

```
┌─────────────┐         ┌──────────────┐         ┌────────────┐
│    View     │ ───────>│  Controller  │ ───────>│   Model    │
│    (JSP)    │ <───────│  (Servlet)   │ <───────│   (DAO)    │
└─────────────┘         └──────────────┘         └────────────┘
                               │
                               ▼
                        ┌──────────────┐
                        │  PostgreSQL  │
                        │   Database   │
                        └──────────────┘
```

### Components

**Models** (`com.bookhaven.model`)
- `Admin.java` - Admin user entity
- `Book.java` - Book entity
- `Contact.java` - Contact lead entity

**DAOs** (`com.bookhaven.dao`)
- `AdminDAO.java` - Admin authentication operations
- `BookDAO.java` - Book retrieval operations
- `ContactDAO.java` - Contact form operations

**Servlets** (`com.bookhaven.servlet`)
- `HomeServlet.java` - Handles home page requests
- `ContactServlet.java` - Processes contact form
- `AdminLoginServlet.java` - Handles admin authentication
- `AdminLogoutServlet.java` - Manages session logout

**Utilities** (`com.bookhaven.util`)
- `DBConnection.java` - Database connection management

**Views** (`src/main/webapp`)
- `home.jsp` - Homepage with featured books
- `contact.jsp` - Contact form
- `admin-login.jsp` - Admin login page
- `admin-dashboard.jsp` - Admin dashboard
- `error.jsp` - Error page

## 🔧 Configuration Files

### `pom.xml`
Maven project configuration with dependencies:
- Servlet API 4.0.1
- JSP API 2.3.3
- JSTL 1.2
- PostgreSQL JDBC Driver 42.6.0

### `web.xml`
Web application descriptor with:
- Welcome files configuration
- Session timeout settings
- Error page mappings

### `db.properties`
Database connection settings:
```properties
db.url=jdbc:postgresql://localhost:5432/bookhaven
db.username=postgres
db.password=postgres
```

## 🗄️ Database Schema

### Tables

**admins**
- id (SERIAL PRIMARY KEY)
- username (VARCHAR 50, UNIQUE)
- password (VARCHAR 100)
- created_at (TIMESTAMP)

**contacts**
- id (SERIAL PRIMARY KEY)
- name (VARCHAR 100)
- email (VARCHAR 100)
- message (TEXT)
- created_at (TIMESTAMP)

**books**
- id (SERIAL PRIMARY KEY)
- title (VARCHAR 200)
- author (VARCHAR 100)
- description (TEXT)
- image_url (VARCHAR 500)
- price (DECIMAL 10,2)
- featured (BOOLEAN)
- created_at (TIMESTAMP)

## 🚀 Deployment Steps

1. **Setup Database**
   ```bash
   psql -U postgres
   CREATE DATABASE bookhaven;
   \c bookhaven
   \i database/schema.sql
   ```

2. **Build Application**
   ```bash
   mvn clean package
   ```

3. **Deploy to Tomcat**
   - Copy `target/BookHaven.war` to `$TOMCAT_HOME/webapps/`
   - Start Tomcat server
   - Access at `http://localhost:8080/BookHaven/`

## 🔑 Default Credentials

**Admin Login**
- Username: `admin`
- Password: `admin123`

⚠️ **Security Note**: Change default credentials in production!

## 📊 Application Flow

### User Journey
1. User visits the homepage (`/home`)
2. Featured books are displayed from database
3. User can navigate to contact form
4. Contact submission is stored in database
5. Admin can login to view contact leads

### Admin Journey
1. Admin visits login page (`/admin-login`)
2. Credentials verified against database
3. Session is created on successful login
4. Dashboard displays statistics and contact leads
5. Admin can logout (`/admin-logout`)

## 🎨 UI Components

The application uses Bootstrap 5 for styling:
- Responsive navigation bar
- Card-based layouts
- Form components with validation
- Alert messages for feedback
- Responsive grid system

## 🔍 Testing the Application

1. **Test Homepage**
   - Navigate to `/home`
   - Verify featured books display

2. **Test Contact Form**
   - Navigate to `/contact`
   - Fill and submit form
   - Check success message

3. **Test Admin Login**
   - Navigate to `/admin-login`
   - Login with credentials
   - Verify dashboard loads

4. **Test Database Connection**
   - Submit contact form
   - Login to admin dashboard
   - Verify contact appears in leads table

## 📈 Future Enhancements

Possible improvements:
- Password hashing (BCrypt)
- CRUD operations for books
- Search functionality
- Pagination for large datasets
- REST API endpoints
- User registration
- Email notifications
- Shopping cart functionality

## 🐛 Troubleshooting

**Database Connection Issues**
- Verify PostgreSQL is running
- Check `db.properties` configuration
- Ensure database schema is loaded

**Build Failures**
- Verify Java 8+ is installed
- Check Maven configuration
- Ensure all dependencies download

**Deployment Issues**
- Verify Tomcat is running
- Check logs in `$TOMCAT_HOME/logs/`
- Ensure PostgreSQL JDBC driver is available

## 📚 Resources

- [Java Servlets Documentation](https://docs.oracle.com/javaee/7/tutorial/servlets.htm)
- [JSP Documentation](https://docs.oracle.com/javaee/7/tutorial/jsps.htm)
- [PostgreSQL Documentation](https://www.postgresql.org/docs/)
- [Bootstrap Documentation](https://getbootstrap.com/docs/)
- [Apache Tomcat Documentation](https://tomcat.apache.org/tomcat-9.0-doc/)
