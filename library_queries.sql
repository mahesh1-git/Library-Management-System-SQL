USE library_db;
INSERT INTO Author (name, bio)
VALUES 
('J.K. Rowling', 'British author of Harry Potter'),
('George Orwell', 'Author of 1984 and Animal Farm'),
('Chetan Bhagat', 'Indian author known for novels on youth');

INSERT INTO Member (full_name, email, phone)
VALUES
('Aman Sharma', 'aman@example.com', '9999999999'),
('Rita Singh', 'rita@example.com', '8888888888'),
('Mahesh Joshi', 'mahesh@example.com', '7777777777');


INSERT INTO Loan (member_id, book_id, due_date)
VALUES
(1, 1, DATE_ADD(CURDATE(), INTERVAL 14 DAY)),   -- Aman -> Harry Potter
(2, 2, DATE_ADD(CURDATE(), INTERVAL 14 DAY)),   -- Rita -> 1984
(3, 3, DATE_ADD(CURDATE(), INTERVAL 14 DAY));   -- Mahesh -> Half Girlfriend

SELECT * FROM Book;
SELECT * FROM member;
SELECT * FROM author;
SELECT * FROM loan;
SELECT M.full_name, B.title, L.loan_date, L.due_date
FROM Loan L
JOIN Member M ON L.member_id = M.member_id
JOIN Book B ON L.book_id = B.book_id;
SELECT B.title, A.name AS author
FROM Book B
JOIN BookAuthor BA ON B.book_id = BA.book_id
JOIN Author A ON BA.author_id = A.author_id;
SELECT DISTINCT M.full_name
FROM Member M
JOIN Loan L ON M.member_id = L.member_id;
SELECT B.title, M.full_name, L.due_date
FROM Loan L
JOIN Book B ON B.book_id = L.book_id
JOIN Member M ON M.member_id = L.member_id
WHERE L.due_date < CURDATE();
