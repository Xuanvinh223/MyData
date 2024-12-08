create database de04
use de04
CREATE TABLE users (
    userid INT NOT NULL IDENTITY PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL  UNIQUE,
    password VARCHAR(255) NOT NULL,
    isActive bit DEFAULT 0,
);

CREATE TABLE user_logs (
    log_id INT NOT NULL IDENTITY,
    userid INT NOT NULL,
    login_time DATETIME NOT NULL,
    logout_time DATETIME,
    PRIMARY KEY (log_id),
    FOREIGN KEY (userid) REFERENCES users(userid)
);

INSERT INTO users (username, email, password)
VALUES 
    ('john_doe', 'john_doe@example.com', 'password1'),
    ('jane_doe', 'jane_doe@example.com', 'password2'),
    ('bob_smith', 'bob_smith@example.com', 'password3'),
    ('sara_jones', 'sara_jones@example.com', 'password4'),
    ('mike_taylor', 'mike_taylor@example.com', 'password5'),
    ('kim_nguyen', 'kim_nguyen@example.com', 'password6'),
    ('dan_brown', 'dan_brown@example.com', 'password7'),
    ('tina_foster', 'tina_foster@example.com', 'password8'),
    ('matt_jackson', 'matt_jackson@example.com', 'password9'),
    ('amy_lee', 'amy_lee@example.com', 'password10');



	SELECT u FROM dbo.users u WHERE u.email = :email

	SELECT * FROM dbo.user_logs

	INSERT INTO dbo.user_logs
	(
	    userid,
	    login_time,
	    logout_time
	)
	VALUES
	(   1,         -- userid - int
	    GETDATE(), -- login_time - datetime
	    DATEADD(SECOND, 60, GETDATE())       -- logout_time - datetime
	    )

	SELECT * FROM dbo.users