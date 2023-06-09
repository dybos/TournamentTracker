USE [master]
GO
/****** Object:  Database [Tournaments]    Script Date: 06.06.2023 15:17:22 ******/
CREATE DATABASE [Tournaments]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tournaments', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tournaments.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tournaments_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tournaments_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tournaments] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tournaments].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tournaments] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tournaments] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tournaments] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tournaments] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tournaments] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tournaments] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tournaments] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tournaments] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tournaments] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tournaments] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tournaments] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tournaments] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tournaments] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tournaments] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tournaments] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tournaments] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tournaments] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tournaments] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tournaments] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tournaments] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tournaments] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tournaments] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tournaments] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tournaments] SET  MULTI_USER 
GO
ALTER DATABASE [Tournaments] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tournaments] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tournaments] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tournaments] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tournaments] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tournaments] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tournaments] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tournaments] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tournaments]
GO
/****** Object:  Table [dbo].[MatchupEntries]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MatchupEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[MatchupId] [int] NULL,
	[ParentMatchupId] [int] NULL,
	[TeamCompetingId] [int] NULL,
	[Score] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Matchups]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Matchups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[WinnerId] [int] NULL,
	[MatchupRound] [int] NULL,
	[TournamentId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[EmailAddress] [varchar](100) NULL,
	[CellphoneNumber] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prizes]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlaceNumber] [int] NOT NULL,
	[PlaceName] [nvarchar](50) NOT NULL,
	[PrizeAmount] [money] NOT NULL,
	[PrizePercentage] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeamMembers]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeamMembers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamId] [int] NULL,
	[PersonId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teams]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TeamName] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentEntries]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentEntries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NULL,
	[TeamId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TournamentPrizes]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TournamentPrizes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentId] [int] NULL,
	[PrizeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tournaments]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tournaments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[TournamentName] [varchar](50) NULL,
	[EntryFee] [decimal](10, 2) NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD FOREIGN KEY([MatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD FOREIGN KEY([MatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD FOREIGN KEY([ParentMatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD FOREIGN KEY([ParentMatchupId])
REFERENCES [dbo].[Matchups] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD FOREIGN KEY([TeamCompetingId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[MatchupEntries]  WITH CHECK ADD FOREIGN KEY([TeamCompetingId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO
ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[Matchups]  WITH CHECK ADD FOREIGN KEY([WinnerId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([id])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TeamMembers]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD FOREIGN KEY([TeamId])
REFERENCES [dbo].[Teams] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO
ALTER TABLE [dbo].[TournamentEntries]  WITH CHECK ADD FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD FOREIGN KEY([PrizeId])
REFERENCES [dbo].[Prizes] ([id])
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD FOREIGN KEY([PrizeId])
REFERENCES [dbo].[Prizes] ([id])
GO
ALTER TABLE [dbo].[TournamentPrizes]  WITH CHECK ADD FOREIGN KEY([TournamentId])
REFERENCES [dbo].[Tournaments] ([id])
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_GetByMatchup]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kacper,Dybowski>
-- Create date: <14.04.2023,,>
-- Description:	<Get all the prizes for a given tournament,,>
-- =============================================
CREATE PROCEDURE [dbo].[spMatchupEntries_GetByMatchup] 

@MatchupId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	from dbo.MatchupEntries mte
	where MatchupId=@MatchupId;
END

GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchupEntries_Insert]

	@MatchupId int,
	@ParentMatchupId int,
	@TeamCompetingId int,
	@id int = 0 output
AS
BEGIN

	SET NOCOUNT ON;


	insert into dbo.MatchupEntries (MatchupId, ParentMatchupId,TeamCompetingId)
	values (@MatchupId, @ParentMatchupId, @TeamCompetingId);
	
	select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchupEntries_Update]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchupEntries_Update]
	@id int,
	@TeamCompetingId int = null,
	@Score float = null

AS
BEGIN
	SET NOCOUNT ON;

	update dbo.MatchupEntries
	set TeamCompetingId = @TeamCompetingId, Score=@Score
	where id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_GetByTournament]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchups_GetByTournament] 

@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT m.*
	FROM dbo.Matchups m
	WHERE m.TournamentId = @TournamentId
	order by MatchupRound;
END

GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spMatchups_Insert]

@TournamentId int,
@MatchupRound int,
@id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;

	insert into dbo.Matchups (TournamentId, MatchupRound)
	values (@TournamentId, @MatchupRound);

	select @id= SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spMatchups_Update]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spMatchups_Update]

	@id int,
	@WinnerId int
AS
BEGIN
	SET NOCOUNT ON;

	update dbo.Matchups
	set WinnerId = @WinnerId
	where id = @id;

END
GO
/****** Object:  StoredProcedure [dbo].[spPeople_GetAll]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kacper,Dybowski>
-- Create date: <14.04.2023,,>
-- Description:	<Get all the prizes for a given tournament,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPeople_GetAll] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	FROM dbo.People

END

GO
/****** Object:  StoredProcedure [dbo].[spPeople_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spPeople_Insert] 
	@FirstName varchar(50),
	@LastName varchar(50),
	@EmailAddress varchar (100),
	@CellphoneNumber varchar(20),
	@id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;


	insert into dbo.People (FirstName, LastName, EmailAddress, CellphoneNumber)
	values (@FirstName, @LastName, @EmailAddress, @CellphoneNumber)

	select @id = SCOPE_IDENTITY();
END
GO
/****** Object:  StoredProcedure [dbo].[spPrizes_GetByTournament]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Kacper,Dybowski>
-- Create date: <14.04.2023,,>
-- Description:	<Get all the prizes for a given tournament,,>
-- =============================================
CREATE PROCEDURE [dbo].[spPrizes_GetByTournament] 

@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.*
	from dbo.Prizes p
	inner join dbo.TournamentPrizes t on p.id = t.PrizeId
	where t.TournamentId=@TournamentId;
END

GO
/****** Object:  StoredProcedure [dbo].[spPrizes_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spPrizes_Insert]
	@PlaceNumber int,
	@PlaceName nvarchar(50),
	@PrizeAmount money,
	@PrizePercentage float,
	@id int = 0 output
AS
BEGIN

	SET NOCOUNT ON;


	insert into dbo.Prizes (PlaceNumber,PlaceName,PrizeAmount,PrizePercentage)
	values (@PlaceNumber, @PlaceName, @PrizeAmount, @PrizePercentage);

	select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetAll]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeam_GetAll]
AS
BEGIN

	SET NOCOUNT ON;

	select *
	from dbo.TeamS;
END
GO
/****** Object:  StoredProcedure [dbo].[spTeam_GetByTournament]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeam_GetByTournament] 

@TournamentId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT t.*
	from dbo.Teams t
	inner join dbo.TournamentEntries e on t.id = e.TeamId
	where e.TournamentId = @TournamentId;

END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_GetByTeam]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[spTeamMembers_GetByTeam] 

@TeamId int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT p.*
	from dbo.TeamMembers m
	inner join dbo.People p on m.PersonId = p.id
	where m.TeamId=@TeamId;
END
GO
/****** Object:  StoredProcedure [dbo].[spTeamMembers_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeamMembers_Insert]
	-- Add the parameters for the stored procedure here
@TeamId int,
@PersonId int,
@id int = 0 output
AS
BEGIN

	SET NOCOUNT ON;



insert into dbo.TeamMembers(TeamId,PersonId)
values (@TeamId, @PersonId);

select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTeams_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTeams_Insert] 
	@TeamName varchar(50),
	@id int = 0 output
AS
BEGIN

	SET NOCOUNT ON;

	insert into dbo.Teams (TeamName)
	values (@TeamName);

	select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentEntries_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTournamentEntries_Insert]
	@TournamentId int,
	@TeamId int,
	@id int = 0 output

AS
BEGIN

	SET NOCOUNT ON;

	insert into dbo.TournamentEntries (TournamentId, TeamId)
	values (@TournamentId, @TeamId);

	select @id = SCOPE_IDENTITY();

END
GO
/****** Object:  StoredProcedure [dbo].[spTournamentPrizes_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournamentPrizes_Insert]

	@TournamentId int,
	@PrizeId int,
	@id int = 0 output
AS
BEGIN

	SET NOCOUNT ON;


	insert into dbo.TournamentPrizes (TournamentId, PrizeId)
	values (@TournamentId, @PrizeId);

	select @id = SCOPE_IDENTITY();


END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Complete]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spTournaments_Complete]

	@id int
AS
BEGIN

	SET NOCOUNT ON;


	update dbo.Tournaments
	set Active = 0
	where id = @id;
END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_GetAll]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
CREATE PROCEDURE [dbo].[spTournaments_GetAll] 

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT *
	from dbo.Tournaments
	where Active = 1;

END
GO
/****** Object:  StoredProcedure [dbo].[spTournaments_Insert]    Script Date: 06.06.2023 15:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spTournaments_Insert]
	@TournamentName varchar(50),
	@EntryFee decimal (10,2),
	@id int = 0 output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


	insert into dbo.Tournaments (TournamentName, EntryFee, Active)
	values ( @TournamentName, @EntryFee, 1)

	select @id = SCOPE_IDENTITY();
END
GO
USE [master]
GO
ALTER DATABASE [Tournaments] SET  READ_WRITE 
GO
