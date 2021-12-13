CREATE TABLE [dbo].[Products](
	[IDProduct] [tinyint] NOT NULL,
	[ProductName] [nchar](10) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[IDProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DECLARE @i INT, @n nvarchar(10);
SET @i = 1
WHILE @i <= 50
	BEGIN
		SET @n='Продукт'+CAST(@i as varchar)	
		INSERT INTO [dbo].[Products]
				   ([IDProduct]
				   ,[ProductName])
			 VALUES
				   (@i,@n)
		SET @i=@i+1
	END
GO


CREATE TABLE [dbo].[Categories](
	[IDCategory] [tinyint] NOT NULL,
	[CategoryName] [nchar](10) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[IDCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

DECLARE @i INT, @n nvarchar(10);
SET @i = 1
WHILE @i <= 50
	BEGIN
		SET @n='Категория'+CAST(@i as varchar)	
		INSERT INTO [dbo].[Categories]
				   ([IDCategory]
				   ,[CategoryName])
			 VALUES
				   (@i,@n)
		SET @i=@i+1
	END
GO

CREATE TABLE [dbo].[Compliance](
	[IDProduct] [tinyint] NOT NULL,
	[IDCategory] [tinyint] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Compliance]  WITH CHECK ADD  CONSTRAINT [FK_Compliance_Categories] FOREIGN KEY([IDCategory])
REFERENCES [dbo].[Categories] ([IDCategory])
GO

ALTER TABLE [dbo].[Compliance] CHECK CONSTRAINT [FK_Compliance_Categories]
GO

ALTER TABLE [dbo].[Compliance]  WITH CHECK ADD  CONSTRAINT [FK_Compliance_Products] FOREIGN KEY([IDProduct])
REFERENCES [dbo].[Products] ([IDProduct])
GO

ALTER TABLE [dbo].[Compliance] CHECK CONSTRAINT [FK_Compliance_Products]
GO

DECLARE @i INT, @id1 INT;
SET @i = 1
WHILE @i <= 45
	BEGIN
		SET @id1=FLOOR(RAND()*(45))+1;	
		INSERT INTO [dbo].[Compliance]
				   ([IDProduct]
				   ,[IDCategory])
			 VALUES
				   (@i,@id1)
		SET @i=@i+1
	END
INSERT INTO [dbo].[Compliance]
				   ([IDProduct])
			 VALUES
				   (46),(47),(48),(49),(50)
GO





