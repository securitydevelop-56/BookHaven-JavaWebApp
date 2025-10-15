# Contributing to BookHaven

Thank you for your interest in contributing to BookHaven! This document provides guidelines and instructions for contributing to the project.

## 🚀 Getting Started

### Prerequisites

- Java Development Kit (JDK) 8 or higher
- Apache Maven 3.x or higher
- PostgreSQL 12 or higher
- Apache Tomcat 9.x or higher
- Git

### Setting Up Development Environment

1. **Fork and Clone**
   ```bash
   git clone https://github.com/YOUR_USERNAME/BookHaven-JavaWebApp.git
   cd BookHaven-JavaWebApp
   ```

2. **Setup Database**
   ```bash
   psql -U postgres -c "CREATE DATABASE bookhaven;"
   psql -U postgres -d bookhaven -f database/schema.sql
   ```

3. **Configure Database Connection**
   Edit `src/main/resources/db.properties` with your local settings.

4. **Build Project**
   ```bash
   mvn clean install
   ```

## 📝 Development Guidelines

### Code Style

- Use meaningful variable and method names
- Follow Java naming conventions (camelCase for methods/variables, PascalCase for classes)
- Add comments for complex logic
- Keep methods focused and small
- Use proper indentation (4 spaces)

### Project Structure

```
src/main/
├── java/com/bookhaven/
│   ├── dao/        # Database access layer
│   ├── model/      # Entity classes (POJOs)
│   ├── servlet/    # Controller layer
│   └── util/       # Utility classes
├── resources/      # Configuration files
└── webapp/         # JSP pages and web resources
```

### Adding New Features

#### 1. Creating a New Model

```java
package com.bookhaven.model;

public class YourModel {
    private int id;
    private String field;
    
    // Constructor, getters, and setters
}
```

#### 2. Creating a New DAO

```java
package com.bookhaven.dao;

import com.bookhaven.model.YourModel;
import com.bookhaven.util.DBConnection;
import java.sql.*;

public class YourModelDAO {
    
    public YourModel getById(int id) {
        String sql = "SELECT * FROM your_table WHERE id = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                // Map to model and return
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
```

#### 3. Creating a New Servlet

```java
package com.bookhaven.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/your-endpoint")
public class YourServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, 
                        HttpServletResponse response)
            throws ServletException, IOException {
        // Handle GET request
        request.getRequestDispatcher("yourpage.jsp")
               .forward(request, response);
    }
}
```

#### 4. Creating a New JSP Page

Follow the existing structure:
- Include Bootstrap 5 CSS
- Use navigation component
- Include Font Awesome icons
- Add footer
- Use custom CSS from `style.css`

### Database Changes

1. **Update schema.sql**
   ```sql
   -- Add your new table or modification
   CREATE TABLE IF NOT EXISTS your_table (
       id SERIAL PRIMARY KEY,
       field VARCHAR(100),
       created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
   );
   ```

2. **Create corresponding Model and DAO classes**

3. **Update README with new table information**

## 🧪 Testing

### Manual Testing

1. Build the application:
   ```bash
   mvn clean package
   ```

2. Deploy to Tomcat and test:
   - Navigate to affected pages
   - Test form submissions
   - Verify database changes
   - Check error handling

### Test Checklist

- [ ] Application builds without errors
- [ ] All servlets respond correctly
- [ ] Database operations work as expected
- [ ] UI renders properly on different screen sizes
- [ ] Form validation works
- [ ] Error pages display correctly
- [ ] Session management works

## 🐛 Reporting Bugs

When reporting bugs, please include:

1. **Description**: Clear description of the issue
2. **Steps to Reproduce**: How to recreate the bug
3. **Expected Behavior**: What should happen
4. **Actual Behavior**: What actually happens
5. **Environment**: 
   - Java version
   - Tomcat version
   - PostgreSQL version
   - Browser (if UI issue)
6. **Screenshots**: If applicable
7. **Logs**: Relevant error messages from logs

## 💡 Suggesting Enhancements

Enhancement suggestions are welcome! Please include:

1. **Use Case**: Why this feature would be useful
2. **Proposed Solution**: How it could be implemented
3. **Alternatives**: Any alternative approaches considered
4. **Additional Context**: Screenshots, mockups, etc.

## 📥 Pull Request Process

1. **Create a Branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

2. **Make Changes**
   - Write clean, documented code
   - Follow the project structure
   - Test your changes

3. **Commit Changes**
   ```bash
   git add .
   git commit -m "Add feature: description"
   ```

4. **Push to Your Fork**
   ```bash
   git push origin feature/your-feature-name
   ```

5. **Create Pull Request**
   - Provide clear description
   - Reference any related issues
   - Add screenshots if UI changes

### Pull Request Guidelines

- One feature/fix per pull request
- Update documentation if needed
- Ensure the application builds successfully
- Test all affected functionality
- Write clear commit messages

## 🔒 Security

If you discover a security vulnerability:

1. **DO NOT** open a public issue
2. Email the maintainers privately
3. Provide detailed information
4. Allow time for fix before public disclosure

## 📚 Resources

- [Java Servlets Tutorial](https://docs.oracle.com/javaee/7/tutorial/servlets.htm)
- [JSP Tutorial](https://docs.oracle.com/javaee/7/tutorial/jsps.htm)
- [PostgreSQL Tutorial](https://www.postgresql.org/docs/current/tutorial.html)
- [Maven Documentation](https://maven.apache.org/guides/)
- [Bootstrap Documentation](https://getbootstrap.com/docs/)

## 📄 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Thank You!

Your contributions help make BookHaven better for everyone!
