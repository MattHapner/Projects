/*INSERT INTO missions_track.mission VALUES (0,'Nerds4Christ','www.nerds4christ.org'),
                                          (1,'Project Mercy','www.projectmercy.com'),
                                          (2,'Salvation Army','www.salvationarmy.org');
INSERT INTO missions_track.volunteer VALUES (0,'Bob Jones','bob_jones','mommamia123','bob_jones@nerds4christ.org','123-456-7890','123 N South St Anchorage, AK'),
                                            (1,'Mike Fields','mike_fields','bigmike123','mike_fields@nerds4christ.org','012-345-6789','123 N East St Anchorage, AK'),
                                            (2,'Matt Lee','matt_lee','baseball123','matt_lee@projectmercy.com','232-232-2323','194 W Salam St. Butajira, Ethiopia');
INSERT INTO missions_track.skill VALUES (0,'Construction Work','Can build something out of wood'),
                                        (1,'Farming','Knows how to work with livestock and crops'),
                                        (2,'Plumbing','Can fix issues with plumbing'),
                                        (3,'Electrical Work','Knows wiring');
INSERT INTO missions_track.country VALUES (0,'USA'),(1,'Ethiopia'),(2,'Ecuador');
INSERT INTO missions_track.interaction VALUES (0,CURRENT_TIMESTAMP,'Good conversation. Nice guy and good fit.'),
                                              (1,CURRENT_TIMESTAMP,'Was not a super clear communicator; could help somewhat.'),
                                              (2,CURRENT_TIMESTAMP,'Am very hopeful of his impact in Ethiopia.');
INSERT INTO missions_track.coordinators VALUES (0,1),
                                               (2,2);
INSERT INTO missions_track.abilities VALUES (0,0,'Retired architect','very high'),
                                            (3,1,'Wired his shed','moderate'),
                                            (2,2,'Interned as a plumber','moderate')
INSERT INTO missions_track.need VALUES (0,0,0,0,'moderate'),
                                       (1,1,2,1,'high'),
                                       (2,1,3,1,'high'),
                                       (3,2,1,2,'low');
INSERT INTO missions_track.interests VALUES (0,1,'very high'),
                                            (1,2,'high');
INSERT INTO missions_track.assigned_contacts VALUES (0,1,0,0,0,0),
                                                    (1,2,1,1,1,1),
                                                    (2,2,0,2,0,0);*/

SET SCHEMA 'missions_track';

-- (a) All countries and the skills required in each, sorted by country and then by skill
SELECT country.name, skill.name
FROM country INNER JOIN need ON country.id = need.country_id
             INNER JOIN skill ON need.skill_id = skill.id
ORDER BY country.name, skill.name;

-- (b) All volunteers, including their skills (with level of ability) and geographic interest (with country and interest level).
SELECT volunteer.name, s.name AS skill_name, a.ability, a.experience_level, c.name, i.interest_level
FROM volunteer INNER JOIN abilities a on volunteer.id = a.volunteer_id
               INNER JOIN skill s on a.skill_id = s.id
               INNER JOIN interests i on volunteer.id = i.volunteer_id
               INNER JOIN country c on i.country_id = c.id;

-- (c) All missions and their needs, including the skill, country, and urgency of each.
SELECT mission.name, s.name AS skill_name, c.name, n.urgency
FROM mission INNER JOIN need n on mission.id = n.mission_id
             INNER JOIN skill s on n.skill_id = s.id
             INNER JOIN country c on n.country_id = c.id;

-- (d) All volunteer coordinators, including their mission’s name and their personal information (phone, etc.).
SELECT volunteer.name,m2.name AS mission_name,volunteer.email,volunteer.phone_no,volunteer.postal_addr
FROM volunteer INNER JOIN coordinators c2 on volunteer.id = c2.coordinator_id
               INNER JOIN mission m2 on c2.mission_id = m2.id

-- (e) For each mission, all records of contacts between a volunteer coordinator and a volunteer.
SELECT mission.name,v.name AS coordinator, v2.name AS volunteer, i.date_time, i.notes
FROM mission INNER JOIN coordinators c2 on mission.id = c2.mission_id
             INNER JOIN volunteer v on c2.coordinator_id = v.id
             INNER JOIN assigned_contacts a on v.id = a.coordinator_id
             INNER JOIN interaction i on a.interaction_id = i.id
             INNER JOIN volunteer v2 on a.volunteer_id = v2.id