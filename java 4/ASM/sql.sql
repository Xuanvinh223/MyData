USE [master]
GO
/****** Object:  Database [FpolyOE]    Script Date: 4/18/2023 8:34:24 PM ******/
CREATE DATABASE [FpolyOE]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FpolyOE', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FpolyOE.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'FpolyOE_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\FpolyOE_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [FpolyOE] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FpolyOE].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FpolyOE] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FpolyOE] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FpolyOE] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FpolyOE] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FpolyOE] SET ARITHABORT OFF 
GO
ALTER DATABASE [FpolyOE] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FpolyOE] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FpolyOE] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FpolyOE] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FpolyOE] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FpolyOE] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FpolyOE] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FpolyOE] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FpolyOE] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FpolyOE] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FpolyOE] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FpolyOE] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FpolyOE] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FpolyOE] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FpolyOE] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FpolyOE] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [FpolyOE] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FpolyOE] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FpolyOE] SET  MULTI_USER 
GO
ALTER DATABASE [FpolyOE] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FpolyOE] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FpolyOE] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FpolyOE] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [FpolyOE] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [FpolyOE] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [FpolyOE] SET QUERY_STORE = OFF
GO
USE [FpolyOE]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 4/18/2023 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[VideoID] [nvarchar](100) NOT NULL,
	[LikeDate] [date] NOT NULL,
 CONSTRAINT [PK__Favorite__3214EC27729AC1C5] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 4/18/2023 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shares](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NOT NULL,
	[VideoID] [nvarchar](100) NOT NULL,
	[Emails] [nvarchar](max) NOT NULL,
	[ShareDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 4/18/2023 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[FullName] [nvarchar](50) NOT NULL,
	[Role] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 4/18/2023 8:34:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Videos](
	[ID] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Poster] [nvarchar](100) NULL,
	[Views] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK__Video__3214EC270F9752F9] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (58, N'2', N'a0qC7lG3Vfc', CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (64, N'admin', N'a0qC7lG3Vfc', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (66, N'admin', N'f9KSUekrtVU', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (67, N'admin', N'HbrVR4KtdW8', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (68, N'1', N'f9KSUekrtVU', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (70, N'1', N'a0qC7lG3Vfc', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (71, N'1', N'l4hK5IQi3Tc', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (74, N'thien', N'a0qC7lG3Vfc', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (75, N'thien', N'f9KSUekrtVU', CAST(N'2023-04-11' AS Date))
INSERT [dbo].[Favorites] ([ID], [UserID], [VideoID], [LikeDate]) VALUES (76, N'thien', N'HbrVR4KtdW8', CAST(N'2023-04-11' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[Shares] ON 

INSERT [dbo].[Shares] ([ID], [UserID], [VideoID], [Emails], [ShareDate]) VALUES (3, N'1', N'qorU1icdKps', N'vinhpxpc02986@fpt.edu.vn', CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Shares] ([ID], [UserID], [VideoID], [Emails], [ShareDate]) VALUES (4, N'2', N'f9KSUekrtVU', N'vinhpxpc02986@fpt.edu.vn', CAST(N'2023-04-09' AS Date))
INSERT [dbo].[Shares] ([ID], [UserID], [VideoID], [Emails], [ShareDate]) VALUES (7, N'admin', N'ritnXLZHgmc', N'phamxuanvinh020203@gmail.com', CAST(N'2023-04-10' AS Date))
INSERT [dbo].[Shares] ([ID], [UserID], [VideoID], [Emails], [ShareDate]) VALUES (14, N'thien', N'HbrVR4KtdW8', N'vinhpxpc02986@fpt.edu.vn', CAST(N'2023-04-11' AS Date))
SET IDENTITY_INSERT [dbo].[Shares] OFF
GO
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'0', N'123456', N'0@g', N'0', 0)
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'1', N'1', N'vinhpxpc02986@gmail.com', N'Xuân Vinh', 0)
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'2', N'123456', N'2@2gmail.com', N'2', 0)
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'admin', N'1', N'admin@admin.com', N'admin', 1)
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'thien', N'1', N'phamxuxanxuanvinh020203@gmail.com', N'xuan vinh', 0)
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'vinh223', N'1', N'v@gmail.com', N'Vinh', 0)
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'xian', N'1', N'vinhpxpc02986@fpt.edu.vn', N'vinh', 0)
INSERT [dbo].[Users] ([ID], [Password], [Email], [FullName], [Role]) VALUES (N'XuanVinh223', N'1', N'vinh@gmail.com', N'Phạm Xuân Vinh', 0)
GO
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'3', N'3', NULL, 0, N'', 0)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'4', N'4', NULL, 4, N'', 0)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'5', N'5', NULL, 5, N'', 0)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'a0qC7lG3Vfc', N'[Vietsub + Lyrics] I Love You 3000 - Stephanie Poetri', N'poster_3.jpg', 18, N'Follow instagram của mình nhé: https://www.instagram.com/ldcm_17/

[intro]
Baby, take my hand
I want you to be my husband
''Cause you''re my Iron Man
And I love you 3000
Baby, take a chance
''Cause I want this to be something
Straight out of a Hollywood movie

[Verse 1]
I see you standing there
In your Hulk outerwear
And all I can think
Is where is the ring
''Cause I know you wanna ask
Scared the moment will pass
I can see it in your eyes
Just take me by surprise

[Pre-Chorus]
And all my friends they tell me they see
You planning to get on one knee
But I want it to be out of the blue
So make sure I have no clues
When you ask

[Chorus]
Baby, take my hand
I want you to be my husband
''Cause you''re my Iron Man
And I love you 3000
Baby, take a chance
''Cause I want this to be something
Straight out of a Hollywood movie

[Verse 2]
Now we''re having dinner
And baby you''re my winner
I see the way you smile
You''re thinking about the aisle
You reach in your pocket
Emotion unlocking
And before you could ask
I answer too fast

[Pre-Chorus]
And all my friends they tell me they see
You planing to get on one knee
So now I can''t stop thinking about you
I figured out all the clues
So now I ask

[Chorus]
Baby, take my hand
I want you to be my husband
''Cause you''re my Iron Man
And I love you 3000
Baby, take a chance
''Cause I want this to be something
Straight out of a Hollywood movie

[Post-Chorus]
No spoilers please
No spoilers please

[Chorus]
Baby, take my hand
I want you to be my husband
''Cause you''re my Iron Man
And I love you 3000
Baby, take a chance
''Cause I want this to be something
Straight out of a Hollywood movie, Baby

[Post-Chorus]
No spoilers please
No spoilers please
No spoilers please
And I love you 3000', 1)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'f9KSUekrtVU', N'Pretty Girl - Maggie Lindemann | Cheat Codes ✗ Cade Remix (Lyrics + Vietsub) ♫', N'poster_5.jpg', 16, N'Maggie Lindemann - Pretty Girl (Cheat Codes x CADE Remix)
Original video:   

 • Maggie Lindemann ...  

🎵 Follow Top Tik Tok:
  

 / toptiktoktv​​  

🎵 Follow Maggie Lindemann:
https://twitter.com/maggielindemann
https://instagram.com/maggielindemann
https://facebook.com/iamMaggieLindemann
  

 / @maggielindemann  

🎵 Follow Cheat Codes:
https://twitter.com/cheatcodesmusic
https://soundcloud.com/cheatcodesmusic
https://www.facebook.com/cheatcodesmusic

🎵 Follow Cade:
https://twitter.com/cademusic
https://instagram.com/cademusic
https://soundcloud.com/cademusicofficial

📸 Background: 
Artwork from (Pixiv): https://www.pixiv.net/en/artworks/588...
Artist: NoriZC

Dear Artists, Producers and Labels! 
Top Tik Tok is a nonprofit channel for the only purpose of promoting music and artwork and learning english together, if you as an Artist/Producer/Label feels unhappy and would like to have your music/artwork taken down, please contact us via the email (toptiktok.sp@gmail.com) directly before doing anything and we will respectfully delete it immediately.

☑ We do not own the copyright for this song and artwork
☑ All rights go to their respectful owners
✉ toptiktok.sp@gmail.com ✉

_____________________________________ 
★★★★★★VOCABULARY(từ vựng)★★★★★★
- Swear(v) ▶ thề thốt, chửi thề, nguyền rủa
- Mind(n) ▶ tâm trí, lý trí
- Drink(v) ▶ uống, nhậu
- Smoke(v) ▶ hút thuốc
- See(v) ▶ nhìn, thấy
- Hold(v) ▶ giữ, nắm
- Middle(n, adj, adv) ▶ ở giữa, trung tâm
- Finger(n) ▶ ngón tay
- World(n) ▶ thế giới
- Ribbon(n) ▶ ruy băng
- Pearl(n) ▶ trân châu, ngọc trai, hột xoàn
- Picture(n) ▶ hình ảnh, tranh ảnh
- Daughter(n) ▶ con gái
- Sister(n) ▶ chị, em gái
- Show(v) ▶ thể hiện, show ra cho thấy
- Rumor(n) ▶ tin đồn
- Computer(n) ▶ máy tính
- Know(v) ▶ hiểu, biết
- Break(v) ▶ phá vỡ
- Rich(adj) ▶ giàu có
- Nice(adj) ▶ đẹp, tử tế, tốt bụng
- Strong(adj) ▶ mạnh mẽ
- Quit(v) ▶ bỏ
- Title(n) ▶ tiêu đề

★★★★★★PHRASE(cụm từ)★★★★★★
- Keep up ▶ ngẩng cao đầu, theo kịp
- Hold up ▶ giữ, chống đỡ, chờ đợi

_____________________________________ 
🎤 Lyrics: Pretty Girl - Maggie Lindemann
I can swear, I can joke
I say what''s on my mind
If I drink, if I smoke
I keep up with the guys
And you see me holding up my middle finger to the world
Fuck your ribbons and your pearls
''Cause I''m not just a pretty girl

I''m more than just a picture
I''m a daughter and a sister
Sometimes it''s hard for me to show
That I''m more than just a rumor
Or a song on your computer
There''s more to me than people know

Some days I''m broke, some days I''m rich
Some days I''m nice, some days I can be a bitch
Some days I''m strong, some days I quit
I don''t let it show, but I''ve been through some shit

I can swear, I can joke
I say what''s on my mind
If I drink, if I smoke
I keep up with the guys
And you see me holding up my middle finger to the world
Fuck your ribbons and your pearls
''Cause I''m not just a pretty girl
''Cause I''m not just a pretty girl

I''m more than just a number
I''m a hater, I''m a lover
Sometimes it''s hard for me to show
That I''m more than just a title
Or a comment going viral
There''s more to me than people know

Some days I''m broke, some days I''m rich
Some days I''m nice, some days I can be a bitch
Some days I''m strong, some days I quit
I don''t let it show, but I''ve been through some shit

I can swear, I can joke
I say what''s on my mind
If I drink, if I smoke
I keep up with the guys
And you see me holding up my middle finger to the world
Fuck your ribbons and your pearls
''Cause I''m not just a pretty girl, I''m not just a pretty girl
I''m not just a pretty girl 
I''m not just a pretty girl
I''m not just a pretty girl', 1)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'HbrVR4KtdW8', N'Shape Of You - Ed Sheeran (Lyrics & Vietsub)', N'poster_6.jpg', 14, N'⭐ Follow 𝑭𝒂𝒍𝒍 𝑰𝒏 𝑳𝒖𝒗:
☘ Subscribe:   

 / fallinluvmusic  
☘ Fanpage: https://www.facebook.com/fallinluv.music
☘ Instagram: https://www.instagram.com/fallinluv.m...
☘ Tik Tok: https://www.tiktok.com/@fallinluv.music 

⭐ Follow 𝑭𝒂𝒍𝒍 𝑰𝒏 𝑪𝒉𝒊𝒍𝒍:
☘ Subscribe: https://www.youtube.com/c/FallInChill...

🌠 Background:
☘ Collectibles on https://www.pinterest.com

🎶Lyrics:
The club isn’t the best place to find a lover
So the bar is where I go 
Me and my friends at the table doing shots drinking fast and then we talk slow
you come over and start up a conversation with just me and trust me I’ll give it a chance now
Take my hand stop, put van the man on the jukebox and then we start to dance
And now I’m singing like

Girl you know I want your love
Your love was handmade for somebody like me
Come on now follow my lead
I may be crazy don’t mind me 
Say boy let’s not talk too much 
Grab on my waist and put that body on me
Come on now follow my lead
Come come on now follow my lead

I’m in love with the shape of you
We push and pull like a magnet do
Although my heart is falling too
I’m in love with your body
Last night you were in my room 
And now my bed sheets smell like you 
Every day discovering something brand new
I’m in love with your body

Oh I X 4
I’m in love with your body
Oh I X 4
I’m in love with your body
Oh I X 4
I’m in love with your body
Every day discovering something brand new
I’m in love with the shape of you 

One week in we let the story begin
We’re going out on our first date
You and me are thrifty
So go all you can eat 
Fill up your bag and I fill up a plate
We talk for hours and hours about the sweet and the sour
And how your family’s doing ok
leave and get in a taxi, then kiss in the backseat
Tell the driver make the radio play
and I''m singing like

Girl you know I want your love
Your love was handmade for somebody like me
Come on now follow my lead 
I may be crazy, don’t mind me
Say boy let’s not talk too much 
Grab on my waist and put that body on me
Come on now follow my lead
Come come on now follow my lead

I’m in love with the shape of you
We push and pull like a magnet do
Although my heart is falling too
I’m in love with your body
Last night you were in my room 
And now my bed sheets smell like you 
Every day discovering something brand new

Well I’m in love with your body
Oh I x 4 
I’m in love with your body
Oh I x 4
I’m in love with your body
Oh I X 4
I’m in love with your body
Every day discovering something brand new
I’m in love with the shape of you 

Come on be my baby come on X 8

I’m in love with the shape of you
We push and pull like a magnet do
Although my heart is falling too
I’m in love with your body
Last night you were in my room 
And now my bed sheets smell like you 
Every day discovering something brand new

Well I’m in love with your body
Come on be my baby come on X 6
Every day discovering something brand new
I’m in love with the shape of you', 1)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'l4hK5IQi3Tc', N'(Vietsub + Lyrics) Lily - Alan Walker, K-391 & Emelie Hollow', N'poster_4.jpg', 8, N'Mình muốn thông báo rằng kênh mình bị hạn chế tắt kiếm tiền, nên mọi nguồi ủng hộ kênh mới của mình nhé, mình cảm ơn ', 1)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'qorU1icdKps', N'Umbrella - Ember Island | Matte Remix (Lyrics + Vietsub) ♫', N'poster_1.jpg', 2, N'Umbrella - Ember Island | Matte Remix

🎵 Follow Top Tik Tok:
  

 / toptiktoktv​​  

🎵 Follow AirwaveDubstepTV:
https://www.facebook.com/AirwaveDubst...
https://instagram.com/airwavemusictv_
https://soundcloud.com/airwavemusictv 
http://spoti.fi/2yL5B3I

🎵 Follow Matte:
https://soundcloud.com/matt_is_matte
https://www.instagram.com/mattmattematt/

🎵 Follow Ember Island:
https://soundcloud.com/emberisland
https://www.facebook.com/emberisIand
https://twitter.com/emberisland_
https://www.instagram.com/emberisland_/

📺 Background:
Artwork from (Artstation): https://www.artstation.com/artwork/102oq
Artist: Maromi Sagi

Dear Artists, Producers and Labels! 
Top Tik Tok is a nonprofit channel for the only purpose of promoting music and artwork and learning english together, if you as an Artist/Producer/Label feels unhappy and would like to have your music/artwork taken down, please contact us via the email (toptiktok.sp@gmail.com) directly before doing anything and we will respectfully delete it immediately.

☑ We do not own the copyright for this song and artwork
☑ All rights go to their respectful owners
✉ toptiktok.sp@gmail.com ✉

_____________________________________ 
★★★★★★VOCABULARY(từ vựng)★★★★★★
- Heart(n) ▶ trái tim
- World(n) ▶ thế giới
- Apart(adv) ▶ chia cách, chia làm 2
- Magazine(n) ▶ tạp chí
- Star(n) ▶ ngôi sao
- Dark(n) ▶ bóng tối
- Shiny(adj) ▶ tỏa sáng, sáng bóng
- See(v) ▶ nhìn, thấy
- Car(n) ▶ ô tô
- Need(v) ▶ cần
- Share(v) ▶ chia sẻ
- Because(cnj) ▶ bởi vì
- Oath(n) ▶ lời thề, lời tuyên thệ
- Rain(n) ▶ mưa
- Stand(v) ▶ đứng
- Umbrella(n) ▶ ô, dù
- Fancy(n) ▶ điều không tưởng, những việc tưởng tượng
- Between(prep) ▶ khoảng cách khoảng không ở giữa
- Entity(n) ▶ thực thể
- Infinity(n) ▶ vô cực, vô cùng tận
- War(n) ▶ chiến tranh, cuộc chiến
- Mend(v) ▶ sửa chữa

★★★★★★PHRASE(cụm từ)★★★★★★
- Stick it out - stick something out ▶ làm việc gì đó tới cùng
- Dealt its cards - dealt the cards ▶ tranh chấp

_____________________________________ 
🎤 Lyrics: Umbrella - Ember Island
You have my heart
We''ll never be worlds apart
May be in magazines
But you''ll still be my star
Baby, ''cause in the dark
You can''t see shiny cars
And that''s when you need me there
With you I''ll always share
Because

When the sun shine, we shine together
Told you I''ll be here forever
Said I''ll always be your friend
Took an oath and I''m stick it out till the end
Now that it''s raining more than ever
Know that we still have each other
You can stand under my umbrella
You can stand under my umbrella

(Ella, ella, eh, eh, eh)
Under my umbrella
(Ella, ella, eh, eh, eh)
Under my umbrella
(Ella, ella, eh, eh, eh)
Under my umbrella
(Ella, ella, eh, eh, eh)

These fancy things, will never come in between
You''re part of my entity, here for infinity
When the war has took its part
When the world has dealt its cards
If the hand is hard, together we''ll mend your heart
Because

When the sun shine, we shine together
Told you I''ll be here forever
Said I''ll always be your friend
Took an oath and I''m stick it out till the end
Now that it''s raining more than ever
Know that we still have each other
You can stand under my umbrella
You can stand under my umbrella

(Ella, ella, ee)
Under my umbrella
(Ella, ella, eh, eh, eh)
Under my umbrella
(Ella, ella, eeh)
Under my umbrella
(Ella, ella, eh, eh, eh)

It''s raining
Ooh, baby it''s raining
You can always come into me, come into me
It''s raining
Ooh, baby it''s raining
You can always come into me, come into me
It''s raining
Ooh, baby it''s raining
You can always come into me, come into me
It''s raining
Ooh, baby it''s raining
You can always come into me, come into me', 1)
INSERT [dbo].[Videos] ([ID], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'ritnXLZHgmc', N'Monsters - Katie Sky (Lyrics + Vietsub) ♫', N'poster_2.jpg', 4, N'Katie Sky - Monsters
Original video:   

 • Katie Sky - Monst...  

🎵 Follow Top Tik Tok:
  

 / toptiktoktv​​  

🎵 Follow Katie Sky:
http://facebook.com/KatieSkyMusic
http://twitter.com/KatieSkyMusic
  

 / katieskymusic  

📸 Background: 
Artwork from (Deviantart): https://www.deviantart.com/yaphleen/a...
Artist: Yaphleen

Dear Artists, Producers and Labels! 
Top Tik Tok is a nonprofit channel for the only purpose of promoting music and artwork and learning english together, if you as an Artist/Producer/Label feels unhappy and would like to have your music/artwork taken down, please contact us via the email (toptiktok.sp@gmail.com) directly before doing anything and we will respectfully delete it immediately.

☑ We do not own the copyright for this song and artwork
☑ All rights go to their respectful owners
✉ toptiktok.sp@gmail.com ✉

_____________________________________ 
🎤 Lyrics: Monster - Katie Sky
I see your monsters I see your pain
Tell me your problems I’ll chase them away
I’ll be your lighthouse
I’ll make it okay
When I see your monsters
I’ll stand there so brave
And chase them all away

In the dark we we
We stand apart we we
Never see that the things that we need are staring right at us
You just want to hide hide hide
Hide never show your smile smile
Stand alone when you need someone it’s the hardest thing of all
That you see are the bad bad bad
Bad memories take your time and you’ll find me

I see your monsters I see your pain
Tell me your problems I’ll chase them away
I’ll be your lighthouse I’ll make it okay
When I see your monsters I’ll stand there so brave
And chase them all away

I could see the sky sky sky
Sky beautiful tonight night
When you breathe why can’t you see the clouds are in your head
I would stay there there there
There’s no need to fear fear
And when you need to talk it out with someone you can trust
What you see are the bad bad bad
Bad memories take your time and you’ll find me

I see your monsters I see your pain
Tell me your problems I’ll chase them away
I’ll be your lighthouse I’ll make it okay
When I see your monsters I’ll stand there so brave
And chase them all away
I''ll chase them all away

You''ve got the chance to see the light
Even in the darkest night
And i''ll be here like you were for me
So just let me in..

Cause I see your monsters I see your pain
Tell me your problems I’ll chase them away
I’ll be your lighthouse I’ll make it okay
When I see your monsters I’ll stand there so brave
And chase them all away

I see your monsters I see your pain
Tell me your problems I’ll chase them away
I’ll be your lighthouse I’ll make it okay
When I see your monsters I’ll stand there so brave
And chase them all away', 1)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ_User_Video]    Script Date: 4/18/2023 8:34:25 PM ******/
ALTER TABLE [dbo].[Favorites] ADD  CONSTRAINT [UQ_User_Video] UNIQUE NONCLUSTERED 
(
	[UserID] ASC,
	[VideoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Videos] ADD  CONSTRAINT [DF__Video__Views__01142BA1]  DEFAULT ((0)) FOR [Views]
GO
ALTER TABLE [dbo].[Videos] ADD  CONSTRAINT [DF__Video__Active__02084FDA]  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_User_Favorite] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_User_Favorite]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Video_Favorite] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([ID])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Video_Favorite]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_User_Share] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_User_Share]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Video_Share] FOREIGN KEY([VideoID])
REFERENCES [dbo].[Videos] ([ID])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Video_Share]
GO
USE [master]
GO
ALTER DATABASE [FpolyOE] SET  READ_WRITE 
GO
