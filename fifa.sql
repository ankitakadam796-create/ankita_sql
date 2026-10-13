-- database
create database fifa;
use fifa;

select * from match_events;
alter table match_events modify event_id int primary key;
desc match_events;


-- match_events+match_lineups
create view events_lineups as 
select  
event_id,match_events.match_id,lineup_id,event_type,match_events.team_id,match_events.player_id,
tactical_position,sum(minutes_played)over(partition by player_id) as total_minutes_played
from 
match_events 
left join
 match_lineups on match_events.match_id=match_lineups.match_id 
 order by total_minutes_played desc
;
select * from events_lineups;
select event_type,count(*) as total_event_type from events_lineups group by event_type;
 
 




select * from match_lineups;
alter table match_lineups modify lineup_id int primary key;
desc match_lineups;

-- match_lineups+player_stats
select player_stats.player_id,sum(match_lineups.minutes_played) as total_minutes,tactical_position from player_stats left join match_lineups on player_stats.player_id=match_lineups.player_id;


select * from match_team_stats order by possession_pct desc;
#alter table match_team_stats modify team_id int primary key;
desc match_team_stats;




select * from matches;
alter table matches modify match_id int primary key;
desc matches;

-- matches+referees
select referees.referee_id,name,country,count(match_id)as total from matches right join referees on matches.referee_id=referees.referee_id group by referee_id order by total desc;

-- matches+venues+tournament_stages
create view match_venues_tournament as
select match_id,tournament_stages.stage_id,venues.venue_id,stadium_name,city,country,stage_name,capacity,home_score,away_score,date from 
matches 
left join
venues on matches.venue_id=venues.venue_id
left join
tournament_stages
on
matches.stage_id=tournament_stages.stage_id;
select * from match_venues_tournament;
select stadium_name,max(capacity) as large_stadium from match_venues_tournament group by stadium_name ;
select stage_id,count(*) as total_home_score,count(*) as total_away_score from match_venues_tournament group by stage_id;

select * from venues;
alter table venues modify venue_id int primary key;
desc venues;

select * from tournament_stages;
alter table tournament_stages modify stage_id int primary key;
desc tournament_stages;

select * from teams;
alter table teams modify team_id int primary key;
desc teams;

-- teams+squads_and_players
select teams.team_id,team_name,fifa_code,fifa_ranking_pre_tournament,elo_rating,manager_name from 
teams left join squads_and_players on teams.team_id=squads_and_players.team_id
order by fifa_ranking_pre_tournament asc;

select * from squads_and_players;
alter table squads_and_players modify player_id int primary key;
desc squads_and_players;


select * from referees;
alter table referees modify referee_id int primary key;
desc referees;

select player_id,player_name,position,matches_played from player_stats order by player_id asc;
alter table player_stats modify player_id int primary key;
desc player_stats;







