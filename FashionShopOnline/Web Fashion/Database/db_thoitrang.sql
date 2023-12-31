use master
go
if exists (select * from sys.databases where name='db_thoitrang')
drop database db_thoitrang
go

create database db_thoitrang
go

USE [db_thoitrang]
GO
/****** Object:  StoredProcedure [dbo].[add_hinhanh]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[add_hinhanh]
@tenhinhanh nvarchar(100),
@idproduct int
as 
insert into HinhAnh values(@tenhinhanh, @idproduct)


GO
/****** Object:  StoredProcedure [dbo].[add_sanpham_kichthuoc]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[add_sanpham_kichthuoc]
@idproduct int,
@idsize int
as
insert into SanPham_KichThuoc values(@idproduct, @idsize)


GO
/****** Object:  StoredProcedure [dbo].[add_sanpham_mausac]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[add_sanpham_mausac]
@idproduct int,
@idcolor int
as
insert into SanPham_MauSac values(@idproduct, @idcolor)


GO
/****** Object:  StoredProcedure [dbo].[delete_product]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[delete_product]
@id int
as
delete from SanPham_MauSac where MaSP = @id
delete from SanPham_KichThuoc where MaSP = @id
delete from BinhLuan where MaSP = @id
delete from ChiTietDonHang where MaSP = @id
delete from HinhAnh where MaSP = @id
delete from SanPham where MaSP = @id

GO
/****** Object:  StoredProcedure [dbo].[list_color]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[list_color]
@id int
as
select MauSac.MaMau, TenMau 
from MauSac, SanPham_MauSac
where MauSac.MaMau = SanPham_MauSac.MaMau and SanPham_MauSac.MaSP = @id

GO
/****** Object:  StoredProcedure [dbo].[list_size]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create proc [dbo].[list_size]
@id int
as
select KichThuoc.MaSize, TenSize
from KichThuoc, SanPham_KichThuoc
where KichThuoc.MaSize = SanPham_KichThuoc.MaSize and SanPham_KichThuoc.MaSP = @id

GO
/****** Object:  Table [dbo].[BaiViet]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiViet](
	[MaBaiViet] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](50) NULL,
	[HinhAnhBaiViet] [nvarchar](100) NULL,
	[NgayDangBaiViet] [smalldatetime] NULL,
	[NoiDung] [ntext] NULL,
	[MoTa] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBaiViet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[HoTenNBL] [nvarchar](100) NULL,
	[NgayGio] [smalldatetime] NULL,
	[NoiDung] [nvarchar](300) NULL,
	[TrangThai] [bit] NULL,
	[MaSP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BoSuuTap]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BoSuuTap](
	[MaBST] [int] IDENTITY(1,1) NOT NULL,
	[TenBST] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBST] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[MaMau] [int] NOT NULL,
	[MaSize] [int] NOT NULL,
	[DonGia] [int] NULL,
	[SoLuong] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC,
	[MaMau] ASC,
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhMucSP]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMucSP](
	[MaDanhMucSP] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMucSP] [nvarchar](50) NULL,
	[MaDanhMucSPCha] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDanhMucSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [smalldatetime] NULL,
	[NgayGiaoHang] [smalldatetime] NULL,
	[MaKhachHang] [int] NULL,
	[TinhTrangGiaoHang] [bit] NULL,
	[GhiChu] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hang]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hang](
	[MaHang] [int] IDENTITY(1,1) NOT NULL,
	[TenHang] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HinhAnh]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HinhAnh](
	[MaHinhAnh] [int] IDENTITY(1,1) NOT NULL,
	[TenHinhAnh] [nvarchar](100) NULL,
	[MaSP] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaHinhAnh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KichThuoc]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KichThuoc](
	[MaSize] [int] IDENTITY(1,1) NOT NULL,
	[TenSize] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[TenKhachHang] [nvarchar](100) NULL,
	[TenDangNhap] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[DiaChi] [nvarchar](100) NULL,
	[SoDienThoai] [varchar](11) NULL,
	[Email] [nvarchar](100) NULL,
	[PhanLoai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MauSac]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MauSac](
	[MaMau] [int] IDENTITY(1,1) NOT NULL,
	[TenMau] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuanTriVien]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuanTriVien](
	[MaAdmin] [int] IDENTITY(1,1) NOT NULL,
	[TenAdmin] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[TaiKhoan] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NULL,
	[PhanLoai] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaAdmin] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[QuangCao]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuangCao](
	[MaQuangCao] [int] IDENTITY(1,1) NOT NULL,
	[HinhAnhQC] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaQuangCao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](100) NULL,
	[GiaSP] [int] NULL,
	[GiaKhuyenMai] [int] NULL,
	[NgayCapNhat] [smalldatetime] NULL,
	[MoTa] [ntext] NULL,
	[HinhAnhSP] [nvarchar](50) NULL,
	[SoLuong] [int] NULL,
	[MaDanhMucSP] [int] NULL,
	[MaHang] [int] NULL,
	[MaBST] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham_KichThuoc]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_KichThuoc](
	[MaSP] [int] NOT NULL,
	[MaSize] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaSize] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SanPham_MauSac]    Script Date: 02/10/2022 11:51:41 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham_MauSac](
	[MaSP] [int] NOT NULL,
	[MaMau] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC,
	[MaMau] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BaiViet] ON 

INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [HinhAnhBaiViet], [NgayDangBaiViet], [NoiDung], [MoTa]) VALUES (1, N'Viết blog về thời trang, tại sao không?', N'/Data/images/Article/news1.jpg', CAST(0xA613050D AS SmallDateTime), N'<div style="font-size: 13.3333px;"><font face="Arial, Verdana">Nếu thật sự ấp ủ niềm đam mê với một blog thời trang, bạn đang bước vào một cuộc chiến rất ác liệt và cam go đến mức bạn phải chiến đấu thật bền bỉ để tìm được chỗ đứng, tương tự như các chủ đề làm blog khác như du lịch, âm nhạc, thể thao,…</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Một vài điều bạn cần lưu ý</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">1: Tên miền thật “kêu” và host riêng</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Không nên chơi blog trên Tumblr hay Blogger. Mặc dù đây là các công cụ hữu hiệu để phát triển blog hay trang web cá nhân nhưng lại không tạo được thương hiệu riêng. Và nếu bạn muốn thực sự tạo ra một thương hiệu cũng như sự nghiệp thời trang của riêng mình thì lời khuyên chân thành là hãy tạo domain và host trên WordPress. Đây cũng là lối mòn thành công mà nhiều blogger đình đám đã áp dụng.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">2: Đi tìm phong cách riêng</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Như đã đề cập ở phần đầu, cái bạn cần là sự khác biệt. Nếu không gây được ấn tượng đặc trưng với người đọc cũng như tạo được phong thái riêng cho trang blog của mình, chắc chắn bạn sẽ chìm nghỉm giữa hàng tá blog thời trang đã và đang tung hoành. Bạn có muốn thế không?</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">3: Nội dung hoàn hảo</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Một khi đã tạo được trang web và bắt đầu viết, hãy tránh những thứ vớ vẩn ra, đừng chỉ vì lời mời gọi của mấy cô bạn thân với vài cốc latte ngọt ngào mà múa may có 5 phút cho ra một bài viết tệ hại. Blog cần sự đầu tư. Ngay bản thân tôi, để có một bài viết ưng ý tôi thường mất 2 tới 3 ngày để hoàn thành. Đừng quên, não bạn phải tư duy liên tục không ngừng nghỉ.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">4: Cánh tay phải: mạng xã hội</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Đừng ngại kết bạn qua mạng xã hội. Đặc biệt là các blogger nổi tiếng, những người có cùng giọng văn với bạn, và các độc giả, những người đã luôn ủng hộ và theo dõi những bài viết của bạn. Đây gọi là mailing list và sân chơi kiểu này gọi là Google+.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Tại sao bạn cần khác biệt?</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Nếu bạn đã bắt tay ngay vào những dòng đầu tiên của blog, ổn thôi, vì trong đó, tôi thấy lửa và nhiệt huyết của bạn.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Nhưng dừng lại đã, hãy đọc vài điều sau đây để nắm được chìa khóa thành công trong giới blog.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Khác biệt tức là tồn tại</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Hơi ảo nhưng sự thật đúng là như vậy. Nếu trang blog của bạn trông na ná những blog khác (du lịch, thể thao, âm nhạc) thì bạn sẽ chẳng mấy chốc mà chán nản rồi bỏ cuộc mà thôi.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Mặt khác, nếu bạn đã tìm được lối đi riêng, và bắt tay ngay vào việc tạo ra sự khác biệt để tạo dựng thương hiệu cũng như tuyên bố với khách hàng rằng tại sao thương hiệu của bạn khác biệt, thì xin chúc mừng, bạn đang đi đúng đường rồi đấy. Và hướng đi này vô cùng quan trọng.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Vì sao? Ví dụ nhé. Bạn có thể nghĩ ra một cái tên thật ngầu, thật chất cho blog của mình, hoặc một nội dung đặc sắc nào đó mà blog của bạn truyền đạt được. Độc giả sẽ hashtag cái tên đó lên Twitter hoặc Facebook, cùng với caption khen lấy khen để ý tưởng của bạn. Haha, đó chính là một nhân tố quan trọng giúp phát triển trang blog của bạn đấy.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Vậy thì, bí kíp là gì?</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana"><br></font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Đặt hình đại diện là ảnh chụp chính bạn: Bạn sẽ tạo nên một trang blog đình đám (biết đâu đấy).</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Lồng câu chuyện của bản thân vào bài viết: Tại sao bạn biết blog? Tại sao mọi người lắng nghe bạn? Kể cho họ câu chuyện của bạn, kể cả khi nó dài lê thê.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Xây dựng thương hiệu cá tính, mạnh mẽ và khác biệt: Thương hiệu không chỉ là logo, mà là tất cả những gì bạn làm, bạn viết. Mọi người đánh giá con người bạn cũng chính vì thế. Hãy chắc chắn rằng tên bạn, logo, thiết kế cũng như phong cách của trang blog đều có sự liên kết mật thiết và phối hợp hài hòa để tạo nên sự khác biệt.</font></div><div style="font-size: 13.3333px;"><font face="Arial, Verdana">Chấp nhận rủi ro: Đừng sợ rủi ro. Nói về những thứ mà bạn phiền lòng, những thứ ảnh hưởng xấu tới bạn, chẳng có gì là sai cả, như thế mới không dìm bạn giữa hàng triệu trang blog khác. Và đây cũng là vấn đề trăn trở của nhiều bloggers.</font></div>', N'Tại sao bạn cần khác biệt? Nếu bạn đã bắt tay ngay vào những dòng đầu tiên của blog, ổn thôi, vì trong đó, tôi thấy lửa và nhiệt huyết của bạn.')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [HinhAnhBaiViet], [NgayDangBaiViet], [NoiDung], [MoTa]) VALUES (2, N'Những mặt hàng giảm giá ', N'/Data/images/Article/news2.jpg', CAST(0xA613050E AS SmallDateTime), N'<p style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Trong ngày Black Friday năm nay, các thương hiệu đều đồng loạt đưa ra những chương trình khuyến mãi hấp dẫn. Các sản phẩm được giảm giá “kịch sàn”, thu hút sự quan tâm của nhiều tín đồ mua sắm.</span><o:p></o:p></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Cũng tương tự như những ngày giáp Tết ở Việt Nam, không khí mua sắm trong “ngày vàng mua sắm” Black Friday rất tấp nập và náo nhiệt. Đây là dịp mua sắm lớn nhất trong dịp cuối năm nhằm chuẩn bị cho ngày Noel và Tết dương lịch.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Theo thống kê hàng năm trên Bloomberg, vào những ngày này các doanh nghiệp nước ngoài không bao giờ bỏ lỡ cơ hội “vàng” để tăng doanh số bán hàng và tiêu thụ nhiều sản phẩm nhất. Do vậy, họ ồ ạt tung ra các chương trình khuyến mãi hấp dẫn, thu hút khách hàng.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Tại Việt Nam các doanh nghiệp cũng nhân ngày Black Friday này để tung ra những chiêu khuyến mãi “khủng”, nhằm thỏa mãn “cơn khát” mua sắm của các tín đồ shopping.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Thông tin trên báo Đời sống &amp; Pháp luật, ngay tại thời điểm này, không khí mua sắm ngày Black Friday tại Trung tâm thương mại Vincom đang rất náo nhiệt. Có tới hơn 350 thương hiệu thời trang, phụ kiện đồng loạt tham gia đợt giảm giá kỷ lục, với mức giá khuyến mãi lên tới 50%+.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Cụ thể :<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NIKE (Tầng 1) giảm giá từ 30-50%, từ 21-29/11.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Pantio (Tầng 1) giảm giá đến 50% toàn bộ sản phẩm, từ 21-30/11.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Samsonite (Tầng 1) giảm 30-50% toàn bộ sản phẩm, từ 21-29/11.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Surfer Paradise (Tầng 1) giảm 40% toàn bộ sản phẩm, từ nay đến 30/11.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Adidas (Tầng 2) giảm đến 50% cho một số sản phẩm, từ nay đến 30/11.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lare Boss (Tầng 2) giảm đến 50% toàn bộ sản phẩm, từ 21-29/11.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; San-Kelloff (Tầng 2) giảm đến 50% toàn bộ sản phẩm, từ 21-29/11.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Bên cạnh đó thương hiệu đồng hồ thời trang GALLE WATCH cũng nhân dịp Black Friday 2015 tung ra đợt khuyến mãi giảm giá 20-50%, áp dụng trong ngày thứ 6 (27/11/2015).<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Hàng trăm thương hiệu nổi tiếng thế giới bán sản phẩm tại hệ thống Vincom cũng đồng loạt tham gia chương trình giảm giá, nổi bật như thương hiệu Mango, Nine West, FCUK, Ecco, Adidas,…&nbsp; Trong số đó, nhãn hàng FCUK đã “mạnh tay” chuẩn bị hẳn một khu vực bán sản phẩm đồng giá 99.000 đồng để phục vụ khách hàng.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Mùa Black Friday năm nay, Apple giảm gía mạnh sản phẩm iPad Air 2, khách hàng sẽ được hưởng mức chiết khấu 40% khi mua hàng chính hãng.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Tâm điểm trong đợt mua sắm cuối năm luôn là các sản phẩm làm đẹp, song song bên cạnh quần áo thời trang. Tỷ lệ giảm giá của các mặt hàng này lên tới 26%, mức giảm này cao hơn so với năm ngoái, chỉ 15%. Một số cửa hàng như The Body Shop, Sephora, Victoria’s Secret có chương trình khuyến mãi độc “mua 1, tặng 1” hay bán sản phẩm đồng giá dưới 10 USD.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Các mặt hàng điện tử là sản phẩm chiếm tới 50% tổng số đơn đặt hàng tại các trang mua bán trực tuyến. Vì lượng khách đặt mua quá nhiều nên đôi khi lượng hàng điện tử tồn trong kho không đủ để cung cấp cho các khách hàng.<o:p></o:p></span></p><p style="font-size: 13.3333px; line-height: 17.25pt; text-rendering: optimizeLegibility; -webkit-font-smoothing: antialiased; text-shadow: rgba(0, 0, 0, 0.00392157) 1px 1px 1px;"><span style="font-size: 11.5pt; font-family: Arial, sans-serif;">Một số mặt hàng trong ngành hàng thực phẩm cũng được giảm giá. Điển hình như trà túi hiệu Teavan và Harney &amp; Sons giảm giá tới 25%. Thức phẩm Omaha Steaks có mức chiết khấu lên tới 72%.&nbsp;</span></p>', N'Trong ngày Black Friday năm nay, các thương hiệu đều đồng loạt đưa ra những chương trình khuyến mãi hấp dẫn')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [HinhAnhBaiViet], [NgayDangBaiViet], [NoiDung], [MoTa]) VALUES (3, N'Từ cậu bé nghèo khổ thành tỷ phú thời trang', N'/Data/images/Article/news3.jpg', CAST(0xA613050E AS SmallDateTime), N'<p class="MsoNormal" style="font-size: 13.3333px;"><span style="font-family: notib, arial; font-size: 15px; line-height: 23px;">Mơ ước thành triệu phú từ bé</span></p><p class="MsoNormal" style="font-size: 13.3333px; margin-bottom: 0.0001pt;"><span times="" new="" roman";mso-hansi-font-family:arial;mso-bidi-font-family:arial;="" mso-fareast-language:vi"="" style="font-size: 11.5pt;">Sinh ngày 14/10/1939 tại The Bronx New York (Mỹ), Ralph Lifshitz là con út trong gia đình gốc Do Thái. Lớn lên trong cảnh nghèo khó nên ông đã có tinh thần tự lập và có ý chí phấn đẩu riêng từ rất sớm.</span><span times="" new="" roman","serif";mso-fareast-font-family:="" "times="" roman";mso-fareast-language:vi"="" style="font-size: 12pt;"><o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span times="" new="" roman";mso-hansi-font-family:arial;="" mso-bidi-font-family:arial;mso-fareast-language:vi"="" style="font-size: 11.5pt;">Gia đình ông vốn có truyền thống nghệ thuật, cha là họa sỹ vẽ tranh tường Frank Lifshitz nên từ bé Ralph đã thích làm đỏm và sớm có khiếu thời trang. Để có tiền mua những bộ vest bảnh báo cậu bé Ralph ngày nào đã nghĩ cách đi buôn và kinh doanh. Tại trường Marsha Stern Talmudical Academy, Ralph nổi tiếng với việc bán nơ cài áo và cà vạt cho các bạn trong lớp, Ralph kiếm được một khoản kha khá từ phi vụ kinh doanh này khi mỗi chiếc cà vạt thiết kế chỉ có giá 5 USD và được cậu bán ra với giá 15 USD.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span times="" new="" roman";mso-hansi-font-family:arial;="" mso-bidi-font-family:arial;mso-fareast-language:vi"="" style="font-size: 11.5pt;">Ngoài ra, vào mùa hè cậu cũng tranh thủ làm thêm ở các cửa hàng bách hóa tại New York. Chính vì chăm chỉ như vậy nên dù mới 12 tuổi nhưng cậu đã có thể tự tay sắm những bộ quần áo “xịn” nhất so với các bạn cùng lớp.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span times="" new="" roman";mso-hansi-font-family:arial;="" mso-bidi-font-family:arial;mso-fareast-language:vi"="" style="font-size: 11.5pt;">Tuy nhiên với xuất thân cũng như gốc gác nhạy cảm của mình Ralph Lifshitz luôn bị bạn bè trêu chọc, vào năm 16 tuổi ông quyết định đổi tên từ Lipschitz thành Lauren. Theo thông tin trên tờ Business Insider, ông đã từng tâm sự với “nữ hoàng truyền hình Mỹ” Oprah Winfrey: " Sau này, có người nói tôi đổi tên để chối bỏ nguồn gốc Do Thái, tôi khẳng định là tuyệt đối không. Các anh chị em họ của tôi ở California cũng đã đổi họ thành Lawrence. Vì vậy, tôi nghĩ mình sẽ phải chọn một cái họ đẹp hơn".<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span times="" new="" roman";mso-hansi-font-family:arial;="" mso-bidi-font-family:arial;mso-fareast-language:vi"="" style="font-size: 11.5pt;">Vào năm 1957, Ralp đã từng viết trong cuốn kỷ yếu của trường trung học DeWitt Clinton về mục tiêu của cuộc đời ông là trở thành một triệu phú thế giới. Thậm chí cậu bé ngày ấy còn viết ngay trong quyển sách Clinton của mình là: “ Tôi muốn trở thành triệu phú”.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span times="" new="" roman";mso-hansi-font-family:arial;="" mso-bidi-font-family:arial;mso-fareast-language:vi"="" style="font-size: 11.5pt;">Ralph Lauren cũng có khoảng thời gian 2 năm học kinh doanh tại Đại học Baruch nhưng đã ngừng học giữa chừng và lựa chọn con đường quân ngũ trong khoảng từ 1962 đến năm 1964.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; margin-bottom: 0.0001pt; line-height: 17.25pt;"><span times="" new="" roman";mso-hansi-font-family:arial;="" mso-bidi-font-family:arial;mso-fareast-language:vi"="" style="font-size: 13.5pt;">Ông hoàng thời trang thế giới<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span times="" new="" roman";mso-hansi-font-family:arial;="" mso-bidi-font-family:arial;mso-fareast-language:vi"="" style="font-size: 11.5pt;">Sau khi xuất ngũ, Ralph Lauren làm thêm công việc bán găng tay và xin được một chân thư ký của hàng &nbsp;Brooks Brothers. Tuy nhiên công việc này không kéo dài được lâu, sau đó ông xin làm nhân viên bán hàng tại công ty cà vạt Rivetz.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; margin-bottom: 0.0001pt;"><span times="" new="" roman";mso-hansi-font-family:arial;mso-bidi-font-family:arial;="" mso-fareast-language:vi"="" style="font-size: 12pt;">Vào năm 1966, chàng thanh niên 26 tuổi Ralp Lauren sau nhiều thời gian tiếp xúc với thời trang cà vạt cũng như nhìn thấy cà vạt của diễn viên Douglas Fairbanks Jr sử dụng đã tự sáng tạo ra mẫu cà vạt bản rộng, màu sắc sáng theo phong cách châu Âu. Tuy nhiên ý tưởng mới lạ này nhanh chóng bị từ chối.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt;">Từ đó Ralph Lauren quyết định nghỉ việc, tách ra và xây dựng công việc kinh doanh riêng. Ông bắt đầu khởi nghiệp với thời trang cà vat. Không học qua một lớp thiết kế nào nhưng Ralph tự tin với khả năng sáng tạo và đôi bàn tay tài hoa, chính tay ông đã thiết kế ra những chiếc cà vạt từ những mảnh vải vụn. Khách hàng đầu tiên của ông chỉ là các cửa hàng nhỏ ở New York cho đến khi ông tiếp cận được với Neiman Marcus, chủ thương hiệu bán lẻ hàng xa xỉ, chính Neiman đã mua của Ralph Lauren hơn 1.000 chiếc cà vạt. Đây là bước ngoặt đầu tiên trong con đường kinh doanh của ông. Từ việc bán mẫu cà vạt bản rộng, nhiều màu sắc vào thời thời điểm mẫu cà vạt bản hẹp và trơn đang thịnh hành ông đã thu về 500.000 USD.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt;">Năm 1970, ông giành được giải thưởng Coty cho dòng trang phục nam. Cũng trong thời điểm đó ông trình làng thêm trang phục nữ giới theo phong cách suit cổ điển của đàn ông.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt;">Đến năm 1972, nhà thiết kế Ralph Lauren tiếp tục tung ra một loạt mẫu áo thun ngắn tay cho nữ giới. Đây chính là bộ sưu tập 24 sắc màu dành cho nữ đầu tiên của ông, nó đã nhanh chóng chiếm lĩnh thị trường và trở thành trang phục cơ bản cho phái đẹp.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt;">Được sự ủng hộ tài chính từ công ty sản xuất quần áo Norman Hilton, ông mở một cửa hàng chuyên bán cà vạt do ông thiết kế lấy nhãn hiệu là “Polo”, sản phẩm mang hơi hướng thể thao nhưng không kém phần thanh lịch của ông bán rất chạy trên toàn nước Mỹ và các nước lân cận. Tới năm 2010, ông đã nắm trong tay 631 cửa hàng kinh doanh và 19.000 nhân viên trên toàn thế giới. Ông nổi tiếng với những trang phục được thiết kế trang nhã, sang trọng cho cả nam và nữ, ông còn có dòng nước hoa, nội thất sang trọng. Ralph cũng là nhà thiết kế quen thuộc của đội tuyển Olympic Mỹ.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt;">Nổi tiếng là một nhà thiết kế luôn giữ được chất riêng của mình nhưng không hề cổ hủ, ông luôn nhanh nhạy nắm bắt thị hiếu của người tiêu dùng. Thiết kế của ông lấy được cảm tình của những nhan sắc trong dòng tộc hoàng gia như Công nương Dianan, Công nương xứ Monaco Charlene, và cả những người đẹp trong làng giải trí Hollywood.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px; line-height: 17.25pt;"><span style="font-size: 11.5pt;">Tính đến thời điểm hiện tại, tỷ phú thời trang thế giới 75 tuổi Ralph Lauren đã tận hưởng thành công tại ngôi nhà ở Jamaica, Long Island, Bedford, Manhattan và trang trại 17.000 mẫu Anh ở Colorado. Ông nắm trong tay khối tài sản trị giá 7 tỷ USD.&nbsp;</span></p>', N'Không bằng Đại học, không vốn liếng, chàng trai gốc Do Thái Ralph Lipschitz đã vươn lên thành tỷ phú thế giới Ralph Lauren nắm trong tay')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [HinhAnhBaiViet], [NgayDangBaiViet], [NoiDung], [MoTa]) VALUES (4, N'Thời trang thu đông: Không chỉ là mặc ấm', N'/Data/images/Article/news4.jpg', CAST(0xA613050E AS SmallDateTime), N'<p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Tất cả chúng ta đều thích mặc đẹp mọi lúc, mọi nơi. Nhưng mong ước này sẽ trở lên khó khăn hơn khi thời tiết giao mùa và chuyển lạnh vì ưu tiên hàng đầu của chúng ta lúc này là mặc để giữ ấm cơ thể. Việc phải mặc thêm các loại quần áo thu đông (áo khoác, áo len, áo choàng...) và phụ kiện (găng tay, mũ, khăn) để...chống rét chắc chắn sẽ khiến bạn trở lên nặng nề và mất đi vẻ hấp dẫn thường thấy.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Nhưng bạn đừng buồn nhé. Mọi vấn đề đều có thể giải pháp của nó. Nếu biết cách chọn và kết hợp trang phục, bạn có thể diện những trang phục đẹp mà vẫn giữ âm được cơ thể trong thời tiết mùa đông giá lạnh.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Các bí quyết về phong cách thời trang thu đông dưới đây sẽ giúp bạn mặc đẹp và luôn ấm áp trong những ngày thu đông lạnh giá.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">1. Hãy bắt đầu từ những thứ cơ bản nhất...<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Không quá cầu kỳ và phức tạp khi mỗi chúng ta đều đã sẵn sàng sống trong những ngày lạnh giá cùng đủ loại quần áo và phụ kiện giữ ấm. Thời trang thu đông từ trước đến nay vẫn không có quá nhiều sự thay đổi. Những trang phục và phụ kiện được coi là "kinh điển" thì vẫn luôn có chỗ đứng vững chắc trong "làng mốt".<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">2. Kết hợp trang phục theo phong cách layer<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Layer (tạm dịch là tầng lớp) là một phong cách ăn mặc rất được ưa chuộng của "làng mốt", đặc biệt là ki nhắc đến thời trang thu đông. Hiểu nôm na thì "Layer" có nghĩa là người mặc sẽ sử dụng từ 2 đến 3 trang phục cùng lúc trong một bộ đồ. Ví dụ, các bạn có thể mặc một chiếc áo thun dài tay bên trong áo len hoặc áo cardigan. Hay mặc quần tất bên trong quần Jeans và quần khaki. Cuối cùng là khoác thêm một chiếc áo khoác măng-tô dáng dài đến gối. Style này có tác dụng giữ nhiệt, giúp bạn luôn cảm thấy ấm áp trong nhũng ngày đông lạnh giá.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Một sai lầm mà nhiều bạn thường mắc phải khi lựa chọn phong cách layer là mặc quá nhiều lớp đồ. Như đã đề cập ở trên thì bạn chỉ nên mặc từ 2-3 trang phục mà thôi. Việc mặc quá lớp quần áo khiến bộ đồ của bạn trở lên bị dày và gây sự bức bối. Bạn nên lựa chọn những loại vải có khả năng giữ nhiệt tốt như len, polyeste và các loại sợi tổng hợp dày. Hạn chế mặc cotton vì chất liệu này không phù hợp cho việc giữ ấm.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">3. Mặc áo then dáng thụng<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Những trang phục có dáng ôm không giữ nhiệt tốt bằng những sản phẩm cùng loại có dáng thụng. Vậy nên, bạn chỉ nên mặc những chiếc áo len ôm sát cơ thể trong tiết trời se lạnh của mùa thu. Còn khi trời đã vào đúng đông thì chúng ta nên bổ sung thêm cho mình các loại áo len dệt kim, áo len lông cừu và áo hoodie ấm áp. Nếu mặc áo hoodie chui đầu thì bạn nên mặc trước từ 1-2 lớp áo bên trong để giữ ấm.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">4. Mua găng tay, khăn và mũ<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Việc di chuyển ngoài trời trong những ngày gió rét là không tránh khỏi nên để việc giữ ấm cơ thể được triệt để nhất thì các bạn đững quên "tậu" cho mình những món phụ kiện không thể thiếu dưới đây:&nbsp;<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Đầu tiên là găng tay. Bạn nên mua những loại găng tay xỏ ngón để việc cầm, nắm đồ vật được dễ dàng nhất. Chất liệu phổ biến nhất của các sản phẩm này thường là bằng len và da Trên thị trường còn xuất hiện loại găng hở ngón thời trang, cá tính. Bạn có thể chọn mua nếu chúng phù hợp với nhu cầu sử dụng của mình.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Tiếp đến là khăn. Chúng ta có thể lựa chọn tùy ý giữa khăn len đan móc thủ công hoặc khăn len dệt kim. Thỉnh thoảng, bạn có thể quàng những chiếc khăn mỏng bên trong áo jacket hoặc sử dụng khăn dày khi phải ra ngoài. Nhiều người có xu hướng sử dụng khăn như một phụ kiện để tạo điểm nhấn cho bộ trang phục. Nếu vậy thì bạn nên lựa chọn các sản phẩm có tính trang trí cao và được làm từ các chất liệu dày dặn.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Tiết trời se lạnh của mùa thu và sự rét buốt của mùa đông sẽ không "xi-nhê" tới bạn nếu chúng ta có những đôi bốt ấm áp. Ngoài việc giữ ấm tốt thì các loại bốt ngày nay còn rất thời trang và đẹp mắt. Bạn có thể lựa chọn loại bốt cổ thấp hoặc cổ cao tùy thuộc vào phong cách ăn mặc của mình. Lưu ý nhỏ là bạn nên cho quần vào trong bốt để tăng thêm sự ấm áp cho cơ thẻ.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Phụ kiện cuối cùng là mũ. Mũ thu đông có nhiều loại, nhưng bạn nên ưu tiên mua các sản phẩm có khả năng che chắn cho đôi tai của mình vì đây là bộ phận rất nhạy cảm với sự giá lạnh trong mùa thu đông.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">5. Sử dụng thêm khăn choàng, chăn hoặc nêm (nếu cần thiết)<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Những loại chăn dệt kim làm bằng len, polyeste hoặc nhung có khả năng giữ ấm rất tốt và bạn nên sử dụng chúng khi ở trong nhà hoặc ra ngoài. Những loại nêm chất liệu polyeste mềm, thoải mái và rất sang trọng chắc chắn sẽ bảo vệ bạn khỏi những gió lạnh mùa đông.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">6. Mặc váy và đầm<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Phái đẹp yêu váy và thích mặc trang phục này, cho dù thời tiết hôm đó có rét buốt như thế nào đi nữa. Mặc đẹp váy không khó và thời tiết như nào thì sẽ có cách mix đồ nấy. Khi nhắc đến thời trang thu đông, những bí quyết giữ ấm sau đây chắc chắn sẽ giúp bạn gái tự tin thể hiện mình trong những chiếc váy, đầm duyên dáng.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">LỜI KẾT<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Trong thời trang, mỗi người lại chọn cho mình một phong cách riêng. Và mùa lạnh là thời điểm tuyệt vời nhất để các chàng trai và cô gái có thể biến tấu phong cách ăn mặc của mình. Hy vọng cẩm nang thời trang thu đông trên đây đã giúp các bạn có thêm được những gợi ý "hay ho" để luôn mặc đẹp mỗi ngày trong những ngày đông lạnh giá.</span></p>', N'Phong cách thời trang thu đông của bạn sẽ ra sao khi giao mùa? Bên cạnh việc giữ ấm cơ thể, cẩm nang dưới đây sẽ giúp việc ăn mặc của bạn trở lên đẹp hơn.')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [HinhAnhBaiViet], [NgayDangBaiViet], [NoiDung], [MoTa]) VALUES (5, N'11 cách kết hợp với Cardigan nữ', N'/Data/images/Article/news5.jpg', CAST(0xA613050F AS SmallDateTime), N'<p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Nói không ngoa thì có thể ví áo len cardigan giống với những áo thun và quần Jeans mà bạn hay mặc thường ngày. Khi thời tiết trở lên se lạnh thì việc bổ sung thêm cho tủ đồ của mình dăm ba chiếc cardigan là một việc làm hết sức cần thiết.Trang phục này dần trở lên thân thuộc và được liệt vào dạng "phải có" trong mùa thu đông của mỗi cô nàng bởi sự tiện lợi, thời thượng và vẻ đẹp mà nó mang lại. .<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Tuy nhiên, làm thế nào để mặc đẹp áo len cardigan nữ?<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Với hy vọng giúp các bạn nữ có thêm những gợi ý để làm mới phong cách ăn mặc của mình, thời trang CANIFAsẽ giới thiệu cùng bạn những "bí kíp" kết hợp đồ với áo len cardigan cực chuẩn. Hãy tiếp tục theo dõi.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">1. Áo len cardigan ngoại cỡ<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Phong cách thời trang thu đông dành cho nữ giới nói riêng đánh dâu sự trở lại và hứa hẹn bùng nổ của những mẫu áo len cardigan ngoại cỡ (oversize) và áo len cardigan boyfriend (hay áo cardigan dành cho nam). Các cô nàng có thể chọn mua những chiếc áo có cổ tim và dáng dài. Cách mix áo cardigan thụng không có gì phức tạp cả. Bạn có thể mặc nó với áo sơ mi hoặc áo thun, cùng quần Jeans và đi một đôi giày yêu thích. Bộ đồ này tuy đơn giản mà rất đẹp.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">2. Sử dụng thêm thắt lưng<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Với những chiếc áo cardigan có dáng suông thì việc dùng thêm một chiếc dây lưng sẽ giúp chị em tôn lên vóc dáng của mình. Đây xem ra là một cách đơn giản để bạn tạo cho mình một phom dáng đồng hồ cát như ý muốn. Bạn nữ nên lựa chọn các loại áo len cardigan mỏng để mix với thắt lửng bản nhỏ. Bọ đồ này sẽ trở lên đẹp và duyên dáng hơn khi được kết hợp với chân váy công sở.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">3. Kết hợp áo len cardigan theo kiểu layering<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Nếu là một độc giả thường xuyên của CANIFA thì chắc bạn đã đọc bài viết về phong cách layer của chúng tôi. Phối áo cardigan nữ theo kiểu tầng lớp là cách đơn giản và nhanh chóng nhất để bạn mặc đẹp trang phục này. Chúng ta có thể kết hợp áo thun trắng cùng áo len cardigan, áo khoác da, quần Jeans và giày cao gót hoặc bốt tùy ý.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">4. Áo len cardigan dáng dài<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Với những chiếc áo cardigan dáng dài thì các cô nàng sẽ trở lên "cực kỳ" thời trang và cuốn hút. Để bộ đồ trở lên cân đối thì bạn hãy kết hợp lại áo len này cùng quần short hoặc chân váy ngắn. Cách mix đồ với áo len loại này thích hợp để bạn "diện" trong tiết trời thu mát mẻ.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">5. Đừng quên những chiếc khăn<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Danh sách những phụ kiện thời trang thu đông cần thiết của mỗi cô nàng luôn có chỗ đứng cho những chiếc khăn. Tùy từng phong cách ăn mặc cá nhân mà mỗi bạn lại chọn được cho mình những món đồ phù hợp. Quàng chiếc khăn yêu thích sẽ giúp bộ đồ của bạn trở lên có điểm nhấn và thu hút hơn.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">6. Đóng hết cúc<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Cài hết các cúc phía trước của áo len cardigan tạo cho các cô nàng một phong cách thời trang chỉnh chu và thanh lịch. Phong cách này trở lên đẹp nhất nếu bạn sử dụng những loại áo cardigan cổ cao và tròn. Kết hợp cùng áo sơ mi theo phong cách layer là một lựa chọn không thể tuyệt vời hơn mà bạn nên áp dụng.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">7. Sơ-vin<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">So-vin chiếc áo len cardigan trong chiếc chân váy hoặc quần cạp cao là cách làm "hay ho" giúp bạn nữ tạo được sự mởi mẻ trong mùa thu đông năm nay. Đây cũng là style tuyệt vời để bạn "khoe" được vóc dáng thon gọn của mình. Khi theo đuổi phong cách này thì bạn hãy mặc những chiếc cardigan có dáng ôm cơ thể nhé.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">8. Áo cardigan kiểu draped<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Draped là loại áo cardigan có cổ to bản được thiết kê giống với cổ áo vest nhưng lại là kiểu cổ đổ. Lựa chọn trang phục này trong mùa thu đông chăc chắn sẽ giúp các cô nàng trở lên thời trang và sành điều hơn bao giờ hết. Để bộ đồ trở lên cân bằng giữa hai phần thì bạn gái nên kết hợp item này cùng quần ống đứng và áo thun bên trong. Sử dụng thêm phụ kiện là những chiếc vòng cổ sẽ giúp bạn tạo được điểm nhấn hấp dẫn cho bộ trang phục.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">9. Mặc ngược<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Những chiếc áo len cardigan sẽ trở lên rất cá tính và thời trang khi chúng được mặc ngược lại. Đây là một xu hướng đã được nhà thiết kế Marc Jacob giới thiệu trong show diễn Thu đông 2010 của mình. Kết hợp áo thun ba lỗ bên trong chiếc áo cardigan này giúp bạn nữ khoe được vùng gáy hết súc quyễn rũ của mình.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">10. Khoác hờ trên vai<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Nhiều người nổi tiếng thường có chung một phong cách ăn mặc là khoác hờ chiếc áo khoác hoặc jacket trên vai. Và chúng ta hãy học hỏi và "biến tấu" bộ đồ này bằng cách sử dụng những chiếc áo cardigan thay thế.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Đừng bỏ lỡ: 3 cách phối đồ tuyệt đẹp với áo len cardigan nam<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">11. Quấn áo cardigan quanh thắt lưng<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Chúng ta không khó để bắt gặp hình ảnh những anh chàng và cô nàng cá tính trong bộ trang phục với áo sơ mi kẻ ca-rô buộc ngang hông. Tuy nhiên, trong những ngày thu sắp tới thì bạn hãy tạm xa rời những chiếc áo sơ mi kẻ năng động để chọn cho mình những chiếc cardigan trẻ trung và thanh lịch. Theo bạn thì kiểu mix and match này có thú vị hơn không nào?</span></p>', N'Những cách kết hợp đồ cực chuẩn với áo len cardigan dưới đây chắc chắn sẽ giúp bạn nữ trở lên ấm áp, những vẫn rất đẹp và thời trang trongnhững ngày thu đông tới đây.')
INSERT [dbo].[BaiViet] ([MaBaiViet], [TieuDe], [HinhAnhBaiViet], [NgayDangBaiViet], [NoiDung], [MoTa]) VALUES (6, N'Áo sơ mi ngắn tay: Cùng chàng khẳng định nam tính', N'/Data/images/Article/news6.jpg', CAST(0xA613050F AS SmallDateTime), N'<p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Phong cách thời trang công sở của các đấng "mày râu" thường rất đơn giản. So với phái đẹp thì phái mạnh thường không có quá nhiều sự lựa chọn về trang phục khi đi làm.Trang phục mặc đi làm hàng ngày của nam giới thường chỉ xoay quanh quần âu và áo sơ mi.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Đến hẹn lại lên, các mẫu sơ mi nam ngắn tay đến từ thương hiệu thời trang ứng dụng CANIFA ra đời để giúp các chàng trai có thêm nhiều sự lựa chọn để làm mới cho phong cách ăn mặc của mình.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Nhưng để mua được những trang phục hoàn hảo thì thật không dễ dàng một chút nào. Những yếu tố được đề cập trong cẩm nang này sẽ giúp việc mua sắm của bạn trở lên dễ dàng hơn bao giờ hết.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Kiểm tra kích cỡ và phom dáng áo sơ mi ngắn tay<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Trước khi nghĩ đến việc mặc đẹp một trang phục nào đó thì chúng ta nên dành thời gian để kiểm tra xem kích cỡ của nó có vừa với bạn hay không? Và áo sơ mi cộc tay cũng không phải ngoại lệ. Tốt nhất là các chàng trai nên mua những chiếc áo có size vừa vặn và có dáng ôm lấy cơ thể (còn gọi là áo slimfit).<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Các bạn hãy mặc thử áo và kiểm tra xem cỡ cổ áo, vai và ngực có vừa vặn hay không bằng cách thử cử động ở một vài tư thế. Nếu bạn thấy thoải mái thì đó là một chiếc sơ mi có kích cỡ phù hợp với bạn.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Vì là áo sơ mi tay ngắn nên các bạn cần phải hết sức lưu ý đến chiều dài của áo, nhất là chiều dài thân và chiều dài tay.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">- Chiều dài chiếc áo sơ mi nam phụ thuộc vào cách mà bạn mặc chúng ra sao? Nếu thích sơ-vin thì bạn hãy lựa chọn các sản phẩm đủ dài để đảm bảo rằng chiếc áo không bị xô, lệch ra ngoài khi cử động. Ngược lại, các chàng trai thích mặc theo kiểu "cho áo ngoài quần" thì nên lựa chọn những chiếc sơ mi với chiều dài quá thắt lưng một chút.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">- Chiều dài tay áo nên chạm đúng đến phần giữa bắp tay của bạn. Đừng ngắn hơn và dài hơn nhé. Nếu bạn cảm thấy không tự tin khi mặc áo sơ mi ngắn tay vì đôi tay "cò hương" của mình thì hãy vui lên vì những bí quyết này sẽ giúp bạn điều đó.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Lựa chọn màu sắc<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Lựa chọn màu cho chiếc sơ mi nam tay ngắn không hề khó một chút nào. Nếu bạn đã biết mình hợp với màu nào thì hãy cứ chọn những màu đó. Màu vàng sẽ làm cho làn da ngăm của bạn trai trở lên sáng hơn. Đen và trắng lại là những tông màu phù hợp với đại đa số người dùng. Xanh navy và xanh denim cũng vậy. Khi đi mua sắm, bạn nên hỏi trực tiếp người bán hàng hoặc nên rủ thêm một người bạn am hiểu về thời trang đi cùng. Cho dù sự lựa chọn của bạn là gì đi chăng nữa thì nó cũng sẽ ản hưởng đến tổng thể chung của bộ trang phục. Lại một lần nữa, tôi khuyên bạn nên mặc những chiếc áo sơ mi trắng hoặc đen vì chúng khá "dễ tính" trong cách phối đồ.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Kiểm tra họa tiết trên chiếc sơ mi nam tay ngắn<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">So với những chiếc áo sơ mi nam truyền thống, áo sơ mi nam cộc tay cũng rất đa dạng về kiểu dáng, mẫu mã và họa tiết. Nếu bạn mới làm quen hoặc chỉ thỉnh thoảng mới mặc trang phục này thì tốt nhất là nên mua những chiếc áo có họa tiết càng đơn giản càng tốt. Một chiếc áo sơ mi trơn hoặc sơ mi kẻ sẽ là những gợi ý tốt giành cho bạn. Các chàng trai hãy áp dụng những quy tắc chọn màu ở trên để có thể mua được những sản phẩm ưng ý nhé.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Chú ý đến cổ áo<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Sự khác biệt trong các chi tiết thiết kế làm nên vẻ đẹp và đẳng cấp cho sản phẩm. Yếu tố đầu tiên mà các bạn nên lưu ý đến chính là phần cổ áo. Khi nhắc đến áo sơ mi tay ngắn, các bạn cần nhớ đến 3 loại cổ áo thông dụng, đó là: Kiểu Button Down; kiểu Point và kiểu Spread<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">- Kiểu "Button Down" là cổ áo được điểm thêm 2 chiếc khuy ở hai góc, tạo nên vẻ trẻ trung mà không kém phần lịch lãm. Những chiếc sơ mi ngắn tayvới loại cổ này thường rất dễ mặc và dễ phối đồ và phụ kiện.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">- Kiểu "Point" cũng phổ biến không kém. Cổ áo bao gồm 2 phần sẽ tạo thành một góc nhỏ hơn hay cùng lắm là bằng 90 độ. Khi mặc các loại áo sơ mi với kiểu cổ này thì bạn nên đóng hết các cúc thì sẽ đẹp hơn.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">- Kiểu "Spread" gồm 2 lá cổ áo tạo thành một góc lớn hơn 90 độ. Để việc mặc các loại áo sơ mi với kiểu cổ này được đẹp thì bạn nênmở cúc trên cùng.&nbsp;<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Xem xét đến chất liệu<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Đây là yếu tố quan trọng không kém mà chúng ta không thể bỏ qua. Việc mặc sau này của bạn có "sướng" hay không phụ thuộc một phần vào chất vải mà bạn đang sử dụng.Ngày nay, nguồn nguyên liệu để sản xuất áo sơ mi nam cộc tay rất đa dạng. Phổ biến nhất vẫn là những sản phẩm có nguồn gốc từ cotton nguyên chất và cotton pha. Cao cấp hơn thì bạn nam có thể "đầu tư" vào các sản phẩm được làm từ vải lanh (hãy đũi) để mang lại sự thoáng mát trong những ngày hè nóng nực.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Bạn sẽ phối chiếc áo sơ mi ngắn tay như thế nào?<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Người tiêu dùng thường có thói quen thích gì thì mua nấy. Việc mua sắm theo cảm tính này hết sức tốn kém và lãng phí. Các sản phẩm mua về không được sử dụng hoặc nếu có thì cũng chỉ trong một thời gian rất ngắn. Để tránh mắc phải sai lầm này, bạn nên xem xét đến việc mình sẽ mặc chiếc áo sơ mi mới mua như thế nào?<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Bước đầu tiên là bạn cần kiểm tra xem tủ đồ hiện tại của bạn đã có những loại quần phù hợp để mix với chiếc áo sẽ mua hay không? Về cơ bản thì áo sơ mi nam ngắn tay có thể được mặc với quần âu, quần khaki, quần jeans và thậm chí là quần short đều rất đẹp. Lưu ý lớn nhất là bước chọn màu giữa phần thân trên và thân dưới để tổng thể bộ đồ không bị rối mắt.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Tiếp đến là chọn giày dép. Bước này không khó một chút nào. Nguyên tắc cơ bản thì loại quần nào sẽ thích hợp với kiểu giày đó. Cho dù "gu" ăn mặc của bạn có như thế nào đi chăng nữa thì các chàng trai nên đầu tư cho tủ đồ của mình những đôi giày da, đặc biệt là các kiểu giày lười nam cao cấp vì phụ kiện này có thể phối cùng với tất cả những loại quần bạn hiện có.<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Lời kết,<o:p></o:p></span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">&nbsp;</span></p><p class="MsoNormal" style="font-size: 13.3333px;"><span lang="EN-US" times="" new="" roman","serif""="" style="font-size: 12pt; line-height: 17.12px;">Chúng tôi biết chắc rằng các bạn nam đều đã biết cách "diện" những chiếc áo sơ mi ngắn tay. Nhưng bước đầu tiên để bạn có có hội được thể hiện mình là phải chọn mua được những sản phẩm phù hợp với phong cách ăn mặc của mình. Hy vọng những bí quyết chia sẻ phía trên sẽ giúp bạn hiện thực hóa được ước muốn chính đáng này.</span></p>', N'Bạn nam thích mặc áo sơ mi tay ngắn nhưng chưa biết cách chọn mua trang phục này như thế nào? Vậy thì đây sẽ là bài viết tốt nhất mà bạn nên đọc.')
SET IDENTITY_INSERT [dbo].[BaiViet] OFF
SET IDENTITY_INSERT [dbo].[BinhLuan] ON 

INSERT [dbo].[BinhLuan] ([MaBinhLuan], [HoTenNBL], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (1, N'Messi', CAST(0xA6130574 AS SmallDateTime), N'Sản phẩm trông thật đẹp mắt', 1, 18)
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [HoTenNBL], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (2, N'Messi', CAST(0xA6130576 AS SmallDateTime), N'Sản phẩm trông thật đẹp mắt', 1, 18)
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [HoTenNBL], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (3, N'Rivaldo', CAST(0xA6130577 AS SmallDateTime), N'Nice', 1, 4)
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [HoTenNBL], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (4, N'Giang', CAST(0xA613057B AS SmallDateTime), N'Mũ đẹp quá', 1, 24)
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [HoTenNBL], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (5, N'Chi Pu', CAST(0xA6130587 AS SmallDateTime), N'Váy xinh quá ahihi', 1, 14)
INSERT [dbo].[BinhLuan] ([MaBinhLuan], [HoTenNBL], [NgayGio], [NoiDung], [TrangThai], [MaSP]) VALUES (6, N'Phương Trang', CAST(0xA613058B AS SmallDateTime), N'Phong cách ghê', 1, 10)
SET IDENTITY_INSERT [dbo].[BinhLuan] OFF
SET IDENTITY_INSERT [dbo].[BoSuuTap] ON 

INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (1, N'None')
INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (2, N'Xuân hè')
INSERT [dbo].[BoSuuTap] ([MaBST], [TenBST]) VALUES (3, N'Thu đông')
SET IDENTITY_INSERT [dbo].[BoSuuTap] OFF
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (1, 5, 1, 3, 435000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (1, 18, 5, 7, 395000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (1, 25, 9, 5, 300000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (2, 7, 1, 11, 325000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (2, 10, 5, 3, 545000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (3, 6, 2, 1, 445000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (3, 14, 9, 1, 525000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (4, 17, 4, 8, 515000, 1)
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [MaMau], [MaSize], [DonGia], [SoLuong]) VALUES (4, 20, 3, 3, 235000, 1)
SET IDENTITY_INSERT [dbo].[DanhMucSP] ON 

INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (1, N'Thời trang nam', NULL)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (2, N'Thời trang nữ', NULL)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (3, N'Áo nam', 1)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (4, N'Quần nam', 1)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (5, N'Phụ kiện nam', 1)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (6, N'Áo nữ', 2)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (7, N'Quần nữ', 2)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (8, N'Váy đầm', 2)
INSERT [dbo].[DanhMucSP] ([MaDanhMucSP], [TenDanhMucSP], [MaDanhMucSPCha]) VALUES (9, N'Phụ kiện nữ', 2)
SET IDENTITY_INSERT [dbo].[DanhMucSP] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [NgayGiaoHang], [MaKhachHang], [TinhTrangGiaoHang], [GhiChu]) VALUES (1, CAST(0xA6130571 AS SmallDateTime), NULL, 2, 0, N'Giao hàng vào buổi tối')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [NgayGiaoHang], [MaKhachHang], [TinhTrangGiaoHang], [GhiChu]) VALUES (2, CAST(0xA6130572 AS SmallDateTime), NULL, 2, 0, N'')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [NgayGiaoHang], [MaKhachHang], [TinhTrangGiaoHang], [GhiChu]) VALUES (3, CAST(0xA6130572 AS SmallDateTime), NULL, 1, 0, N'Đem thật nhanh đến đấy')
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDat], [NgayGiaoHang], [MaKhachHang], [TinhTrangGiaoHang], [GhiChu]) VALUES (4, CAST(0xA6130573 AS SmallDateTime), NULL, 6, 0, N'')
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[Hang] ON 

INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (1, N'Kenzo')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (2, N'Levi ''s')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (3, N'Chanel')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (4, N'H & M')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (5, N'D & G')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (6, N'Nike')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (7, N'Adidas')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (8, N'Lacoste')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (9, N'Zara')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (10, N'Prada')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (11, N'Louis Vuittion')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (12, N'Converse')
INSERT [dbo].[Hang] ([MaHang], [TenHang]) VALUES (13, N'DKNY')
SET IDENTITY_INSERT [dbo].[Hang] OFF
SET IDENTITY_INSERT [dbo].[HinhAnh] ON 

INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (1, N'/Data/images/Product/39.jpg', 1)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (2, N'/Data/images/Product/40.jpg', 1)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (3, N'/Data/images/Product/41.jpg', 1)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (4, N'/Data/images/Product/43.jpg', 2)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (5, N'/Data/images/Product/44.jpg', 2)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (6, N'/Data/images/Product/46.jpg', 3)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (7, N'/Data/images/Product/47.jpg', 3)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (8, N'/Data/images/Product/48.jpg', 3)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (9, N'/Data/images/Product/50.jpg', 4)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (10, N'/Data/images/Product/51.jpg', 4)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (11, N'/Data/images/Product/53.jpg', 5)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (12, N'/Data/images/Product/55.jpg', 5)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (13, N'/Data/images/Product/56.jpg', 5)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (14, N'/Data/images/Product/68.jpg', 6)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (15, N'/Data/images/Product/69.jpg', 6)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (16, N'/Data/images/Product/58.jpg', 7)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (17, N'/Data/images/Product/59.jpg', 7)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (18, N'/Data/images/Product/60.jpg', 7)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (19, N'/Data/images/Product/62.jpg', 8)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (20, N'/Data/images/Product/63.jpg', 8)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (21, N'/Data/images/Product/74.jpg', 9)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (22, N'/Data/images/Product/6.jpg', 10)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (23, N'/Data/images/Product/8.jpg', 10)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (24, N'/Data/images/Product/9.jpg', 10)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (25, N'/Data/images/Product/11.jpg', 11)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (26, N'/Data/images/Product/12.jpg', 11)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (27, N'/Data/images/Product/15.jpg', 11)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (28, N'/Data/images/Product/18.jpg', 12)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (29, N'/Data/images/Product/19.jpg', 12)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (30, N'/Data/images/Product/20.jpg', 12)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (31, N'/Data/images/Product/1.jpg', 13)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (32, N'/Data/images/Product/4.jpg', 13)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (33, N'/Data/images/Product/3.jpg', 13)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (34, N'/Data/images/Product/36.jpg', 14)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (35, N'/Data/images/Product/37.jpg', 14)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (36, N'/Data/images/Product/22.jpg', 15)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (37, N'/Data/images/Product/23.jpg', 15)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (38, N'/Data/images/Product/24.jpg', 15)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (39, N'/Data/images/Product/26.jpg', 16)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (40, N'/Data/images/Product/27.jpg', 16)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (41, N'/Data/images/Product/28.jpg', 16)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (42, N'/Data/images/Product/30.jpg', 17)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (43, N'/Data/images/Product/31.jpg', 17)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (44, N'/Data/images/Product/33.jpg', 18)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (45, N'/Data/images/Product/34.jpg', 18)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (46, N'/Data/images/Product/71.jpg', 19)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (47, N'/Data/images/Product/72.jpg', 19)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (48, N'/Data/images/Product/65.jpg', 20)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (49, N'/Data/images/Product/17.jpg', 20)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (50, N'/Data/images/Product/66.jpg', 20)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (51, N'/Data/images/Product/76.jpg', 21)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (52, N'/Data/images/Product/77.jpg', 21)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (53, N'/Data/images/Product/78.jpg', 21)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (54, N'/Data/images/Product/85.jpg', 22)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (55, N'/Data/images/Product/86.jpg', 22)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (56, N'/Data/images/Product/87.jpg', 22)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (57, N'/Data/images/Product/95.jpg', 23)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (58, N'/Data/images/Product/96.jpg', 23)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (59, N'/Data/images/Product/98.jpg', 23)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (60, N'/Data/images/Product/80.jpg', 24)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (61, N'/Data/images/Product/82.jpg', 24)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (62, N'/Data/images/Product/83.jpg', 24)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (63, N'/Data/images/Product/89.jpg', 25)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (64, N'/Data/images/Product/90.jpg', 25)
INSERT [dbo].[HinhAnh] ([MaHinhAnh], [TenHinhAnh], [MaSP]) VALUES (65, N'/Data/images/Product/91.jpg', 25)
SET IDENTITY_INSERT [dbo].[HinhAnh] OFF
SET IDENTITY_INSERT [dbo].[KichThuoc] ON 

INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (1, N'XS')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (2, N'S')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (3, N'M')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (4, N'L')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (5, N'XL')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (6, N'XXL')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (7, N'28')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (8, N'29')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (9, N'30')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (10, N'31')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (11, N'32')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (12, N'33')
INSERT [dbo].[KichThuoc] ([MaSize], [TenSize]) VALUES (13, N'34')
SET IDENTITY_INSERT [dbo].[KichThuoc] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [TenDangNhap], [MatKhau], [DiaChi], [SoDienThoai], [Email], [PhanLoai]) VALUES (1, N'Tôn Ngộ Không', N'tonngokhong', N'72eb33929360860eebccecb08d3cff70', N'China', N'0941241245', N'tonngokhong@gmail.com', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [TenDangNhap], [MatKhau], [DiaChi], [SoDienThoai], [Email], [PhanLoai]) VALUES (2, N'Nguyễn Anh Quân', N'naq259', N'a8b09e5ae7a2db76421a9ebf68d0f752', N'Hà Nội', N'0483295324', N'naq259@gmail.com', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [TenDangNhap], [MatKhau], [DiaChi], [SoDienThoai], [Email], [PhanLoai]) VALUES (3, N'Chư Bát Giới', N'chubatgioi', N'bafed8494b37d0631ce111fafec31c36', N'Japan', N'0941241245', N'chubatgioi@gmail.com', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [TenDangNhap], [MatKhau], [DiaChi], [SoDienThoai], [Email], [PhanLoai]) VALUES (4, N'Xa Tăng', N'xatang', N'5ab57a07b66686c0f6a0ca12fcf5c179', N'Mỹ', N'0951534534', N'xatang@gmail.com', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [TenDangNhap], [MatKhau], [DiaChi], [SoDienThoai], [Email], [PhanLoai]) VALUES (5, N'Đường Tăng', N'duongtang', N'd525512ec8c5a779539034f1fc73007f', N'British', N'0941241276', N'duongtang@gmail.com', 1)
INSERT [dbo].[KhachHang] ([MaKhachHang], [TenKhachHang], [TenDangNhap], [MatKhau], [DiaChi], [SoDienThoai], [Email], [PhanLoai]) VALUES (6, N'Barrack Obama', NULL, NULL, N'American', N'0943241561', N'obama@yahoo.com', 0)
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[MauSac] ON 

INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (1, N'Xanh')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (2, N'Vàng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (3, N'Đỏ')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (4, N'Tím')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (5, N'Hồng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (6, N'Xám')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (7, N'Cam')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (8, N'Nâu')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (9, N'Đen')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (10, N'Trắng')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (11, N'Ghi')
INSERT [dbo].[MauSac] ([MaMau], [TenMau]) VALUES (12, N'Be')
SET IDENTITY_INSERT [dbo].[MauSac] OFF
SET IDENTITY_INSERT [dbo].[QuanTriVien] ON 

INSERT [dbo].[QuanTriVien] ([MaAdmin], [TenAdmin], [Email], [TaiKhoan], [MatKhau], [PhanLoai]) VALUES (1, N'Admin', N'admin@gmail.com', N'admin', N'81dc9bdb52d04dc20036dbd8313ed055', 1)
INSERT [dbo].[QuanTriVien] ([MaAdmin], [TenAdmin], [Email], [TaiKhoan], [MatKhau], [PhanLoai]) VALUES (2, N'Nguyễn Anh Quân', N'naq259@gmail.com', N'naq259', N'a8b09e5ae7a2db76421a9ebf68d0f752', 1)
INSERT [dbo].[QuanTriVien] ([MaAdmin], [TenAdmin], [Email], [TaiKhoan], [MatKhau], [PhanLoai]) VALUES (3, N'Naruto', N'naruto@gmail.com', N'naruto', N'e10adc3949ba59abbe56e057f20f883e', 0)
INSERT [dbo].[QuanTriVien] ([MaAdmin], [TenAdmin], [Email], [TaiKhoan], [MatKhau], [PhanLoai]) VALUES (4, N'Barrack Obama', N'obama@gmail.com', N'obama', N'e10adc3949ba59abbe56e057f20f883e', 0)
SET IDENTITY_INSERT [dbo].[QuanTriVien] OFF
SET IDENTITY_INSERT [dbo].[QuangCao] ON 

INSERT [dbo].[QuangCao] ([MaQuangCao], [HinhAnhQC]) VALUES (1, N'/Data/images/Advertisement/Slider1.jpg')
INSERT [dbo].[QuangCao] ([MaQuangCao], [HinhAnhQC]) VALUES (2, N'/Data/images/Advertisement/Slider2.jpg')
INSERT [dbo].[QuangCao] ([MaQuangCao], [HinhAnhQC]) VALUES (3, N'/Data/images/Advertisement/Slider3.jpg')
INSERT [dbo].[QuangCao] ([MaQuangCao], [HinhAnhQC]) VALUES (4, N'/Data/images/Advertisement/get_inspired_1.jpg')
INSERT [dbo].[QuangCao] ([MaQuangCao], [HinhAnhQC]) VALUES (5, N'/Data/images/Advertisement/get_inspired_2.jpg')
INSERT [dbo].[QuangCao] ([MaQuangCao], [HinhAnhQC]) VALUES (6, N'/Data/images/Advertisement/get_inspired_3.jpg')
SET IDENTITY_INSERT [dbo].[QuangCao] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (1, N'Sơ mi nam cổ tàu nẹp khuy', 350000, 295000, CAST(0xA6130519 AS SmallDateTime), N'<span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; font-weight: bold; line-height: 16px; background-color: rgb(255, 255, 255);">Sơmi INF.nam.Want.Smart Casual.cổ tàu.nẹp khuy</span>', N'/Data/images/Product/38.jpg', 25, 3, 13, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (2, N'Áo polo đơn giản', 425000, 370000, CAST(0xA613051B AS SmallDateTime), N'<span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; font-weight: bold; line-height: 16px; background-color: rgb(255, 255, 255);">Polo INFA M. NEED. basic.</span>', N'/Data/images/Product/42.jpg', 10, 3, 4, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (3, N'Phông cổ tròn họa tiết đuôi áo', 395000, 355000, CAST(0xA6130520 AS SmallDateTime), N'<span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; font-weight: bold; line-height: 16px; background-color: rgb(255, 255, 255);">Tee INFA M. NEED. botanical loose printedbot.</span>', N'/Data/images/Product/45.jpg', 30, 3, 2, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (4, N'Áo ba lỗ họa tiết in chữ', 415000, NULL, CAST(0xA6130522 AS SmallDateTime), N'<span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; font-weight: bold; line-height: 16px; background-color: rgb(255, 255, 255);">Tee INFA M. NEED. botanical muscle.</span>', N'/Data/images/Product/49.jpg', 15, 3, 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (5, N'Sơ mi nam phối màu cổ', 575000, 435000, CAST(0xA6130523 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;"><div class="std">Sơmi INF.nam.Want.Smart Casual.slimfit.phối màu cổ</div><div><br></div></h2>', N'/Data/images/Product/52.jpg', 20, 3, 9, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (6, N'Nỉ nam pha tay raglan', 445000, NULL, CAST(0xA6130525 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;"><div class="std">Nỉ BS.nam.Sữa tươi.PHA.nỉ scuba.tay raglan</div><div><br></div></h2>', N'/Data/images/Product/67.jpg', 25, 3, 3, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (7, N'Quần lửng màu sắc', 325000, NULL, CAST(0xA6130526 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;"><div class="std">Shorts INFA M NEED botanical sidepocket</div><div><br></div></h2>', N'/Data/images/Product/57.jpg', 20, 4, 4, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (8, N'Quần jogger nỉ da cá phối khóa', 495000, 315000, CAST(0xA6130528 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;"><div class="std">Quần jogger INFAMOUS nam.Want.Sporty Look.nỉ da cá phối khóa</div><div><br></div></h2>', N'/Data/images/Product/61.jpg', 40, 4, 7, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (9, N'Móc khóa họa tiết biển số xe', 45000, NULL, CAST(0xA6130529 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;"><div class="std">Móc khoá Bò Sữa.Sữa Ðặc.Họa tiết.Biển số 1102</div><div><br></div></h2>', N'/Data/images/Product/73.jpg', 50, 5, 12, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (10, N'Áo dáng rộng đuôi lưới', 545000, NULL, CAST(0xA6130530 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;">Tee INFA W. LOVE. mesh it up printed with mesh.</h2>', N'/Data/images/Product/5.jpg', 25, 6, 1, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (11, N'Áo nỉ nữ sườn phối da', 525000, 495000, CAST(0xA6130532 AS SmallDateTime), N'<h1 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 14px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 14px;">Nỉ INF.nữ.NEED.Cross Season.xẻ sườn.phối da</h1>', N'/Data/images/Product/10.jpg', 30, 6, 4, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (12, N'Áo nỉ nữ gấu ren', 415000, NULL, CAST(0xA6130534 AS SmallDateTime), N'<h1 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 14px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 14px;">Nỉ INFAMOUS nữ.Need.PHA.gấu ren</h1>', N'/Data/images/Product/16.jpg', 36, 6, 7, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (13, N'Váy nữ dáng rộng tay lửng', 315000, NULL, CAST(0xA6130536 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;">Váy INF.nữ.Want.Indigo Denim.dáng rộng.tay lửng&nbsp;</h2>', N'/Data/images/Product/2.jpg', 40, 8, 12, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (14, N'Váy liền đơn điệu', 525000, NULL, CAST(0xA6130537 AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;">Váy INFAMOUS nữ.NEED.PHA.Botanical.tunic high low blank</h2>', N'/Data/images/Product/35.jpg', 15, 8, 13, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (15, N'Legging nữ phối da', 395000, NULL, CAST(0xA613053A AS SmallDateTime), N'<h4 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 14px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 14px;"><span style="font-weight: normal;">Legging INF.nữ.NEED.Cross Season.spandex phối da</span></h4>', N'/Data/images/Product/21.jpg', 24, 7, 6, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (16, N'Chân váy đơn giản', 435000, NULL, CAST(0xA613053B AS SmallDateTime), N'<h4 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 14px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 14px;"><span style="font-weight: normal;">Skort INFA W. WANT. blank basic pleated</span></h4>', N'/Data/images/Product/25.jpg', 12, 7, 8, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (17, N'Quần ống rộng đơn giản', 515000, NULL, CAST(0xA613053D AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;">Trousers INFA W. NEED. basic blank ankle crop.</h2>', N'/Data/images/Product/29.jpg', 10, 7, 11, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (18, N'Quần soóc nữ tính', 395000, NULL, CAST(0xA613053E AS SmallDateTime), N'<h2 style="margin: 10px 0px; font-family: ''Open Sans'', sans-serif; line-height: 16px; color: rgb(51, 51, 51); text-rendering: optimizeLegibility; font-size: 16px;">Shorts INFA W. NEED. basic blank rollup.</h2>', N'/Data/images/Product/32.jpg', 40, 7, 3, 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (19, N'Quần tregging da lé 2 bên sườn', 595000, NULL, CAST(0xA613053F AS SmallDateTime), N'<span style="color: rgb(102, 102, 102); font-family: Tahoma, Arial, Helvetica, sans-serif; font-size: 14px; font-weight: bold; line-height: 21.7px; background-color: rgb(255, 255, 255);">Quần tregging INFAMOUS nữ.Want.Sporty Look.2 da lé 2 bên sườn</span>', N'/Data/images/Product/70.jpg', 10, 7, 6, 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (20, N'Khăn len đường dệt hạt gạo', 235000, NULL, CAST(0xA6130541 AS SmallDateTime), N'<div><span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; line-height: 16px;">Khăn BS.Unisex.Sữa Tươi.Len dệt hạt gạo."pom pom" &nbsp;</span></div>', N'/Data/images/Product/64.jpg', 8, 9, 13, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (21, N'Móc khóa bò sữa đặc', 45000, NULL, CAST(0xA6130542 AS SmallDateTime), N'<span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; font-weight: bold; line-height: 16px; background-color: rgb(255, 255, 255);">Móc khoá Bò Sữa.Sữa Đặc.BuChar.Bu Vịt</span>', N'/Data/images/Product/75.jpg', 20, 5, 12, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (22, N'Balo denim nữ', 545000, NULL, CAST(0xA6130544 AS SmallDateTime), N'<span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; font-weight: bold; line-height: 16px; background-color: rgb(255, 255, 255);">Balo BS.nu.Sữa Tươi.PHA.denim acidwash</span>', N'/Data/images/Product/84.jpg', 30, 9, 3, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (23, N'Balo phối da', 575000, NULL, CAST(0xA6130545 AS SmallDateTime), N'<span style="color: rgb(51, 51, 51); font-family: ''Open Sans'', sans-serif; font-size: 16px; font-weight: bold; line-height: 16px; background-color: rgb(255, 255, 255);">Balo Bò Sữa.unisex.Sữa Tươi.Basic 1.dạ kẻ phối da</span>', N'/Data/images/Product/92.jpg', 20, 9, 4, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (24, N'Mũ cap', 240000, NULL, CAST(0xA6130547 AS SmallDateTime), N'Đậm chất cá tính, phong cách', N'/Data/images/Product/79.jpg', 28, 5, 5, 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaSP], [GiaKhuyenMai], [NgayCapNhat], [MoTa], [HinhAnhSP], [SoLuong], [MaDanhMucSP], [MaHang], [MaBST]) VALUES (25, N'Balo nhiều số', 300000, NULL, CAST(0xA6130548 AS SmallDateTime), N'Mang đậm chất trẻ trung', N'/Data/images/Product/88.jpg', 20, 5, 11, 1)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (1, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (1, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (1, 5)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (2, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (2, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (2, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (3, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (3, 2)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (3, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (3, 5)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (4, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (4, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (4, 5)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (4, 6)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (5, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (5, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (5, 5)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (6, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (6, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (6, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (7, 9)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (7, 10)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (7, 11)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (8, 8)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (8, 9)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (8, 10)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (8, 11)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (8, 12)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (9, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (10, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (10, 2)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (10, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (10, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (11, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (11, 2)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (11, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (11, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (12, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (12, 2)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (12, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (12, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (13, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (13, 2)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (13, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (14, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (14, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (14, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (14, 5)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (15, 7)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (15, 8)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (15, 9)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (15, 10)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (16, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (16, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (16, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (17, 8)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (17, 9)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (17, 10)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (17, 11)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (18, 7)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (18, 8)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (18, 9)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (19, 7)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (19, 8)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (19, 9)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (20, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (20, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (21, 1)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (21, 2)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (22, 2)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (22, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (23, 3)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (24, 4)
INSERT [dbo].[SanPham_KichThuoc] ([MaSP], [MaSize]) VALUES (25, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (1, 1)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (1, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (2, 1)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (2, 4)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (2, 8)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (3, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (3, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (3, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (3, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (4, 3)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (4, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (4, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (4, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (5, 1)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (5, 4)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (5, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (5, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (6, 2)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (6, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (6, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (7, 1)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (7, 3)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (8, 8)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (8, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (9, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (9, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (10, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (10, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (10, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (10, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (11, 3)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (11, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (11, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (11, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (12, 3)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (12, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (12, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (13, 1)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (13, 4)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (13, 6)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (14, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (14, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (14, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (15, 6)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (15, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (15, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (16, 2)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (16, 7)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (16, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (17, 4)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (17, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (17, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (18, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (19, 8)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (19, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (19, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (20, 3)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (20, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (21, 1)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (21, 2)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (21, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (22, 11)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (22, 12)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (23, 3)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (23, 5)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (23, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (24, 1)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (24, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (24, 10)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (25, 9)
INSERT [dbo].[SanPham_MauSac] ([MaSP], [MaMau]) VALUES (25, 10)
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSize])
REFERENCES [dbo].[KichThuoc] ([MaSize])
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[HinhAnh]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaBST])
REFERENCES [dbo].[BoSuuTap] ([MaBST])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaDanhMucSP])
REFERENCES [dbo].[DanhMucSP] ([MaDanhMucSP])
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD FOREIGN KEY([MaHang])
REFERENCES [dbo].[Hang] ([MaHang])
GO
ALTER TABLE [dbo].[SanPham_KichThuoc]  WITH CHECK ADD FOREIGN KEY([MaSize])
REFERENCES [dbo].[KichThuoc] ([MaSize])
GO
ALTER TABLE [dbo].[SanPham_KichThuoc]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[SanPham_MauSac]  WITH CHECK ADD FOREIGN KEY([MaMau])
REFERENCES [dbo].[MauSac] ([MaMau])
GO
ALTER TABLE [dbo].[SanPham_MauSac]  WITH CHECK ADD FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
