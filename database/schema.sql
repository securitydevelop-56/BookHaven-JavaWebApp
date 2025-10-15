-- BookHaven Database Schema for PostgreSQL

-- Create database (run this separately if needed)
-- CREATE DATABASE bookhaven;

-- Connect to bookhaven database
-- \c bookhaven;

-- Create admins table
CREATE TABLE IF NOT EXISTS admins (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create contacts table
CREATE TABLE IF NOT EXISTS contacts (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create books table
CREATE TABLE IF NOT EXISTS books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(100) NOT NULL,
    description TEXT,
    image_url VARCHAR(500),
    price DECIMAL(10, 2) NOT NULL,
    featured BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insert default admin user (username: admin, password: admin123)
INSERT INTO admins (username, password) 
VALUES ('admin', 'admin123')
ON CONFLICT (username) DO NOTHING;

-- Insert sample featured books
INSERT INTO books (title, author, description, image_url, price, featured) VALUES
('The Great Gatsby', 'F. Scott Fitzgerald', 'A classic American novel set in the Jazz Age, exploring themes of wealth, love, and the American Dream.', 'https://via.placeholder.com/300x400/28a745/ffffff?text=Great+Gatsby', 12.99, TRUE),
('To Kill a Mockingbird', 'Harper Lee', 'A gripping tale of racial injustice and childhood innocence in the American South.', 'https://via.placeholder.com/300x400/dc3545/ffffff?text=Mockingbird', 14.99, TRUE),
('1984', 'George Orwell', 'A dystopian masterpiece about totalitarianism and surveillance in a future society.', 'https://via.placeholder.com/300x400/6c757d/ffffff?text=1984', 13.99, TRUE),
('Pride and Prejudice', 'Jane Austen', 'A timeless romance novel exploring themes of love, class, and social expectations.', 'https://via.placeholder.com/300x400/ffc107/000000?text=Pride+Prejudice', 11.99, TRUE),
('The Catcher in the Rye', 'J.D. Salinger', 'A controversial coming-of-age novel following the experiences of Holden Caulfield.', 'https://via.placeholder.com/300x400/17a2b8/ffffff?text=Catcher+Rye', 12.49, TRUE),
('Harry Potter and the Sorcerer''s Stone', 'J.K. Rowling', 'The magical beginning of the beloved Harry Potter series.', 'https://via.placeholder.com/300x400/6610f2/ffffff?text=Harry+Potter', 15.99, TRUE)
ON CONFLICT DO NOTHING;

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_contacts_email ON contacts(email);
CREATE INDEX IF NOT EXISTS idx_books_featured ON books(featured);
CREATE INDEX IF NOT EXISTS idx_admins_username ON admins(username);

-- Display success message
SELECT 'Database schema created successfully!' AS message;
