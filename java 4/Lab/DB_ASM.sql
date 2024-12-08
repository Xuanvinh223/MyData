create database FpolyOE
drop database FpolyOE

drop table Users
drop table Video
drop table Favorite
drop table Share

CREATE TABLE Users (
    ID NVARCHAR(50) PRIMARY KEY,
    Password NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    FullName NVARCHAR(50) NOT NULL,
    Role BIT NOT NULL
);
GO

--Tạo bảng Video
CREATE TABLE Video (
    ID NVARCHAR(100) PRIMARY KEY,
    Title NVARCHAR(100) NOT NULL,
    Poster NVARCHAR(100) NOT NULL,
    Views INT NOT NULL DEFAULT 0,
    Description NVARCHAR(MAX),
    Active BIT NOT NULL DEFAULT 1
);
GO

--Tạo bảng Favorite
CREATE TABLE Favorite (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UserID NVARCHAR(50) NOT NULL,
    VideoID NVARCHAR(100) NOT NULL,
    LikeDate DATE NOT NULL,
    CONSTRAINT FK_User_Favorite FOREIGN KEY (UserID) REFERENCES Users(ID),
    CONSTRAINT FK_Video_Favorite FOREIGN KEY (VideoID) REFERENCES Video(ID)
);
GO

--Tạo bảng Share
CREATE TABLE Share (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    UserID NVARCHAR(50) NOT NULL,
    VideoID NVARCHAR(100) NOT NULL,
    Emails NVARCHAR(MAX) NOT NULL,
    ShareDate DATE NOT NULL,
    CONSTRAINT FK_User_Share FOREIGN KEY (UserID) REFERENCES Users(ID),
    CONSTRAINT FK_Video_Share FOREIGN KEY (VideoID) REFERENCES Video(ID)
);



INSERT INTO Videos (ID, Title, Poster, Views, Description, Active) 
VALUES
('video1', 'Video 1', 'poster1.jpg', 100, 'Mô tả video 1', 1),
('video2', 'Video 2', 'poster2.jpg', 200, 'Mô tả video 2', 1),
('video3', 'Video 3', 'poster3.jpg', 300, 'Mô tả video 3', 0);
