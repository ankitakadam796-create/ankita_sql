use fifa;
select * from Match_event;
select * from Match_Lineups;
select match_id,team_id,possession_pct,total_shots,player_of_the_match from Match_team_status;
select match_id,stage_id,venue_id,away_score,home_score,player_of_the_match_id from Matches;
select * from teams;
select * from venues;
select * from Referees;
select * from Tournament_stages;
select player_id,team_id,position,matches_played,minutes_played from player_status;
select * from squads_and_players;



select event_id,match_event.match_id,tactical_position,event_type,match_event.team_id,minutes_played
from match_event left join match_lineups on match_event.match_id=match_lineups.match_id;

create view matches_team_status as
select match_team_status.match_id,team_id,possession_pct,total_shots,away_score,home_score,player_of_the_match,player_of_the_match_id 
from match_team_status left join matches on match_team_status.match_id=matches.match_id order by possession_pct desc;
-- sub queries
select team_id,possession_pct,total_shots,player_of_the_match from matches_team_status where possession_pct>
(select avg(possession_pct) from matches_team_status)order by possession_pct desc;


create view matches_venues as
select matches.stage_id,venues.venue_id,referee_id,player_of_the_match_id,stadium_name,city,country,venues.capacity
 from matches left join venues on matches.venue_id=matches.venue_id;
 -- sub query
select stadium_name,city,country,capacity from matches_venues where capacity>(select avg(capacity) from matches_venues) order by capacity desc;


select matches.match_id,tournament_stages.stage_id,venue_id,referee_id,stage_name from matches 
left join tournament_stages on matches.stage_id=tournament_stages.stage_id;


select matches.match_id,referees.referee_id,name,country from 
matches left join referees on matches.referee_id=referees.referee_id;

select teams.team_id,team_name,fifa_code,group_letter,confederation,fifa_ranking_pre_tournament,elo_rating,manager_name,player_id,player_name from teams 
left join player_status on teams.team_id=player_status.team_id;

create view player_squads as
select player_status.player_id,player_status.player_name,player_status.team_id,player_status.position,matches_played,minutes_played,club_team,
market_value_eur,caps,height_cm,squads_and_players.goals
from player_status left join squads_and_players on player_status.player_id=squads_and_players.player_id;
select * from player_squads;

-- sub queries
select player_id,player_name,club_team,goals from player_squads where goals>(select avg(goals) from player_squads) order by goals desc;
select player_id,player_name,club_team,caps from player_squads where caps>(select avg(caps) from player_squads) order by caps desc;
select player_id,player_name,club_team,market_value_eur from player_squads where market_value_eur>
(select avg(market_value_eur) from player_squads) order by market_value_eur desc;