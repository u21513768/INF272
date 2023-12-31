USE [master]
GO
/****** Object:  Database [DB2]    Script Date: 2022/08/22 11:02:52 ******/
CREATE DATABASE [DB2]
GO
USE [DB2]
GO
/****** Object:  Table [dbo].[CourseAssignmentsMarking]    Script Date: 2022/08/22 11:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseAssignmentsMarking](
	[ID] [int] NOT NULL,
	[CourseID] [int] NOT NULL,
	[MarkerID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
 CONSTRAINT [PK_CourseAssignmentsMarking] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Courses]    Script Date: 2022/08/22 11:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courses](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](350) NOT NULL,
 CONSTRAINT [PK_Courses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Staff]    Script Date: 2022/08/22 11:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff](
	[ID] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 2022/08/22 11:02:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (1, 2990, 476243631, 699943491)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (2, 2532, 811944439, 241955329)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (3, 2487, 486538554, 878653359)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (4, 2948, 747187918, 241955329)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (5, 2183, 534919589, 544659938)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (6, 2680, 133393453, 915625955)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (7, 2288, 327373593, 776967113)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (8, 2288, 649133144, 224586364)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (9, 2183, 811944439, 873214135)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (10, 2528, 282524615, 776967113)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (11, 2305, 637788968, 289659692)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (12, 2476, 272972479, 178378914)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (13, 2183, 637788968, 787499485)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (14, 2365, 989993737, 333476983)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (15, 2305, 534919589, 755343838)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (16, 2401, 125464449, 499518636)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (17, 2639, 476243631, 915625955)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (18, 2232, 146432431, 878653359)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (19, 2621, 647177362, 496761374)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (20, 2501, 811944439, 496761374)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (21, 2795, 272972479, 178378914)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (22, 2528, 637788968, 579859983)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (23, 2412, 649133144, 754893375)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (24, 2403, 494142834, 499518636)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (25, 2401, 647177362, 832875934)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (26, 2937, 869189216, 486624678)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (27, 2401, 828739792, 198161721)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (28, 2487, 963239259, 337854347)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (29, 2288, 466877554, 776967113)
INSERT [dbo].[CourseAssignmentsMarking] ([ID], [CourseID], [MarkerID], [StudentID]) VALUES (30, 2365, 811944439, 486624678)
GO
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2115, N'Politics', N'Record white least sea. Compare thus ready institution everybody too story.
Determine myself trade clearly. Nearly family exist agent machine.
Attention star room less vote bill. Stuff cup should white candidate. Inside floor focus today much.
Me thousand raise situation care help few become. Ability read treatment carry.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2119, N'Complementary Medicine', N'Mission instead spring camera. Director someone girl situation contain. Policy present lead various.
Six product during tree away account. Strong growth kitchen house. Newspaper little student cut.
Break son collection test low scene. Represent especially moment Mr long machine. Rest what she hundred through everything.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2133, N'Medicine', N'Or happen body week support decide something. Third these hundred finally agent. Accept eye occur everyone generation.
Lead star if language computer culture happy environmental. This open wife writer follow.
Call finish age personal model compare young. Response most most. Figure couple brother little.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2183, N'Psychology', N'Camera adult order particular mention coach history. Guy when argue Mr imagine. Fast continue great professor lawyer floor. Fly employee hospital firm whole.
Democratic dark husband of effort imagine nearly. Full clear very recognize week.
Minute responsibility follow available. Friend action discuss even capital. Admit since light.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2232, N'Mechanical Engineering', N'Such stage score.
Mind project purpose customer. Say exactly work sit area glass responsibility kitchen. Others want then part test act.
Develop care system five sea. Site its size. There source public claim.
Within window past item page another. Camera perhaps another religious candidate. That available seem plant.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2288, N'Marketing', N'Hundred study chance red. Law himself pay federal.
Face whether its audience event senior attorney. Ask across dinner product form sound return.
Happy world quite be natural still between. Give side ahead member music politics. Economic contain fire science. Stock history eye together.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2305, N'Education', N'Fine ready chance particularly chance. Song according issue lay party.
Wait story begin morning shoulder pressure go never. Continue write kind everyone go address memory tax. American would cause worry.
Read a network situation range. Around talk western international themselves recent debate. Describe sound politics test.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2308, N'Secretarial Studies', N'Chance yard factor trial above. My piece head carry grow near hit.
Between success material light animal fire fish. Toward computer discover support well least. Difference move right reality. Oil lawyer eye national financial certain stop different.
Strategy rest physical entire that ok. Data data parent. Arm provide wife true direction simple.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2365, N'Physiotherapy', N'Wear for many run home lot floor. Hear material side member state door example.
Say how husband. Seem already image. Land blood time another environmental.
Today often wait dinner visit. Suddenly young success style stay. Low tough realize speech him relationship.
Ready bank field behind spring see. Benefit suddenly candidate foot woman east.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2401, N'Administration and Secretarial Studies', N'Describe suffer feeling be resource pattern across. Born must bag leader quality lay pattern. Leader herself sort contain left everything school fine. Town mission song scene only your trade finish.
Agree become lawyer meeting report. Low high write to then evidence. Under today price down property.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2403, N'Management Studies', N'Lose may song maybe. Though late politics dark commercial.
Sport field human third across recently.
When job candidate tend sing entire form. Level bag performance sometimes. Catch arm this actually expect.
Toward admit peace fall site.
Side well one world give. Choose enter parent eight particularly.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2412, N'Beauty Therapy Studies', N'Minute book theory theory beat stock. Huge example three bill.
In bag significant. Owner suggest entire.
Even together here learn figure high education. Answer manage local cup charge idea. Bar study could final capital employee. Quality scientist star last call view hour.
Mrs smile public once keep class country age. Address development west.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2476, N'Art and Design', N'Over detail building newspaper. Perhaps right until position yard full born ask.
Movie get job crime success area can. Couple eat beyond see him into minute.
Floor leg space him wear take.
Voice might discuss special success I. Walk field method story hold almost care value. Professional easy history kid.
Education other situation meet.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2487, N'Geology', N'Quality trip game off outside author.
Return identify main newspaper. Government pretty resource anyone later PM.
War friend about know measure see realize life. Sense memory down stuff many kid why.
Exactly turn stock sound by possible. Interview although program camera.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2501, N'Hospitality Studies', N'Receive only thing thought born series. Cost daughter style perform. Take safe realize activity true finally prove.
Still raise board base imagine democratic environment may. Despite future seat.
Life quickly we card society traditional wall law. His marriage attention letter. View space hot long. Allow including still plant.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2528, N'Nursing', N'Rather firm investment tree week hope. Herself glass subject win. Avoid claim special environment relationship institution.
Particular bank hair way raise soldier. Ball evidence ten structure sure record.
Beautiful south part. Hear ball whom PM leave across.
Matter laugh study better box watch.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2532, N'History of Art Architecture and Design', N'Degree measure per employee only throw. Alone account reveal stop.
Call ready all cultural. Attention none issue understand such. Treatment attorney space should stay money medical.
Leave up call risk.
Reduce practice happy instead. Allow watch open simply feel hold director its. Radio already recent current opportunity work.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2542, N'Drama Dance and Cinematics', N'Pull involve school peace near career drive. Four side about hit road.
Only bar everything economic total which. Own certainly prevent form. If buy range far often.
Rule word foreign account part really.
Instead contain off color professional fact hope ball. Quality memory tax record be language. Growth allow term we way table while organization.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2550, N'Geology', N'Turn hospital hot once discussion sing big series. Red hold series lawyer sometimes simple chance.
Itself hundred race least truth ago.
Eight tonight too the available. Machine several modern turn none.
As but indicate raise hour. Traditional traditional successful.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2575, N'Beauty Therapy Studies', N'Foreign left around end issue. Position occur team property experience blood central. Home matter ten woman century sister image oil.
Which natural say model guy wear. My less laugh concern gas foreign. Scene need agreement where onto line benefit.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2621, N'Physiotherapy', N'Fall six executive today. Challenge wall trade never anything safe war. Mission anyone if bit.
Property Mrs article case security. Free today action.
Factor six set interesting amount body change. Onto whom piece world level hear.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2639, N'Medical Technology', N'Bill lot to include so. Take thank assume whose. Live task threat hair.
Low religious soon each to south. Easy bit least chance hundred for. Which beautiful generation central institution open single. Southern explain his front.
Artist space relationship. Power star recognize detail listen police. Next ability drug affect know marriage.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2641, N'Hospitality Studies', N'Sit white travel upon. Operation sea since bag to assume open. Writer skin and money myself one meeting.
Follow though baby. Box response radio significant.
Scientist second hospital bring economic. Yourself level to over for.
Thousand any suddenly PM a. Feel home choice girl. Thank two experience glass player impact sell.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2680, N'Hospitality Studies', N'By situation sort leader deal. Become knowledge take particularly agree. Throw education allow cover data require again rule.
Military show sometimes brother contain board purpose. Sort seat woman every cold according. Meeting with growth whole song information last.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2782, N'Project Management Studies', N'Occur loss until mouth cause talk. New contain course may high and.
Material wish turn. Run real training film. Style nice middle economic you floor drive.
Maintain this that teacher head couple speech. Five if relationship enter.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2795, N'Complementary Medicine', N'Technology people majority identify future. Police herself technology trip later over. Report another page edge.
Center suggest opportunity order. Maintain usually station positive member hear. Local court gas possible when course avoid.
Act involve black could firm. Read us investment.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2896, N'History of Art Architecture and Design', N'Light first weight although edge interview. Must true from. Take parent answer perhaps.
Worker thus second father guess attention place. Choose care deal prevent just conference space. Once month can action figure ready measure.
Already mother PM heavy family. Truth daughter market wait ten still business.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2937, N'Computer Studies', N'Artist bed question station reach fear. Hundred certain officer eight soon follow box such.
Agent listen specific address help. Feel hear finish town decide up garden situation. Individual skill cup major like.
Themselves class range same in. Apply card agency forget turn less.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2948, N'Paralegal Studies', N'Soon along out health study baby choose. Cost institution candidate health agree coach. Big let right building play will recently.
Relate my election professor event. Gas man financial loss sell decision.
Huge many morning newspaper detail cold measure. Lay happy board.')
INSERT [dbo].[Courses] ([ID], [Name], [Description]) VALUES (2990, N'Counselling', N'Product either camera we check. Simple child art military issue may two.
Event responsibility across student majority let less bed. Now beat anyone consider toward beyond.
Husband game party change approach tough.
Degree fact situation argue level. Road hit turn point old believe. Four arrive travel back yourself population serve.')
GO
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (125464449, N'Mayor', N'Christina Stephens')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (133393453, N'Varma', N'Dr. Scott Wright')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (141249299, N'Zhuxi', N'Jennifer Lucas')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (146432431, N'Chancellor', N'Candace Reynolds')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (265695545, N'Captain', N'Michael Hart')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (272972479, N'Captain', N'John Lewis')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (282524615, N'Archbishop', N'Matthew Lynch')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (314139579, N'Madam', N'Danny Hernandez')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (327373593, N'Pastor', N'Lee Webb')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (396254643, N'Varma', N'Kelly Young')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (466877554, N'Captain', N'Alyssa Graham')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (476243631, N'Archbishop', N'Benjamin Church')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (486538554, N'Zhuxi', N'Terry Roy')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (494142834, N'Captain', N'Jessica Schmidt')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (524268455, N'Zhuxi', N'Alexis Franco')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (534919589, N'Zhuxi', N'Daniel Stone')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (637788968, N'Varma', N'Dr. Sarah Williams DVM')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (647177362, N'Mayor', N'Casey Norton')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (649133144, N'Pastor', N'Brittany Travis')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (747187918, N'Doctor', N'Robert Cunningham')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (771539431, N'Doctor', N'Christina Morris')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (811944439, N'Zhuxi', N'Jennifer Davis')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (828739792, N'Sir', N'Nicholas Burke')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (843259687, N'Shah', N'James Morgan')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (858974836, N'Reader', N'Heather Brown')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (869189216, N'Captain', N'Charles Hobbs')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (945153868, N'Madam', N'Stephanie Wood')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (963239259, N'Chancellor', N'Jordan Burns Jr.')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (989993737, N'Madam', N'Kelly Thomas')
INSERT [dbo].[Staff] ([ID], [Title], [Name]) VALUES (994413983, N'Sultan', N'Alan Harper')
GO
INSERT [dbo].[Students] ([ID], [Name]) VALUES (178378914, N'Ryan Gonzalez')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (198161721, N'Scott Martinez')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (224563918, N'Patrick Arellano')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (224586364, N'Angela Harris')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (234233292, N'Jill Owen')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (241955329, N'Steven Schwartz')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (253779494, N'Mrs. Julie Bean')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (254548559, N'Sonya Galloway')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (289659692, N'Samantha Young')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (333476983, N'Anna Barnes')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (337854347, N'Rachel Scott')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (475326545, N'Johnathan Powers')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (486624678, N'Kenneth Williams')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (496761374, N'Dr. Misty Sparks')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (499518636, N'Nicolas Jackson')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (544659938, N'Matthew Knight')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (561635214, N'James Mendoza')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (579859983, N'Joshua Fritz')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (582324364, N'Morgan Morris')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (699943491, N'Cassandra Hoffman')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (754893375, N'Kimberly Foster')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (755343838, N'Brian Schmidt')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (756487144, N'Mckenzie Rowe')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (776967113, N'Ricky Patton')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (787499485, N'Michael Miller')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (832875934, N'Ernest Flynn')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (873214135, N'Sheena Acevedo')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (878653359, N'Amy Adams')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (915625955, N'Julia Lucero')
INSERT [dbo].[Students] ([ID], [Name]) VALUES (956254345, N'Richard Hernandez')
GO
USE [master]
GO
ALTER DATABASE [DB2] SET  READ_WRITE 
GO
