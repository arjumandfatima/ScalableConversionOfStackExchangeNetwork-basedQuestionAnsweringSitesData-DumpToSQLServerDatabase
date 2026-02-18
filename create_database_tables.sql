
use  StackOverflowBadgesDb_Jan2026
create table StackOverflowBadges (AutoIdPK int Identity(1,1) NOT NULL,
				Id int, 
				UserId int, 
				Name nvarchar(50),
				Date datetime,
				Class tinyint, 
				TagBased bit,
                CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK))

use  StackOverflowCommentsDb_Jan2026
create table StackOverflowComments (AutoIdPK int Identity(1,1) NOT NULL,
				Id int, 
				PostId int,
				Score int,
				Text nvarchar(600),
				CreationDate datetime,
				UserDisplayName nvarchar(40),
				UserId int,
				ContentLicense varchar(30),
				CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK))

use  StackOverflowPostHistoryDb_Jan2026
create table StackOverflowPostHistory (AutoIdPK int Identity(1,1) NOT NULL,
				Id int, 
				PostHistoryTypeId tinyint,
				PostId int,
				RevisionGUID uniqueidentifier,
				CreationDate datetime,
				UserId int, 
				UserDisplayName nvarchar(400),
				Comment nvarchar(400),
				Text nvarchar(max),
				ContentLicense varchar(30),
                CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK))

use  StackOverflowPostLinksDb_Jan2026
create table StackOverflowPostLinks (AutoIdPK int Identity(1,1) NOT NULL,
				Id bigint, 
				CreationDate datetime,
				PostId int, 
				RelatedPostId int,
				LinkTypeId tinyint,
                CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK))

use  StackOverflowPostsDb_Jan2026
create table StackOverflowPosts (AutoIdPK int Identity(1,1) NOT NULL,
				Id int, 
				PostTypeId tinyint,
				AcceptedAnswerId int,
				ParentId int,
				CreationDate datetime,
				DeletionDate datetime, 
				Score int,
				ViewCount int,
				Body nvarchar(max),
				OwnerUserId int,
				OwnerDisplayName nvarchar(40),
				LastEditorUserId int,
				LastEditorDisplayName nvarchar(40), 
				LastEditDate datetime,
				LastActivityDate datetime,
				Title nvarchar(250),
				Tags nvarchar(4000),
				AnswerCount int,
				CommentCount int, 
				FavoriteCount int, 
				ClosedDate datetime,
				CommunityOwnedDate datetime,
				ContentLicense varchar(30), 
                CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK)
				)

use  StackOverflowTagsDb_Jan2026
create table StackOverflowTags (AutoIdPK int Identity(1,1) NOT NULL,
				Id int, 
				TagName nvarchar(35),
				TagCount int, 
				ExcerptPostId int,
				WikiPostId int,
                CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK))

use  StackOverflowUsersDb_Jan2026
create table StackOverflowUsers (AutoIdPK int Identity(1,1) NOT NULL,
				Id int, 
				Reputation int, 
				CreationDate datetime,
				DisplayName nvarchar(40),
				LastAccessDate datetime,
				WebsiteUrl nvarchar(200), 
				Location nvarchar(100), 
				AboutMe nvarchar(max),
				Views int, 
				Upvotes int, 
				DownVotes int, 
				ProfileImageUrl nvarchar(200), 
				AccountId int,
                CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK))

use  StackOverflowVotesDb_Jan2026
create table StackOverflowVotes (AutoIdPK int Identity(1,1) NOT NULL,
				Id int, 
				PostId int, 
				VoteTypeId tinyint,
				UserId int,
				CreationDate datetime,
				BountyAmount int,
                CONSTRAINT PK_AutoIdPK PRIMARY KEY CLUSTERED (AutoIdPK))
