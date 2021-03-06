USE [master]
GO
/****** Object:  Database [THUVIEN]    Script Date: 5/12/2020 8:05:22 PM ******/
CREATE DATABASE [THUVIEN]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'THUVIEN', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\THUVIEN.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'THUVIEN_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\THUVIEN_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [THUVIEN] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [THUVIEN].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [THUVIEN] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [THUVIEN] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [THUVIEN] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [THUVIEN] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [THUVIEN] SET ARITHABORT OFF 
GO
ALTER DATABASE [THUVIEN] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [THUVIEN] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [THUVIEN] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [THUVIEN] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [THUVIEN] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [THUVIEN] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [THUVIEN] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [THUVIEN] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [THUVIEN] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [THUVIEN] SET  DISABLE_BROKER 
GO
ALTER DATABASE [THUVIEN] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [THUVIEN] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [THUVIEN] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [THUVIEN] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [THUVIEN] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [THUVIEN] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [THUVIEN] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [THUVIEN] SET RECOVERY FULL 
GO
ALTER DATABASE [THUVIEN] SET  MULTI_USER 
GO
ALTER DATABASE [THUVIEN] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [THUVIEN] SET DB_CHAINING OFF 
GO
ALTER DATABASE [THUVIEN] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [THUVIEN] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [THUVIEN] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'THUVIEN', N'ON'
GO
ALTER DATABASE [THUVIEN] SET QUERY_STORE = OFF
GO
USE [THUVIEN]
GO
/****** Object:  Table [dbo].[LoaiSach]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiSach](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaLoaiSach] [nchar](10) NOT NULL,
	[TenLoaiSach] [nvarchar](200) NULL,
	[TimeUpdate] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
 CONSTRAINT [PK_LoaiSach_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NXB]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NXB](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaNXB] [nchar](10) NOT NULL,
	[TenNXB] [nvarchar](150) NULL,
	[TimeUpdate] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
	[DiaChi] [nvarchar](150) NULL,
 CONSTRAINT [PK_NXB_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhieuMuon]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhieuMuon](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaMuon] [nchar](10) NOT NULL,
	[NguoiMuon] [int] NULL,
	[NgayMuon] [datetime] NULL,
	[NgayTra] [datetime] NULL,
	[HinhThuc] [nvarchar](150) NULL,
	[TimeUpdate] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
	[SoNgayMuon] [int] NULL,
 CONSTRAINT [PK_PhieuMuon_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sach]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sach](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaSach] [nchar](10) NOT NULL,
	[TenSach] [nvarchar](150) NULL,
	[LoaiSach] [int] NULL,
	[NamXB] [nchar](10) NULL,
	[NXB] [int] NULL,
	[TacGia] [int] NULL,
	[ViTri] [int] NULL,
	[SoLuong] [int] NULL,
	[Muon] [int] NULL,
	[NgonNgu] [nvarchar](150) NULL,
	[TimeCreate] [datetime] NULL,
	[TimeUpdate] [datetime] NULL,
 CONSTRAINT [PK_Sach_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SinhVien]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SinhVien](
	[ID] [int] NOT NULL,
	[MaSV] [nchar](10) NOT NULL,
	[Lop] [nvarchar](150) NULL,
	[TimeUpdate] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
	[HoTen] [nvarchar](150) NULL,
 CONSTRAINT [PK_SinhVien_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TacGia]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TacGia](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaTacGia] [nchar](10) NOT NULL,
	[TenTacGia] [nvarchar](150) NULL,
	[TimeUpdate] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
	[DiaChi] [nvarchar](250) NULL,
 CONSTRAINT [PK_TacGia_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NULL,
	[Username] [nchar](10) NULL,
	[TimeUpdate] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
	[Password] [nchar](100) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ViTri]    Script Date: 5/12/2020 8:05:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViTri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaViTri] [nchar](10) NOT NULL,
	[Ngan] [nvarchar](150) NULL,
	[Ke] [nvarchar](150) NULL,
	[TimeUpdate] [datetime] NULL,
	[TimeCreate] [datetime] NULL,
	[Khu] [nvarchar](150) NULL,
 CONSTRAINT [PK_ViTri_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[LoaiSach] ON 

INSERT [dbo].[LoaiSach] ([ID], [MaLoaiSach], [TenLoaiSach], [TimeUpdate], [TimeCreate]) VALUES (4, N'S001      ', N'Lập trình 001', CAST(N'2020-02-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[LoaiSach] ([ID], [MaLoaiSach], [TenLoaiSach], [TimeUpdate], [TimeCreate]) VALUES (5, N'S002      ', N'Lập trình 002', CAST(N'2020-02-03T00:00:00.000' AS DateTime), NULL)
INSERT [dbo].[LoaiSach] ([ID], [MaLoaiSach], [TenLoaiSach], [TimeUpdate], [TimeCreate]) VALUES (6, N'S003      ', N'Lập trình 003', CAST(N'2020-02-03T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[LoaiSach] OFF
SET IDENTITY_INSERT [dbo].[NXB] ON 

INSERT [dbo].[NXB] ([ID], [MaNXB], [TenNXB], [TimeUpdate], [TimeCreate], [DiaChi]) VALUES (1, N'NXB001    ', N'Thai Binh', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NXB] OFF
SET IDENTITY_INSERT [dbo].[PhieuMuon] ON 

INSERT [dbo].[PhieuMuon] ([ID], [MaMuon], [NguoiMuon], [NgayMuon], [NgayTra], [HinhThuc], [TimeUpdate], [TimeCreate], [SoNgayMuon]) VALUES (1, N'PM001     ', 1, CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(N'2020-03-04T00:00:00.000' AS DateTime), N'Muon Tai Cho', CAST(N'2002-02-03T00:00:00.000' AS DateTime), CAST(N'2020-02-04T00:00:00.000' AS DateTime), 60)
INSERT [dbo].[PhieuMuon] ([ID], [MaMuon], [NguoiMuon], [NgayMuon], [NgayTra], [HinhThuc], [TimeUpdate], [TimeCreate], [SoNgayMuon]) VALUES (2, N'PM002     ', 2, CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(N'2020-03-04T00:00:00.000' AS DateTime), N'Muon TOnline', CAST(N'2020-03-04T00:00:00.000' AS DateTime), NULL, 30)
SET IDENTITY_INSERT [dbo].[PhieuMuon] OFF
SET IDENTITY_INSERT [dbo].[Sach] ON 

INSERT [dbo].[Sach] ([ID], [MaSach], [TenSach], [LoaiSach], [NamXB], [NXB], [TacGia], [ViTri], [SoLuong], [Muon], [NgonNgu], [TimeCreate], [TimeUpdate]) VALUES (1, N'MS001     ', N'Lap Trinh OOP', 4, N'2017      ', 1, NULL, NULL, 2, NULL, N'Anh', CAST(N'2020-02-04T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Sach] OFF
INSERT [dbo].[SinhVien] ([ID], [MaSV], [Lop], [TimeUpdate], [TimeCreate], [HoTen]) VALUES (1, N'SV1       ', N'Lop 001', CAST(N'2020-02-03T00:00:00.000' AS DateTime), NULL, N'Trần Văn E')
INSERT [dbo].[SinhVien] ([ID], [MaSV], [Lop], [TimeUpdate], [TimeCreate], [HoTen]) VALUES (2, N'SV2       ', N'Lop 002', CAST(N'2020-02-03T00:00:00.000' AS DateTime), NULL, N'Nguyễn Thị Linh')
SET IDENTITY_INSERT [dbo].[TacGia] ON 

INSERT [dbo].[TacGia] ([ID], [MaTacGia], [TenTacGia], [TimeUpdate], [TimeCreate], [DiaChi]) VALUES (1, N'TG001     ', N'Nguyên Văn A', CAST(N'2002-02-03T00:00:00.000' AS DateTime), NULL, N'Nha Trang')
SET IDENTITY_INSERT [dbo].[TacGia] OFF
SET IDENTITY_INSERT [dbo].[ViTri] ON 

INSERT [dbo].[ViTri] ([ID], [MaViTri], [Ngan], [Ke], [TimeUpdate], [TimeCreate], [Khu]) VALUES (1, N'VT001     ', N'Ngan 01', N'Ke 01', CAST(N'2020-02-03T00:00:00.000' AS DateTime), CAST(N'2020-02-04T00:00:00.000' AS DateTime), N'Khu 1')
SET IDENTITY_INSERT [dbo].[ViTri] OFF
ALTER TABLE [dbo].[LoaiSach] ADD  CONSTRAINT [DF_LoaiSach_TimeUpdate]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[NXB] ADD  CONSTRAINT [DF_NXB_TimeUpdate]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[PhieuMuon] ADD  CONSTRAINT [DF_PhieuMuon_TimeUpdate]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_SoLuong]  DEFAULT ((0)) FOR [SoLuong]
GO
ALTER TABLE [dbo].[Sach] ADD  CONSTRAINT [DF_Sach_NgayTao]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[SinhVien] ADD  CONSTRAINT [DF_SinhVien_TimeUpdate]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[TacGia] ADD  CONSTRAINT [DF_TacGia_TimeUpdate]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_TimeUpdate]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[ViTri] ADD  CONSTRAINT [DF_ViTri_TimeUpdate]  DEFAULT (getdate()) FOR [TimeUpdate]
GO
ALTER TABLE [dbo].[PhieuMuon]  WITH CHECK ADD  CONSTRAINT [FK_PhieuMuon_SinhVien] FOREIGN KEY([NguoiMuon])
REFERENCES [dbo].[SinhVien] ([ID])
GO
ALTER TABLE [dbo].[PhieuMuon] CHECK CONSTRAINT [FK_PhieuMuon_SinhVien]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_LoaiSach] FOREIGN KEY([LoaiSach])
REFERENCES [dbo].[LoaiSach] ([ID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_LoaiSach]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_NXB] FOREIGN KEY([NXB])
REFERENCES [dbo].[NXB] ([ID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_NXB]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_PhieuMuon] FOREIGN KEY([Muon])
REFERENCES [dbo].[PhieuMuon] ([ID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_PhieuMuon]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_TacGia] FOREIGN KEY([TacGia])
REFERENCES [dbo].[TacGia] ([ID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_TacGia]
GO
ALTER TABLE [dbo].[Sach]  WITH CHECK ADD  CONSTRAINT [FK_Sach_ViTri] FOREIGN KEY([ViTri])
REFERENCES [dbo].[ViTri] ([ID])
GO
ALTER TABLE [dbo].[Sach] CHECK CONSTRAINT [FK_Sach_ViTri]
GO
USE [master]
GO
ALTER DATABASE [THUVIEN] SET  READ_WRITE 
GO
