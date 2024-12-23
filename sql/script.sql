USE [master]
GO
/****** Object:  Database [ShoeStore]    Script Date: 11/20/2024 9:21:34 PM ******/
CREATE DATABASE [ShoeStore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoeStore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoeStore.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShoeStore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\ShoeStore_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ShoeStore] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoeStore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoeStore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoeStore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoeStore] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoeStore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoeStore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoeStore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoeStore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoeStore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoeStore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoeStore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoeStore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoeStore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoeStore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoeStore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoeStore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoeStore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoeStore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoeStore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoeStore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ShoeStore] SET  MULTI_USER 
GO
ALTER DATABASE [ShoeStore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoeStore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoeStore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoeStore] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShoeStore] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ShoeStore] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ShoeStore] SET QUERY_STORE = ON
GO
ALTER DATABASE [ShoeStore] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ShoeStore]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[city] [varchar](255) NULL,
	[district] [varchar](255) NULL,
	[street] [varchar](255) NULL,
	[ward] [varchar](255) NULL,
	[userID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brand]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brand](
	[brandID] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[brandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[cartID] [int] IDENTITY(1,1) NOT NULL,
	[createAt] [datetime2](6) NULL,
	[userID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartItem]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CartItem](
	[quantity] [int] NOT NULL,
	[subTotal] [float] NOT NULL,
	[cartID] [int] NOT NULL,
	[productID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[cartID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[price] [float] NOT NULL,
	[quantity] [int] NOT NULL,
	[productID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC,
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[feeShip] [float] NOT NULL,
	[orderDate] [date] NULL,
	[shippingAddress] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[userID] [int] NULL,
	[voucherID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[paymentDate] [date] NULL,
	[status] [varchar](255) NULL,
	[orderID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[price] [float] NOT NULL,
	[productName] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[brandID] [int] NULL,
	[categoryID] [int] NULL,
	[promotionID] [int] NULL,
	[supplierID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product_ImageURL]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_ImageURL](
	[productID] [int] NOT NULL,
	[imageURL] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetail]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetail](
	[productDetailID] [int] IDENTITY(1,1) NOT NULL,
	[color] [varchar](255) NULL,
	[size] [varchar](255) NULL,
	[stockQuantity] [int] NULL,
	[productID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[productDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promotion]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promotion](
	[promotionID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[endDate] [date] NULL,
	[name] [varchar](255) NULL,
	[promotionType] [varchar](255) NULL,
	[promotionValue] [varchar](255) NULL,
	[startDate] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[promotionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Receipt]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Receipt](
	[receiptID] [int] IDENTITY(1,1) NOT NULL,
	[receiptDate] [date] NULL,
	[total] [float] NOT NULL,
	[paymentID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[receiptID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[reviewID] [int] IDENTITY(1,1) NOT NULL,
	[contents] [varchar](255) NULL,
	[createDate] [date] NULL,
	[start] [int] NOT NULL,
	[productID] [int] NULL,
	[userID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[reviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[roleID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[name] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[roleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[supplierID] [int] IDENTITY(1,1) NOT NULL,
	[address] [varchar](255) NULL,
	[supplierName] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier_PhoneNumber]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_PhoneNumber](
	[supplierID] [int] NOT NULL,
	[phoneNumbers] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[userID] [int] IDENTITY(1,1) NOT NULL,
	[CI] [varchar](255) NULL,
	[email] [varchar](255) NULL,
	[name] [varchar](255) NULL,
	[password] [varchar](255) NULL,
	[phoneNumber] [varchar](255) NULL,
	[status] [varchar](255) NULL,
	[userName] [varchar](255) NULL,
	[roleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 11/20/2024 9:21:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[voucherID] [int] IDENTITY(1,1) NOT NULL,
	[description] [varchar](255) NULL,
	[discountType] [varchar](255) NULL,
	[discountValue] [float] NULL,
	[endDate] [date] NULL,
	[minValueOrder] [float] NOT NULL,
	[name] [varchar](255) NULL,
	[startDate] [date] NULL,
	[status] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[voucherID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [UKgg1ib3htrdxlasw6ibp2r6jvp]    Script Date: 11/20/2024 9:21:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKgg1ib3htrdxlasw6ibp2r6jvp] ON [dbo].[Cart]
(
	[userID] ASC
)
WHERE ([userID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKp1s5n1slw5wba2tkdvdsvqr9i]    Script Date: 11/20/2024 9:21:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKp1s5n1slw5wba2tkdvdsvqr9i] ON [dbo].[Payment]
(
	[orderID] ASC
)
WHERE ([orderID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [UKlf2oscjlcnoex4myydprima9o]    Script Date: 11/20/2024 9:21:34 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UKlf2oscjlcnoex4myydprima9o] ON [dbo].[Receipt]
(
	[paymentID] ASC
)
WHERE ([paymentID] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Address]  WITH CHECK ADD  CONSTRAINT [FKigx6wtgagj6pe5ur2t28uvnxc] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Address] CHECK CONSTRAINT [FKigx6wtgagj6pe5ur2t28uvnxc]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FKn0ce6e7wjbk8dc70lvkifdp42] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FKn0ce6e7wjbk8dc70lvkifdp42]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FKes5uolelwbjsxng442sqd56c3] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FKes5uolelwbjsxng442sqd56c3]
GO
ALTER TABLE [dbo].[CartItem]  WITH CHECK ADD  CONSTRAINT [FKr56eqlxubob7aua02hu2998rl] FOREIGN KEY([cartID])
REFERENCES [dbo].[Cart] ([cartID])
GO
ALTER TABLE [dbo].[CartItem] CHECK CONSTRAINT [FKr56eqlxubob7aua02hu2998rl]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FKic1bk0tqco7l3ndtkel36xpcs] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FKic1bk0tqco7l3ndtkel36xpcs]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FKsak9kdv0km5hvvl6i0bnop4y0] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FKsak9kdv0km5hvvl6i0bnop4y0]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK5511tl53w1e2ecxekn1ri9t6c] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK5511tl53w1e2ecxekn1ri9t6c]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FKsr8jmdfveigad40iaml8d4jmk] FOREIGN KEY([voucherID])
REFERENCES [dbo].[Voucher] ([voucherID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FKsr8jmdfveigad40iaml8d4jmk]
GO
ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK4kigfds1u2xsya5eb94mkowyi] FOREIGN KEY([orderID])
REFERENCES [dbo].[Orders] ([orderID])
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK4kigfds1u2xsya5eb94mkowyi]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FKbqt3wvxwjh69bwfmcpbfj7mqp] FOREIGN KEY([promotionID])
REFERENCES [dbo].[Promotion] ([promotionID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FKbqt3wvxwjh69bwfmcpbfj7mqp]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FKdy51ybcflnf4vwoo6p2o1dmif] FOREIGN KEY([categoryID])
REFERENCES [dbo].[Category] ([categoryID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FKdy51ybcflnf4vwoo6p2o1dmif]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FKj0x097f8xajoy9j9ryct9pf3o] FOREIGN KEY([supplierID])
REFERENCES [dbo].[Supplier] ([supplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FKj0x097f8xajoy9j9ryct9pf3o]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FKm15t0i3hy0176l11rxsm7ow9f] FOREIGN KEY([brandID])
REFERENCES [dbo].[Brand] ([brandID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FKm15t0i3hy0176l11rxsm7ow9f]
GO
ALTER TABLE [dbo].[Product_ImageURL]  WITH CHECK ADD  CONSTRAINT [FKk8uhd68wbjwd5pjpce0soa815] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Product_ImageURL] CHECK CONSTRAINT [FKk8uhd68wbjwd5pjpce0soa815]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD  CONSTRAINT [FK1kf57sv2chfuytsg18pohx3jq] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[ProductDetail] CHECK CONSTRAINT [FK1kf57sv2chfuytsg18pohx3jq]
GO
ALTER TABLE [dbo].[Receipt]  WITH CHECK ADD  CONSTRAINT [FKj3s6w71jnv7186ugu1v2qwwij] FOREIGN KEY([paymentID])
REFERENCES [dbo].[Payment] ([paymentID])
GO
ALTER TABLE [dbo].[Receipt] CHECK CONSTRAINT [FKj3s6w71jnv7186ugu1v2qwwij]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FK4bvkldsv17wokey2gy4d8kq8s] FOREIGN KEY([userID])
REFERENCES [dbo].[Users] ([userID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FK4bvkldsv17wokey2gy4d8kq8s]
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD  CONSTRAINT [FKftgi0x4moy1aasb348go3ncdr] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Review] CHECK CONSTRAINT [FKftgi0x4moy1aasb348go3ncdr]
GO
ALTER TABLE [dbo].[Supplier_PhoneNumber]  WITH CHECK ADD  CONSTRAINT [FKpxu9ldju9avxoea958oirayjw] FOREIGN KEY([supplierID])
REFERENCES [dbo].[Supplier] ([supplierID])
GO
ALTER TABLE [dbo].[Supplier_PhoneNumber] CHECK CONSTRAINT [FKpxu9ldju9avxoea958oirayjw]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FKjf77xyg7damtm9egi39dug2os] FOREIGN KEY([roleID])
REFERENCES [dbo].[Role] ([roleID])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FKjf77xyg7damtm9egi39dug2os]
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD CHECK  (([color]='PINK' OR [color]='WHITE' OR [color]='BLACK' OR [color]='YELLOW' OR [color]='BLUE' OR [color]='GREEN' OR [color]='RED'))
GO
ALTER TABLE [dbo].[ProductDetail]  WITH CHECK ADD CHECK  (([size]='SIZE_44' OR [size]='SIZE_43' OR [size]='SIZE_42' OR [size]='SIZE_41' OR [size]='SIZE_40' OR [size]='SIZE_39' OR [size]='SIZE_38' OR [size]='SIZE_37' OR [size]='SIZE_36'))
GO
USE [master]
GO
ALTER DATABASE [ShoeStore] SET  READ_WRITE 
GO
