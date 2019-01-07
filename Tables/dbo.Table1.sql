CREATE TABLE [dbo].[Table1]
(
[ID] [int] NOT NULL IDENTITY(1, 1),
[Col1] [varchar] (20) COLLATE Latin1_General_CI_AS NULL,
[col2] [varchar] (20) COLLATE Latin1_General_CI_AS NOT NULL CONSTRAINT [DF__Table1__col2__4E53A1AA] DEFAULT ('xxx')
) ON [PRIMARY]
GO
