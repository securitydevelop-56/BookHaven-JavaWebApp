# BookHaven-JavaWebApp

📚 A Java-based web application built using JSP, Servlets, and PostgreSQL on Apache Tomcat. BookHaven is a mini library portal that allows users to explore books, manage records, and store contact leads. Developed as part of the Advanced Java course project.

## 🎯 Features

- **Home Page**: Display featured books with attractive Bootstrap-based UI
- **Admin Login**: Secure authentication system for admin users
- **Contact Form**: Collect visitor inquiries and store them in PostgreSQL database
- **Admin Dashboard**: View and manage contact leads
- **MVC Architecture**: Clean separation of concerns using Model-View-Controller pattern
- **DAO Pattern**: Database operations encapsulated in Data Access Objects
- **Responsive Design**: Mobile-friendly UI using Bootstrap 5

## 🛠️ Technologies Used

- **Backend**: Java, JSP, Servlets
- **Frontend**: HTML, CSS, Bootstrap 5, Font Awesome
- **Database**: PostgreSQL
- **Server**: Apache Tomcat 9.x or higher
- **Build Tool**: Maven
- **Architecture**: MVC (Model-View-Controller)

## 📁 Project Structure

```
BookHaven-JavaWebApp/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── bookhaven/
│   │   │           ├── dao/           # Data Access Objects
│   │   │           │   ├── AdminDAO.java
│   │   │           │   ├── BookDAO.java
│   │   │           │   └── ContactDAO.java
│   │   │           ├── model/         # Entity classes
│   │   │           │   ├── Admin.java
│   │   │           │   ├── Book.java
│   │   │           │   └── Contact.java
│   │   │           ├── servlet/       # Servlet controllers
│   │   │           │   ├── AdminLoginServlet.java
│   │   │           │   ├── AdminLogoutServlet.java
│   │   │           │   ├── ContactServlet.java
│   │   │           │   └── HomeServlet.java
│   │   │           └── util/          # Utility classes
│   │   │               └── DBConnection.java
│   │   ├── resources/
│   │   │   └── db.properties          # Database configuration
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml            # Web application deployment descriptor
│   │       ├── css/
│   │       │   └── style.css          # Custom styles
│   │       ├── admin-dashboard.jsp    # Admin panel
│   │       ├── admin-login.jsp        # Admin login page
│   │       ├── contact.jsp            # Contact form
│   │       ├── error.jsp              # Error page
│   │       ├── home.jsp               # Home page
│   │       └── index.jsp              # Entry point
├── database/
│   └── schema.sql                     # PostgreSQL database schema
├── pom.xml                            # Maven configuration
└── README.md                          # This file
```

## 🚀 Setup Instructions

### Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9.x or higher
- PostgreSQL 12 or higher
- Maven 3.x or higher

### Database Setup

1. **Install PostgreSQL** and start the PostgreSQL service

2. **Create the database**:
   ```bash
   psql -U postgres
   CREATE DATABASE bookhaven;
   ```

3. **Run the schema script**:
   ```bash
   psql -U postgres -d bookhaven -f database/schema.sql
   ```

   This will create the necessary tables and insert sample data:
   - Default admin user: `username: admin, password: admin123`
   - 6 sample featured books

4. **Update database configuration** (if needed):
   Edit `src/main/resources/db.properties`:
   ```properties
   db.url=jdbc:postgresql://localhost:5432/bookhaven
   db.username=postgres
   db.password=your_password
   ```

### Build and Deployment

1. **Clone the repository**:
   ```bash
   git clone https://github.com/securitydevelop-56/BookHaven-JavaWebApp.git
   cd BookHaven-JavaWebApp
   ```

2. **Build the project using Maven**:
   ```bash
   mvn clean package
   ```
   This will generate `BookHaven.war` in the `target/` directory.

3. **Deploy to Tomcat**:
   - Copy `target/BookHaven.war` to Tomcat's `webapps/` directory
   - Start Tomcat server
   - Access the application at: `http://localhost:8080/BookHaven/`

### Running Locally

Alternatively, you can use Maven Tomcat plugin for quick testing:

```bash
mvn tomcat7:run
```

Then access: `http://localhost:8080/`

## 🎮 Usage

### Public Pages

1. **Home Page** (`/home`): Browse featured books
2. **Contact Page** (`/contact`): Submit inquiries via contact form

### Admin Panel

1. Navigate to `/admin-login`
2. Login with credentials:
   - Username: `admin`
   - Password: `admin123`
3. View dashboard with:
   - Statistics overview
   - Contact leads management

## 🗄️ Database Schema

### Tables

1. **admins**: Store admin user credentials
2. **contacts**: Store contact form submissions
3. **books**: Store book information with featured flag

## 🔒 Security Notes

⚠️ **Important**: This is a demonstration project for educational purposes.

For production use, consider:
- Implementing password hashing (BCrypt, Argon2)
- Adding input validation and sanitization
- Implementing CSRF protection
- Using prepared statements (already implemented)
- Adding authentication filters
- Implementing proper session management
- Using HTTPS

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Priyanshu Kanaujiya**

## 🙏 Acknowledgments

- Advanced Java Course Project
- Bootstrap for the UI framework
- Font Awesome for icons
