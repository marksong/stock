USE [DingXin101]
GO
/****** Object:  Table [dbo].[product_cn_en_contrast]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_cn_en_contrast](
	[cn_name] [nvarchar](500) NOT NULL,
	[en_name] [nvarchar](500) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MAX007_12]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MAX007_12](
	[class] [nvarchar](500) NULL,
	[card_no] [nvarchar](500) NULL,
	[product] [nvarchar](500) NULL,
	[heat_no] [nvarchar](500) NULL,
	[grade] [nvarchar](500) NULL,
	[od] [nvarchar](500) NULL,
	[sch] [nvarchar](500) NULL,
	[last_month_stock] [nvarchar](500) NULL,
	[current_month_put_in] [nvarchar](500) NULL,
	[put_in_date] [datetime] NULL,
	[stock_num] [int] NULL,
	[remarks] [nvarchar](500) NULL,
	[storage_rack_no] [nvarchar](500) NULL,
	[sorw] [nvarchar](500) NULL,
	[peorbe] [nvarchar](500) NULL,
	[price] [decimal](18, 2) NULL,
	[standard_no] [nvarchar](500) NULL,
	[num_no] [nvarchar](500) NULL,
	[steel_nps] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[material_no] [nvarchar](500) NULL,
	[product] [nvarchar](500) NULL,
	[sorw] [nvarchar](500) NULL,
	[material] [nvarchar](500) NULL,
	[standard_no] [nvarchar](500) NULL,
	[num_no] [nvarchar](500) NULL,
	[price] [decimal](18, 2) NULL,
	[steel_nps] [nvarchar](500) NULL,
	[steel_sch] [nvarchar](500) NULL,
	[pipe_nps] [nvarchar](500) NULL,
	[pipe_sch] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_type_cn_en_contrast]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_type_cn_en_contrast](
	[product_type_cn] [nvarchar](500) NULL,
	[product_type_en] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_image]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_image](
	[product] [nvarchar](500) NULL,
	[image] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[peorbe_cn_en_contrast]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[peorbe_cn_en_contrast](
	[peorbe_cn] [nvarchar](500) NULL,
	[peorbe_en] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[stock]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stock](
	[grade] [nvarchar](500) NULL,
	[heat_no] [nvarchar](500) NULL,
	[heat_group_no] [nvarchar](500) NULL,
	[od] [decimal](18, 2) NULL,
	[thickness] [decimal](18, 2) NULL,
	[pcs] [int] NULL,
	[weight] [int] NULL,
	[dp_no] [nvarchar](500) NULL,
	[order_no] [nvarchar](500) NULL,
	[length] [nvarchar](500) NULL,
	[bundle_no] [nvarchar](500) NULL
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'钢种' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'grade'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'炉号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'heat_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'炉批号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'heat_group_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'外径' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'od'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'壁厚' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'thickness'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'支数' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'pcs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'重量' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'weight'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'吊牌号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'dp_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'生产订单号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'order_no'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'长度' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'length'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'框号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'stock', @level2type=N'COLUMN',@level2name=N'bundle_no'
GO
/****** Object:  Table [dbo].[update_date2]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[update_date2](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[update_date] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[update_date]    Script Date: 05/27/2011 19:10:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[update_date](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[update_date] [datetime] NULL,
 CONSTRAINT [PK_update_date] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vwMAX007_12]    Script Date: 05/27/2011 19:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwMAX007_12]
AS
SELECT top 1000000  num_no,product, t1.en_name AS product_en, grade, od, sch, SUM(stock_num) AS stock_num, sorw, standard_no, steel_nps, t2.product_type_en AS sorw_en, price
FROM    dbo.MAX007_12 t
LEFT JOIN dbo.product_cn_en_contrast t1 ON t.product = t1.cn_name
LEFT JOIN dbo.product_type_cn_en_contrast t2 ON t.sorw = t2.product_type_cn
GROUP BY num_no, product, t1.en_name, grade, sch, od, sorw, standard_no, steel_nps, t2.product_type_en, price
HAVING SUM(stock_num) > 0
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "MAX007_12"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 250
            End
            DisplayFlags = 280
            TopColumn = 11
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMAX007_12'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwMAX007_12'
GO
/****** Object:  View [dbo].[vwstock]    Script Date: 05/27/2011 19:10:16 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[vwstock]
AS
SELECT     grade, od, thickness, SUM(pcs) AS pcs, SUM([weight]) AS [weight]
FROM         dbo.stock
GROUP BY grade, od, thickness
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "stock"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 125
               Right = 201
            End
            DisplayFlags = 280
            TopColumn = 6
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwstock'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'vwstock'
GO
