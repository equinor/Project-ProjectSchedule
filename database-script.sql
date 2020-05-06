USE [projectprojectschedulesqlprod]
GO
/****** Object:  User [ProjectProjectScheduleDFProd]    Script Date: 06.05.2020 12:37:19 ******/
CREATE USER [ProjectProjectScheduleDFProd] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [project-projectschedule-prod]    Script Date: 06.05.2020 12:37:19 ******/
CREATE USER [project-projectschedule-prod] FROM  EXTERNAL PROVIDER  WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [datafactory]    Script Date: 06.05.2020 12:37:19 ******/
CREATE ROLE [datafactory]
GO
/****** Object:  DatabaseRole [marineplanning_reader]    Script Date: 06.05.2020 12:37:19 ******/
CREATE ROLE [marineplanning_reader]
GO
ALTER ROLE [datafactory] ADD MEMBER [ProjectProjectScheduleDFProd]
GO
ALTER ROLE [marineplanning_reader] ADD MEMBER [project-projectschedule-prod]
GO
/****** Object:  Schema [enterprise]    Script Date: 06.05.2020 12:37:19 ******/
CREATE SCHEMA [enterprise]
GO
/****** Object:  Schema [raw]    Script Date: 06.05.2020 12:37:19 ******/
CREATE SCHEMA [raw]
GO
/****** Object:  Schema [ref]    Script Date: 06.05.2020 12:37:20 ******/
CREATE SCHEMA [ref]
GO
/****** Object:  Table [enterprise].[project_project_schedule_marine_planning]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [enterprise].[project_project_schedule_marine_planning](
	[FacilityCode] [varchar](4) NOT NULL,
	[NetworkName] [nvarchar](200) NOT NULL,
	[NetworkDescription] [nvarchar](200) NULL,
	[ActivityNumber] [varchar](50) NULL,
	[ActivityDescription] [varchar](255) NULL,
	[EstimatedStart] [datetime] NULL,
	[EstimatedFinish] [datetime] NULL,
	[VesselName] [varchar](50) NULL,
	[VesselType] [varchar](255) NULL,
	[ProContractor] [varchar](255) NULL,
	[Contractor] [varchar](255) NULL,
	[MarineOps] [varchar](255) NULL,
	[TypeLevel1] [varchar](255) NULL,
	[TypeLevel2] [varchar](255) NULL,
	[TypeLevel3] [varchar](255) NULL,
	[TypeLevel4] [varchar](255) NULL,
	[SystemNumber] [varchar](50) NULL,
	[SystemDescription] [varchar](255) NULL,
	[InstalledTags] [varchar](50) NULL,
	[InstalledComponents] [varchar](255) NULL,
	[PositionTagNumbers] [varchar](255) NULL,
	[StartTagNumber] [varchar](50) NULL,
	[MapId] [varchar](1000) NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [enterprise].[project_project_schedule_marine_planning] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [enterprise].[project_project_schedule_marine_planning] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [enterprise].[project_project_schedule_marine_planning] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [enterprise].[project_project_schedule_marine_planning] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [enterprise].[project_project_schedule_marine_planning] TO [datafactory] AS [dbo]
GO
/****** Object:  View [enterprise].[v_project_project_schedule_marine_planning_1_0]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [enterprise].[v_project_project_schedule_marine_planning_1_0]
as
SELECT [FacilityCode]
      ,[NetworkName]
      ,[NetworkDescription]
      ,[ActivityNumber]
      ,[ActivityDescription]
      ,[EstimatedStart]
      ,[EstimatedFinish]
      ,[VesselName]
      ,[VesselType]
      ,[ProContractor]
      ,[Contractor]
      ,[MarineOps]
      ,[TypeLevel1]
      ,[TypeLevel2]
      ,[TypeLevel3]
      ,[TypeLevel4]
      ,[SystemNumber]
      ,[SystemDescription]
      ,[InstalledTags]
      ,[InstalledComponents]
      ,[PositionTagNumbers]
      ,[StartTagNumber]
      ,[MapId]
  FROM [enterprise].[project_project_schedule_marine_planning]
GO
GRANT SELECT ON [enterprise].[v_project_project_schedule_marine_planning_1_0] TO [marineplanning_reader] AS [dbo]
GO
/****** Object:  Table [ref].[NetIdFacilityMapping]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [ref].[NetIdFacilityMapping](
	[net_id] [int] NOT NULL,
	[facility_code] [varchar](4) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [raw].[activity_texts]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[activity_texts](
	[seq] [int] NOT NULL,
	[net_id] [int] NOT NULL,
	[field_nr] [smallint] NOT NULL,
	[field_value] [varchar](1000) NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_act_texts] PRIMARY KEY CLUSTERED 
(
	[net_id] ASC,
	[seq] ASC,
	[field_nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT DELETE ON [raw].[activity_texts] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[activity_texts] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[activity_texts] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[activity_texts] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[activity_texts] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[activities]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[activities](
	[seq] [int] NOT NULL,
	[an] [varchar](50) NULL,
	[du] [int] NULL,
	[pc] [float] NULL,
	[rdu] [int] NULL,
	[wpn] [int] NULL,
	[tse] [datetime] NULL,
	[tsl] [datetime] NULL,
	[tce] [datetime] NULL,
	[tcl] [datetime] NULL,
	[acs] [datetime] NULL,
	[acf] [datetime] NULL,
	[es] [datetime] NULL,
	[ef] [datetime] NULL,
	[ls] [datetime] NULL,
	[lf] [datetime] NULL,
	[tf] [int] NULL,
	[ff] [int] NULL,
	[des] [varchar](255) NULL,
	[subnet_id] [int] NULL,
	[net_id] [int] NOT NULL,
	[r1] [int] NULL,
	[r2] [int] NULL,
	[r3] [int] NULL,
	[r4] [int] NULL,
	[r5] [int] NULL,
	[r6] [int] NULL,
	[r7] [int] NULL,
	[r8] [int] NULL,
	[r9] [int] NULL,
	[r10] [int] NULL,
	[r11] [int] NULL,
	[r12] [int] NULL,
	[r13] [int] NULL,
	[r14] [int] NULL,
	[r15] [int] NULL,
	[r16] [int] NULL,
	[r17] [int] NULL,
	[r18] [int] NULL,
	[r19] [int] NULL,
	[r20] [int] NULL,
	[d1] [datetime] NULL,
	[d2] [datetime] NULL,
	[d3] [datetime] NULL,
	[d4] [datetime] NULL,
	[n1] [float] NULL,
	[n2] [float] NULL,
	[n3] [float] NULL,
	[n4] [float] NULL,
	[n11] [float] NULL,
	[n12] [float] NULL,
	[n13] [float] NULL,
	[n14] [float] NULL,
	[on_target] [smallint] NULL,
	[jobflag] [smallint] NULL,
	[current_progress] [float] NULL,
	[frontline_date] [datetime] NULL,
	[cancelled] [datetime] NULL,
	[d5] [datetime] NULL,
	[d6] [datetime] NULL,
	[d7] [datetime] NULL,
	[d8] [datetime] NULL,
	[remarks] [text] NULL,
	[original_qty] [float] NULL,
	[approved_vo_qty] [float] NULL,
	[estimated_vo_qty] [float] NULL,
	[subcontr_vo_qty] [float] NULL,
	[internal_vo_qty] [float] NULL,
	[jobpack_est_qty] [float] NULL,
	[expended_qty] [float] NULL,
	[esa] [datetime] NULL,
	[current_as] [datetime] NULL,
	[current_af] [datetime] NULL,
	[current_planned_prog] [float] NULL,
	[base_planned_prog] [float] NULL,
	[oes] [datetime] NULL,
	[oef] [datetime] NULL,
	[ols] [datetime] NULL,
	[olf] [datetime] NULL,
	[bes] [datetime] NULL,
	[besa] [datetime] NULL,
	[bef] [datetime] NULL,
	[bls] [datetime] NULL,
	[blf] [datetime] NULL,
	[ces] [datetime] NULL,
	[cef] [datetime] NULL,
	[cls] [datetime] NULL,
	[clf] [datetime] NULL,
	[original_qty1] [float] NULL,
	[csh] [float] NULL,
	[rsh] [float] NULL,
	[tsh] [float] NULL,
	[curr_frontline_date] [datetime] NULL,
	[ess] [datetime] NULL,
	[efs] [datetime] NULL,
	[tfs] [int] NULL,
	[ffs] [int] NULL,
	[hammock] [tinyint] NULL,
	[analyse_opt] [int] NULL,
	[fsd] [datetime] NULL,
	[ffd] [datetime] NULL,
	[manual_prog_flag] [smallint] NULL,
	[current_pc] [float] NULL,
	[rdua] [int] NULL,
	[cesa] [datetime] NULL,
	[ctf] [int] NULL,
	[cff] [int] NULL,
	[loos] [tinyint] NULL,
	[coos] [tinyint] NULL,
	[out_of_sync] [tinyint] NULL,
	[d9] [datetime] NULL,
	[d10] [datetime] NULL,
	[d11] [datetime] NULL,
	[d12] [datetime] NULL,
	[d13] [datetime] NULL,
	[d14] [datetime] NULL,
	[d15] [datetime] NULL,
	[d16] [datetime] NULL,
	[d17] [datetime] NULL,
	[d18] [datetime] NULL,
	[d19] [datetime] NULL,
	[d20] [datetime] NULL,
	[n5] [float] NULL,
	[n6] [float] NULL,
	[n7] [float] NULL,
	[n8] [float] NULL,
	[n9] [float] NULL,
	[n10] [float] NULL,
	[n15] [float] NULL,
	[n16] [float] NULL,
	[n17] [float] NULL,
	[n18] [float] NULL,
	[n19] [float] NULL,
	[n20] [float] NULL,
	[l1] [tinyint] NULL,
	[l2] [tinyint] NULL,
	[l3] [tinyint] NULL,
	[l4] [tinyint] NULL,
	[l5] [tinyint] NULL,
	[l6] [tinyint] NULL,
	[l7] [tinyint] NULL,
	[l8] [tinyint] NULL,
	[l9] [tinyint] NULL,
	[l10] [tinyint] NULL,
	[l11] [tinyint] NULL,
	[l12] [tinyint] NULL,
	[l13] [tinyint] NULL,
	[l14] [tinyint] NULL,
	[l15] [tinyint] NULL,
	[l16] [tinyint] NULL,
	[l17] [tinyint] NULL,
	[l18] [tinyint] NULL,
	[l19] [tinyint] NULL,
	[l20] [tinyint] NULL,
	[r21] [int] NULL,
	[r22] [int] NULL,
	[r23] [int] NULL,
	[r24] [int] NULL,
	[r25] [int] NULL,
	[r26] [int] NULL,
	[r27] [int] NULL,
	[r28] [int] NULL,
	[r29] [int] NULL,
	[r30] [int] NULL,
	[fcdu] [int] NULL,
	[fcesa] [datetime] NULL,
	[fcef] [datetime] NULL,
	[resa] [datetime] NULL,
	[res] [datetime] NULL,
	[ref] [datetime] NULL,
	[rls] [datetime] NULL,
	[rlf] [datetime] NULL,
	[rev_frontline_date] [datetime] NULL,
	[revised_planned_prog] [float] NULL,
	[fcqty] [float] NULL,
	[dur_fmt] [tinyint] NULL,
	[o1] [int] NULL,
	[o2] [int] NULL,
	[o3] [int] NULL,
	[o4] [int] NULL,
	[o5] [int] NULL,
	[o6] [int] NULL,
	[o7] [int] NULL,
	[o8] [int] NULL,
	[o9] [int] NULL,
	[o10] [int] NULL,
	[o11] [int] NULL,
	[o12] [int] NULL,
	[o13] [int] NULL,
	[o14] [int] NULL,
	[o15] [int] NULL,
	[o16] [int] NULL,
	[o17] [int] NULL,
	[o18] [int] NULL,
	[o19] [int] NULL,
	[o20] [int] NULL,
	[o21] [int] NULL,
	[o22] [int] NULL,
	[o23] [int] NULL,
	[o24] [int] NULL,
	[o25] [int] NULL,
	[o26] [int] NULL,
	[o27] [int] NULL,
	[o28] [int] NULL,
	[o29] [int] NULL,
	[o30] [int] NULL,
	[row_no] [int] NULL,
	[outline_level] [tinyint] NULL,
	[link_summary] [int] NULL,
	[cpc] [float] NULL,
	[rev_scope] [float] NULL,
	[u1] [varchar](10) NULL,
	[u2] [varchar](10) NULL,
	[u3] [varchar](10) NULL,
	[u4] [varchar](10) NULL,
	[u5] [varchar](10) NULL,
	[u6] [varchar](10) NULL,
	[u7] [varchar](10) NULL,
	[u8] [varchar](10) NULL,
	[u9] [varchar](10) NULL,
	[u10] [varchar](10) NULL,
	[evm_method] [varchar](2) NULL,
	[evm_parm] [varchar](100) NULL,
	[min_dur] [int] NULL,
	[act_exi] [tinyint] NULL,
	[act_fit] [tinyint] NULL,
	[alap] [tinyint] NULL,
	[act_type] [smallint] NULL,
	[look_ahead] [int] NULL,
	[r31] [int] NULL,
	[r32] [int] NULL,
	[r33] [int] NULL,
	[r34] [int] NULL,
	[r35] [int] NULL,
	[r36] [int] NULL,
	[r37] [int] NULL,
	[r38] [int] NULL,
	[r39] [int] NULL,
	[r40] [int] NULL,
	[r41] [int] NULL,
	[r42] [int] NULL,
	[r43] [int] NULL,
	[r44] [int] NULL,
	[r45] [int] NULL,
	[r46] [int] NULL,
	[r47] [int] NULL,
	[r48] [int] NULL,
	[r49] [int] NULL,
	[r50] [int] NULL,
	[r51] [int] NULL,
	[r52] [int] NULL,
	[r53] [int] NULL,
	[r54] [int] NULL,
	[r55] [int] NULL,
	[r56] [int] NULL,
	[r57] [int] NULL,
	[r58] [int] NULL,
	[r59] [int] NULL,
	[r60] [int] NULL,
	[d21] [datetime] NULL,
	[d22] [datetime] NULL,
	[d23] [datetime] NULL,
	[d24] [datetime] NULL,
	[d25] [datetime] NULL,
	[d26] [datetime] NULL,
	[d27] [datetime] NULL,
	[d28] [datetime] NULL,
	[d29] [datetime] NULL,
	[d30] [datetime] NULL,
	[d31] [datetime] NULL,
	[d32] [datetime] NULL,
	[d33] [datetime] NULL,
	[d34] [datetime] NULL,
	[d35] [datetime] NULL,
	[d36] [datetime] NULL,
	[d37] [datetime] NULL,
	[d38] [datetime] NULL,
	[d39] [datetime] NULL,
	[d40] [datetime] NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_activities] PRIMARY KEY CLUSTERED 
(
	[seq] ASC,
	[net_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
GRANT DELETE ON [raw].[activities] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[activities] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[activities] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[activities] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[activities] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[codeset]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[codeset](
	[config_id] [int] NOT NULL,
	[code] [int] NOT NULL,
	[description] [varchar](255) NULL,
	[short] [varchar](50) NULL,
	[rfield_nr] [int] NOT NULL,
	[sort_field] [int] NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_codeset] PRIMARY KEY CLUSTERED 
(
	[config_id] ASC,
	[code] ASC,
	[rfield_nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT DELETE ON [raw].[codeset] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[codeset] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[codeset] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[codeset] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[codeset] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[networks]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[networks](
	[net_id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[description] [nvarchar](200) NULL,
	[ana_date] [datetime2](7) NULL,
	[ana_tnow] [datetime2](7) NULL,
	[user_id] [int] NULL,
	[na_date] [datetime2](7) NULL,
	[user_name] [nvarchar](200) NULL,
	[cal_id] [int] NOT NULL,
	[profileset] [int] NULL,
	[codeset] [int] NULL,
	[ana_off] [int] NOT NULL,
	[project_id] [int] NULL,
	[derived_from] [int] NULL,
	[stretch] [int] NOT NULL,
	[longest_path] [int] NOT NULL,
	[float_opt] [int] NOT NULL,
	[dependencies] [int] NOT NULL,
	[progress] [int] NOT NULL,
	[save_ana_flag] [int] NULL,
	[sch_opt] [int] NULL,
	[sch_max_delay] [int] NULL,
	[sch_overload_lim] [int] NULL,
	[sch_overload_opt] [int] NULL,
	[calc_id] [int] NULL,
	[save_resource_flag] [int] NULL,
	[lock_scope] [int] NULL,
	[auto_sum_scope] [int] NULL,
	[resource_set] [int] NULL,
	[symbol_set] [int] NULL,
	[os_scope] [int] NULL,
	[disable_split_targets] [int] NULL,
	[sch_filter] [nvarchar](2000) NULL,
	[sch_sort] [nvarchar](100) NULL,
	[gsid] [int] NULL,
	[prog_handling_method] [int] NULL,
	[rate_type] [int] NULL,
	[rate_set] [int] NULL,
	[bscope] [float] NULL,
	[bplanned] [float] NULL,
	[bearned] [float] NULL,
	[expended] [float] NULL,
	[is_template] [int] NULL,
	[status_method] [int] NULL,
	[status_method_option] [int] NULL,
	[status_method_intv] [int] NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_networks] PRIMARY KEY CLUSTERED 
(
	[net_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT DELETE ON [raw].[networks] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[networks] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[networks] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[networks] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[networks] TO [datafactory] AS [dbo]
GO
/****** Object:  View [raw].[v_project_project_schedule_marine_planning]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE view [raw].[v_project_project_schedule_marine_planning]
as
select
m.facility_code FacilityCode,
n.name NetworkName,
n.description NetworkDescription,
a.an ActivityNumber,
a.des ActivityDescription,
a.es EstimatedStart,
a.ef EstimatedFinish,
c24.short VesselName, --r24
c23.description VesselType, --r23
c27.description ProContractor,
c8.description Contractor,
c22.description MarineOps,
c16.description TypeLevel1,
c17.description TypeLevel2,
c18.description TypeLevel3,
c19.description TypeLevel4,
c4.short SystemNumber,
c4.description SystemDescription,
c31.short InstalledTags,
c31.description InstalledComponents,
ISNULL(c33.short,c32.short) PositionTagNumbers,
c15.short StartTagNumber,
at.field_value MapId
from raw.activities a
inner join raw.networks n on a.net_id = n.net_id
inner join ref.NetIdFacilityMapping m on m.net_id = a.net_id
left join raw.codeset c24 on c24.rfield_nr = 24 and c24.config_id = 5531 and c24.code = a.r24
left join raw.codeset c23 on c23.rfield_nr = 23 and c23.config_id = 5531 and c23.code = a.r23
left join raw.codeset c27 on c27.rfield_nr = 27 and c27.config_id = 5531 and c27.code = a.r27
left join raw.codeset c8 on c8.rfield_nr = 8 and c8.config_id = 5472 and c8.code = a.r8
left join raw.codeset c22 on c22.rfield_nr = 22 and c22.config_id = 5531 and c22.code = a.r22
left join raw.codeset c16 on c16.rfield_nr = 16 and c16.config_id = 5472 and c16.code = a.r16
left join raw.codeset c17 on c17.rfield_nr = 17 and c17.config_id = 5472 and c17.code = a.r17
left join raw.codeset c18 on c18.rfield_nr = 18 and c18.config_id = 5472 and c18.code = a.r18
left join raw.codeset c19 on c19.rfield_nr = 19 and c19.config_id = 5472 and c19.code = a.r19
left join raw.codeset c4 on c4.rfield_nr = 4 and c4.config_id = 5472 and c4.code = a.r4
left join raw.codeset c31 on c31.rfield_nr = 31 and c31.config_id = 5472 and c31.code = a.r31
left join raw.codeset c33 on c33.rfield_nr = 33 and c33.config_id = 5472 and c33.code = a.r33
left join raw.codeset c32 on c32.rfield_nr = 32 and c32.config_id = 5472 and c32.code = a.r32
left join raw.codeset c15 on c15.rfield_nr = 15 and c15.config_id = 5472 and c15.code = a.r15
left join raw.activity_texts at on at.field_nr = 39 and at.net_id = a.net_id and at.seq = a.seq
where n.net_id = 6959
GO
/****** Object:  Table [enterprise].[transfer_status]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [enterprise].[transfer_status](
	[Dataset] [varchar](50) NOT NULL,
	[LastSynchronized] [datetime] NOT NULL
) ON [PRIMARY]
GO
GRANT DELETE ON [enterprise].[transfer_status] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [enterprise].[transfer_status] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [enterprise].[transfer_status] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [enterprise].[transfer_status] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [enterprise].[transfer_status] TO [datafactory] AS [dbo]
GO
/****** Object:  View [enterprise].[v_transfer_status_1_0]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [enterprise].[v_transfer_status_1_0]
as
select DataSet, LastSynchronized
from enterprise.transfer_status
GO
GRANT SELECT ON [enterprise].[v_transfer_status_1_0] TO [marineplanning_reader] AS [dbo]
GO
/****** Object:  Table [raw].[activities_tmp]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[activities_tmp](
	[seq] [int] NOT NULL,
	[an] [varchar](50) NULL,
	[du] [int] NULL,
	[pc] [float] NULL,
	[rdu] [int] NULL,
	[wpn] [int] NULL,
	[tse] [datetime] NULL,
	[tsl] [datetime] NULL,
	[tce] [datetime] NULL,
	[tcl] [datetime] NULL,
	[acs] [datetime] NULL,
	[acf] [datetime] NULL,
	[es] [datetime] NULL,
	[ef] [datetime] NULL,
	[ls] [datetime] NULL,
	[lf] [datetime] NULL,
	[tf] [int] NULL,
	[ff] [int] NULL,
	[des] [varchar](255) NULL,
	[subnet_id] [int] NULL,
	[net_id] [int] NOT NULL,
	[r1] [int] NULL,
	[r2] [int] NULL,
	[r3] [int] NULL,
	[r4] [int] NULL,
	[r5] [int] NULL,
	[r6] [int] NULL,
	[r7] [int] NULL,
	[r8] [int] NULL,
	[r9] [int] NULL,
	[r10] [int] NULL,
	[r11] [int] NULL,
	[r12] [int] NULL,
	[r13] [int] NULL,
	[r14] [int] NULL,
	[r15] [int] NULL,
	[r16] [int] NULL,
	[r17] [int] NULL,
	[r18] [int] NULL,
	[r19] [int] NULL,
	[r20] [int] NULL,
	[d1] [datetime] NULL,
	[d2] [datetime] NULL,
	[d3] [datetime] NULL,
	[d4] [datetime] NULL,
	[n1] [float] NULL,
	[n2] [float] NULL,
	[n3] [float] NULL,
	[n4] [float] NULL,
	[n11] [float] NULL,
	[n12] [float] NULL,
	[n13] [float] NULL,
	[n14] [float] NULL,
	[on_target] [smallint] NULL,
	[jobflag] [smallint] NULL,
	[current_progress] [float] NULL,
	[frontline_date] [datetime] NULL,
	[cancelled] [datetime] NULL,
	[d5] [datetime] NULL,
	[d6] [datetime] NULL,
	[d7] [datetime] NULL,
	[d8] [datetime] NULL,
	[remarks] [text] NULL,
	[original_qty] [float] NULL,
	[approved_vo_qty] [float] NULL,
	[estimated_vo_qty] [float] NULL,
	[subcontr_vo_qty] [float] NULL,
	[internal_vo_qty] [float] NULL,
	[jobpack_est_qty] [float] NULL,
	[expended_qty] [float] NULL,
	[esa] [datetime] NULL,
	[current_as] [datetime] NULL,
	[current_af] [datetime] NULL,
	[current_planned_prog] [float] NULL,
	[base_planned_prog] [float] NULL,
	[oes] [datetime] NULL,
	[oef] [datetime] NULL,
	[ols] [datetime] NULL,
	[olf] [datetime] NULL,
	[bes] [datetime] NULL,
	[besa] [datetime] NULL,
	[bef] [datetime] NULL,
	[bls] [datetime] NULL,
	[blf] [datetime] NULL,
	[ces] [datetime] NULL,
	[cef] [datetime] NULL,
	[cls] [datetime] NULL,
	[clf] [datetime] NULL,
	[original_qty1] [float] NULL,
	[csh] [float] NULL,
	[rsh] [float] NULL,
	[tsh] [float] NULL,
	[curr_frontline_date] [datetime] NULL,
	[ess] [datetime] NULL,
	[efs] [datetime] NULL,
	[tfs] [int] NULL,
	[ffs] [int] NULL,
	[hammock] [tinyint] NULL,
	[analyse_opt] [int] NULL,
	[fsd] [datetime] NULL,
	[ffd] [datetime] NULL,
	[manual_prog_flag] [smallint] NULL,
	[current_pc] [float] NULL,
	[rdua] [int] NULL,
	[cesa] [datetime] NULL,
	[ctf] [int] NULL,
	[cff] [int] NULL,
	[loos] [tinyint] NULL,
	[coos] [tinyint] NULL,
	[out_of_sync] [tinyint] NULL,
	[d9] [datetime] NULL,
	[d10] [datetime] NULL,
	[d11] [datetime] NULL,
	[d12] [datetime] NULL,
	[d13] [datetime] NULL,
	[d14] [datetime] NULL,
	[d15] [datetime] NULL,
	[d16] [datetime] NULL,
	[d17] [datetime] NULL,
	[d18] [datetime] NULL,
	[d19] [datetime] NULL,
	[d20] [datetime] NULL,
	[n5] [float] NULL,
	[n6] [float] NULL,
	[n7] [float] NULL,
	[n8] [float] NULL,
	[n9] [float] NULL,
	[n10] [float] NULL,
	[n15] [float] NULL,
	[n16] [float] NULL,
	[n17] [float] NULL,
	[n18] [float] NULL,
	[n19] [float] NULL,
	[n20] [float] NULL,
	[l1] [tinyint] NULL,
	[l2] [tinyint] NULL,
	[l3] [tinyint] NULL,
	[l4] [tinyint] NULL,
	[l5] [tinyint] NULL,
	[l6] [tinyint] NULL,
	[l7] [tinyint] NULL,
	[l8] [tinyint] NULL,
	[l9] [tinyint] NULL,
	[l10] [tinyint] NULL,
	[l11] [tinyint] NULL,
	[l12] [tinyint] NULL,
	[l13] [tinyint] NULL,
	[l14] [tinyint] NULL,
	[l15] [tinyint] NULL,
	[l16] [tinyint] NULL,
	[l17] [tinyint] NULL,
	[l18] [tinyint] NULL,
	[l19] [tinyint] NULL,
	[l20] [tinyint] NULL,
	[r21] [int] NULL,
	[r22] [int] NULL,
	[r23] [int] NULL,
	[r24] [int] NULL,
	[r25] [int] NULL,
	[r26] [int] NULL,
	[r27] [int] NULL,
	[r28] [int] NULL,
	[r29] [int] NULL,
	[r30] [int] NULL,
	[fcdu] [int] NULL,
	[fcesa] [datetime] NULL,
	[fcef] [datetime] NULL,
	[resa] [datetime] NULL,
	[res] [datetime] NULL,
	[ref] [datetime] NULL,
	[rls] [datetime] NULL,
	[rlf] [datetime] NULL,
	[rev_frontline_date] [datetime] NULL,
	[revised_planned_prog] [float] NULL,
	[fcqty] [float] NULL,
	[dur_fmt] [tinyint] NULL,
	[o1] [int] NULL,
	[o2] [int] NULL,
	[o3] [int] NULL,
	[o4] [int] NULL,
	[o5] [int] NULL,
	[o6] [int] NULL,
	[o7] [int] NULL,
	[o8] [int] NULL,
	[o9] [int] NULL,
	[o10] [int] NULL,
	[o11] [int] NULL,
	[o12] [int] NULL,
	[o13] [int] NULL,
	[o14] [int] NULL,
	[o15] [int] NULL,
	[o16] [int] NULL,
	[o17] [int] NULL,
	[o18] [int] NULL,
	[o19] [int] NULL,
	[o20] [int] NULL,
	[o21] [int] NULL,
	[o22] [int] NULL,
	[o23] [int] NULL,
	[o24] [int] NULL,
	[o25] [int] NULL,
	[o26] [int] NULL,
	[o27] [int] NULL,
	[o28] [int] NULL,
	[o29] [int] NULL,
	[o30] [int] NULL,
	[row_no] [int] NULL,
	[outline_level] [tinyint] NULL,
	[link_summary] [int] NULL,
	[cpc] [float] NULL,
	[rev_scope] [float] NULL,
	[u1] [varchar](10) NULL,
	[u2] [varchar](10) NULL,
	[u3] [varchar](10) NULL,
	[u4] [varchar](10) NULL,
	[u5] [varchar](10) NULL,
	[u6] [varchar](10) NULL,
	[u7] [varchar](10) NULL,
	[u8] [varchar](10) NULL,
	[u9] [varchar](10) NULL,
	[u10] [varchar](10) NULL,
	[evm_method] [varchar](2) NULL,
	[evm_parm] [varchar](100) NULL,
	[min_dur] [int] NULL,
	[act_exi] [tinyint] NULL,
	[act_fit] [tinyint] NULL,
	[alap] [tinyint] NULL,
	[act_type] [smallint] NULL,
	[look_ahead] [int] NULL,
	[r31] [int] NULL,
	[r32] [int] NULL,
	[r33] [int] NULL,
	[r34] [int] NULL,
	[r35] [int] NULL,
	[r36] [int] NULL,
	[r37] [int] NULL,
	[r38] [int] NULL,
	[r39] [int] NULL,
	[r40] [int] NULL,
	[r41] [int] NULL,
	[r42] [int] NULL,
	[r43] [int] NULL,
	[r44] [int] NULL,
	[r45] [int] NULL,
	[r46] [int] NULL,
	[r47] [int] NULL,
	[r48] [int] NULL,
	[r49] [int] NULL,
	[r50] [int] NULL,
	[r51] [int] NULL,
	[r52] [int] NULL,
	[r53] [int] NULL,
	[r54] [int] NULL,
	[r55] [int] NULL,
	[r56] [int] NULL,
	[r57] [int] NULL,
	[r58] [int] NULL,
	[r59] [int] NULL,
	[r60] [int] NULL,
	[d21] [datetime] NULL,
	[d22] [datetime] NULL,
	[d23] [datetime] NULL,
	[d24] [datetime] NULL,
	[d25] [datetime] NULL,
	[d26] [datetime] NULL,
	[d27] [datetime] NULL,
	[d28] [datetime] NULL,
	[d29] [datetime] NULL,
	[d30] [datetime] NULL,
	[d31] [datetime] NULL,
	[d32] [datetime] NULL,
	[d33] [datetime] NULL,
	[d34] [datetime] NULL,
	[d35] [datetime] NULL,
	[d36] [datetime] NULL,
	[d37] [datetime] NULL,
	[d38] [datetime] NULL,
	[d39] [datetime] NULL,
	[d40] [datetime] NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_activities_tmp] PRIMARY KEY CLUSTERED 
(
	[seq] ASC,
	[net_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
GRANT DELETE ON [raw].[activities_tmp] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[activities_tmp] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[activities_tmp] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[activities_tmp] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[activities_tmp] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[activity_texts_tmp]    Script Date: 06.05.2020 12:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[activity_texts_tmp](
	[seq] [int] NOT NULL,
	[net_id] [int] NOT NULL,
	[field_nr] [smallint] NOT NULL,
	[field_value] [varchar](1000) NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_act_texts_tmp] PRIMARY KEY CLUSTERED 
(
	[net_id] ASC,
	[seq] ASC,
	[field_nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT DELETE ON [raw].[activity_texts_tmp] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[activity_texts_tmp] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[activity_texts_tmp] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[activity_texts_tmp] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[activity_texts_tmp] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[codeset_tmp]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[codeset_tmp](
	[config_id] [int] NOT NULL,
	[code] [int] NOT NULL,
	[description] [varchar](255) NULL,
	[short] [varchar](50) NULL,
	[rfield_nr] [int] NOT NULL,
	[sort_field] [int] NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_codeset_tmp] PRIMARY KEY CLUSTERED 
(
	[config_id] ASC,
	[code] ASC,
	[rfield_nr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT DELETE ON [raw].[codeset_tmp] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[codeset_tmp] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[codeset_tmp] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[codeset_tmp] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[codeset_tmp] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[networks_tmp]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[networks_tmp](
	[net_id] [int] NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[description] [nvarchar](200) NULL,
	[ana_date] [datetime2](7) NULL,
	[ana_tnow] [datetime2](7) NULL,
	[user_id] [int] NULL,
	[na_date] [datetime2](7) NULL,
	[user_name] [nvarchar](200) NULL,
	[cal_id] [int] NOT NULL,
	[profileset] [int] NULL,
	[codeset] [int] NULL,
	[ana_off] [int] NOT NULL,
	[project_id] [int] NULL,
	[derived_from] [int] NULL,
	[stretch] [int] NOT NULL,
	[longest_path] [int] NOT NULL,
	[float_opt] [int] NOT NULL,
	[dependencies] [int] NOT NULL,
	[progress] [int] NOT NULL,
	[save_ana_flag] [int] NULL,
	[sch_opt] [int] NULL,
	[sch_max_delay] [int] NULL,
	[sch_overload_lim] [int] NULL,
	[sch_overload_opt] [int] NULL,
	[calc_id] [int] NULL,
	[save_resource_flag] [int] NULL,
	[lock_scope] [int] NULL,
	[auto_sum_scope] [int] NULL,
	[resource_set] [int] NULL,
	[symbol_set] [int] NULL,
	[os_scope] [int] NULL,
	[disable_split_targets] [int] NULL,
	[sch_filter] [nvarchar](2000) NULL,
	[sch_sort] [nvarchar](100) NULL,
	[gsid] [int] NULL,
	[prog_handling_method] [int] NULL,
	[rate_type] [int] NULL,
	[rate_set] [int] NULL,
	[bscope] [float] NULL,
	[bplanned] [float] NULL,
	[bearned] [float] NULL,
	[expended] [float] NULL,
	[is_template] [int] NULL,
	[status_method] [int] NULL,
	[status_method_option] [int] NULL,
	[status_method_intv] [int] NULL,
	[inserted_time] [datetime] NULL,
 CONSTRAINT [pk_networks_tmp] PRIMARY KEY CLUSTERED 
(
	[net_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
GRANT DELETE ON [raw].[networks_tmp] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[networks_tmp] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[networks_tmp] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[networks_tmp] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[networks_tmp] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[userfield_config]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[userfield_config](
	[field_nr] [int] NOT NULL,
	[field_type] [char](1) NOT NULL,
	[select_stmnt] [varchar](255) NULL,
	[valid_stmnt] [varchar](255) NULL,
	[label] [varchar](40) NULL,
	[newflag] [smallint] NOT NULL,
	[editflag] [smallint] NOT NULL,
	[config_id] [int] NOT NULL,
	[oc_levels] [int] NULL,
	[summary_opt] [tinyint] NULL,
	[summary_function] [tinyint] NULL,
	[activity_opt] [tinyint] NULL,
	[formula] [varchar](255) NULL,
	[formula_filter] [text] NULL,
	[display] [tinyint] NULL,
	[formula_use_wpn] [tinyint] NULL,
	[formula_wpn] [smallint] NULL,
	[formula_dur_fmt] [smallint] NULL,
	[use_codeset] [int] NULL,
	[use_field_nr] [int] NULL,
	[save_to_db] [smallint] NULL,
	[inserted_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
GRANT DELETE ON [raw].[userfield_config] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[userfield_config] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[userfield_config] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[userfield_config] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[userfield_config] TO [datafactory] AS [dbo]
GO
/****** Object:  Table [raw].[userfield_config_tmp]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [raw].[userfield_config_tmp](
	[field_nr] [int] NOT NULL,
	[field_type] [char](1) NOT NULL,
	[select_stmnt] [varchar](255) NULL,
	[valid_stmnt] [varchar](255) NULL,
	[label] [varchar](40) NULL,
	[newflag] [smallint] NOT NULL,
	[editflag] [smallint] NOT NULL,
	[config_id] [int] NOT NULL,
	[oc_levels] [int] NULL,
	[summary_opt] [tinyint] NULL,
	[summary_function] [tinyint] NULL,
	[activity_opt] [tinyint] NULL,
	[formula] [varchar](255) NULL,
	[formula_filter] [text] NULL,
	[display] [tinyint] NULL,
	[formula_use_wpn] [tinyint] NULL,
	[formula_wpn] [smallint] NULL,
	[formula_dur_fmt] [smallint] NULL,
	[use_codeset] [int] NULL,
	[use_field_nr] [int] NULL,
	[save_to_db] [smallint] NULL,
	[inserted_time] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
GRANT DELETE ON [raw].[userfield_config_tmp] TO [datafactory] AS [dbo]
GO
GRANT INSERT ON [raw].[userfield_config_tmp] TO [datafactory] AS [dbo]
GO
GRANT REFERENCES ON [raw].[userfield_config_tmp] TO [datafactory] AS [dbo]
GO
GRANT SELECT ON [raw].[userfield_config_tmp] TO [datafactory] AS [dbo]
GO
GRANT UPDATE ON [raw].[userfield_config_tmp] TO [datafactory] AS [dbo]
GO
ALTER TABLE [raw].[activities_tmp] ADD  CONSTRAINT [DF_activities_tmp_inserted_time]  DEFAULT (getdate()) FOR [inserted_time]
GO
ALTER TABLE [raw].[activity_texts_tmp] ADD  CONSTRAINT [DF_activity_texts_tmp_inserted_time]  DEFAULT (getdate()) FOR [inserted_time]
GO
ALTER TABLE [raw].[codeset_tmp] ADD  CONSTRAINT [DF_codeset_tmp_inserted_time]  DEFAULT (getdate()) FOR [inserted_time]
GO
ALTER TABLE [raw].[networks_tmp] ADD  CONSTRAINT [DF_networks_tmp_inserted_time]  DEFAULT (getdate()) FOR [inserted_time]
GO
ALTER TABLE [raw].[userfield_config_tmp] ADD  CONSTRAINT [DF_userfield_config_tmp_inserted_time]  DEFAULT (getdate()) FOR [inserted_time]
GO
/****** Object:  StoredProcedure [raw].[activities_import]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [raw].[activities_import]

AS
SET NOCOUNT ON	

TRUNCATE TABLE [raw].[activities];
ALTER TABLE [raw].[activities_tmp] SWITCH TO [raw].[activities];

GO
GRANT EXECUTE ON [raw].[activities_import] TO [datafactory] AS [dbo]
GO
/****** Object:  StoredProcedure [raw].[activity_texts_import]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [raw].[activity_texts_import]

AS
SET NOCOUNT ON	

TRUNCATE TABLE [raw].[activity_texts];
ALTER TABLE [raw].[activity_texts_tmp] SWITCH TO [raw].[activity_texts];

GO
GRANT EXECUTE ON [raw].[activity_texts_import] TO [datafactory] AS [dbo]
GO
/****** Object:  StoredProcedure [raw].[all_tables_import]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [raw].[all_tables_import]
AS
BEGIN

    SET NOCOUNT ON
	EXEC [raw].[activities_import];
	EXEC [raw].[activity_texts_import];
	EXEC [raw].[codeset_import];
	EXEC [raw].[networks_import];
	EXEC [raw].[userfield_config_import];

END
GO
GRANT EXECUTE ON [raw].[all_tables_import] TO [datafactory] AS [dbo]
GO
/****** Object:  StoredProcedure [raw].[codeset_import]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [raw].[codeset_import]

AS
SET NOCOUNT ON	

TRUNCATE TABLE [raw].[codeset];
ALTER TABLE [raw].[codeset_tmp] SWITCH TO [raw].[codeset];

GO
/****** Object:  StoredProcedure [raw].[make_enterprise_data]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [raw].[make_enterprise_data]

AS
SET NOCOUNT ON

DECLARE @TransferStatusCount INT
DECLARE @Dataset varchar(50) = 'Project.ProjectSchedule.MarinePlanning'

BEGIN TRAN

    SELECT @TransferStatusCount = COUNT(*)
                                  FROM enterprise.transfer_status
		                          WHERE DataSet = @Dataset

  	DELETE FROM enterprise.project_project_schedule_marine_planning
	INSERT INTO enterprise.project_project_schedule_marine_planning select * from raw.v_project_project_schedule_marine_planning

    IF @TransferStatusCount = 0
	    INSERT INTO enterprise.transfer_status(Dataset, LastSynchronized)
		VALUES (@Dataset,GETDATE())
	ELSE
		UPDATE enterprise.transfer_status
	    SET LastSynchronized = GETDATE()
	    WHERE Dataset = @Dataset

COMMIT
GO
GRANT EXECUTE ON [raw].[make_enterprise_data] TO [datafactory] AS [dbo]
GO
/****** Object:  StoredProcedure [raw].[networks_import]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [raw].[networks_import]

AS
SET NOCOUNT ON

TRUNCATE TABLE [raw].[networks];
ALTER TABLE [raw].[networks_tmp] SWITCH TO [raw].[networks];

GO
GRANT EXECUTE ON [raw].[networks_import] TO [datafactory] AS [dbo]
GO
/****** Object:  StoredProcedure [raw].[truncate_all_tmp_tables]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      <Author, , Name>
-- Create Date: <Create Date, , >
-- Description: <Description, , >
-- =============================================
CREATE PROCEDURE [raw].[truncate_all_tmp_tables]
AS
BEGIN
	TRUNCATE TABLE [raw].[activities_tmp]
	TRUNCATE TABLE [raw].[activity_texts_tmp]
	TRUNCATE TABLE [raw].[codeset_tmp]
	TRUNCATE TABLE [raw].[networks_tmp]
	TRUNCATE TABLE [raw].[userfield_config_tmp]
END
GO
GRANT EXECUTE ON [raw].[truncate_all_tmp_tables] TO [datafactory] AS [dbo]
GO
/****** Object:  StoredProcedure [raw].[userfield_config_import]    Script Date: 06.05.2020 12:37:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO








CREATE PROCEDURE [raw].[userfield_config_import]

AS
SET NOCOUNT ON	

TRUNCATE TABLE [raw].[userfield_config];
ALTER TABLE [raw].[userfield_config_tmp] SWITCH TO [raw].[userfield_config];

GO
