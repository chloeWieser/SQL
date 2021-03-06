-- --
-- -- PostgreSQL database dump
-- --
-- ​SET statement_timeout = 0;
-- SET lock_timeout = 0;
-- SET client_encoding = 'UTF8';
-- SET standard_conforming_strings = on;
-- SET check_function_bodies = false;
-- SET client_min_messages = warning;
-- ​--
-- -- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:
-- --
-- ​CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
-- --
-- -- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner:
-- --
-- COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
-- SET search_path = public, pg_catalog;
-- SET default_tablespace = '';
-- SET default_with_oids = false;
-- --
-- -- Name: project; Type: TABLE; Schema: public; Owner: airportyh; Tablespace:
-- --
-- CREATE TABLE project (
--     id integer NOT NULL,
--     name character varying
-- );
-- --
-- -- Name: project_id_seq; Type: SEQUENCE; Schema: public; Owner: airportyh
-- --
-- CREATE SEQUENCE project_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;
-- --
-- -- Name: project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airportyh
-- --
-- ALTER SEQUENCE project_id_seq OWNED BY project.id;
-- --
-- -- Name: project_uses_tech; Type: TABLE; Schema: public; Owner: airportyh; Tablespace:
-- --
-- CREATE TABLE project_uses_tech (
--     project_id integer,
--     tech_id integer
-- );
-- --
-- -- Name: tech; Type: TABLE; Schema: public; Owner: airportyh; Tablespace:
-- --
-- CREATE TABLE tech (
--     id integer NOT NULL,
--     name character varying
-- );​
-- --
-- -- Name: tech_id_seq; Type: SEQUENCE; Schema: public; Owner: airportyh
-- --
-- CREATE SEQUENCE tech_id_seq
--     START WITH 1
--     INCREMENT BY 1
--     NO MINVALUE
--     NO MAXVALUE
--     CACHE 1;​
-- --
-- -- Name: tech_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: airportyh
-- --
-- ALTER SEQUENCE tech_id_seq OWNED BY tech.id;
-- --
-- -- Name: id; Type: DEFAULT; Schema: public; Owner: airportyh
-- --
-- ALTER TABLE ONLY project ALTER COLUMN id SET DEFAULT nextval('project_id_seq'::regclass);
-- --
-- -- Name: id; Type: DEFAULT; Schema: public; Owner: airportyh
-- --
-- ALTER TABLE ONLY tech ALTER COLUMN id SET DEFAULT nextval('tech_id_seq'::regclass);
-- --
-- -- Data for Name: project; Type: TABLE DATA; Schema: public; Owner: airportyh
-- --
-- COPY project (id, name) FROM stdin;
-- 1	School Bus
-- 2	Medium Blog Layout
-- 3	Mozilla Front Page
-- 4	Personal Website
-- 5	Modal Dialog
-- 6	CSS Tricks Blog Layout
-- 7	Whiteboard Exercises
-- 8	RPG Hero Game
-- 9	Catch the Monster Game
-- 10	Phone Book
-- 11	Turtle Graphics Exercises
-- \.
-- --
-- -- Name: project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airportyh
-- --
-- SELECT pg_catalog.setval('project_id_seq', 11, true);
-- --
-- -- Data for Name: project_uses_tech; Type: TABLE DATA; Schema: public; Owner: airportyh
-- --
-- COPY project_uses_tech (project_id, tech_id) FROM stdin;
-- 1	1
-- 1	2
-- 2	1
-- 2	2
-- 3	1
-- 3	2
-- 3	9
-- 4	1
-- 4	2
-- 5	1
-- 5	2
-- 6	1
-- 6	2
-- 8	4
-- 9	4
-- 9	6
-- 10	4
-- 11	4
-- 11	5
-- 8	10
-- 9	10
-- 10	11
-- 10	12
-- \.
-- --
-- -- Data for Name: tech; Type: TABLE DATA; Schema: public; Owner: airportyh
-- --
-- COPY tech (id, name) FROM stdin;
-- 1	HTML
-- 2	CSS
-- 3	JavaScript
-- 4	Python
-- 5	Turtle Graphics
-- 6	PyGame
-- 7	Java
-- 8	Ruby
-- 9	Bootstrap
-- 10	Objects
-- 11	File IO
-- 12	Pickle
-- \.
-- --
-- -- Name: tech_id_seq; Type: SEQUENCE SET; Schema: public; Owner: airportyh
-- --
-- SELECT pg_catalog.setval('tech_id_seq', 12, true);
-- --
-- -- Name: project_pkey; Type: CONSTRAINT; Schema: public; Owner: airportyh; Tablespace:
-- --
-- ALTER TABLE ONLY project
--     ADD CONSTRAINT project_pkey PRIMARY KEY (id);
-- --
-- -- Name: tech_pkey; Type: CONSTRAINT; Schema: public; Owner: airportyh; Tablespace:
-- --
-- ALTER TABLE ONLY tech
--     ADD CONSTRAINT tech_pkey PRIMARY KEY (id);
-- --
-- -- Name: project_uses_tech_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airportyh
-- --
-- ALTER TABLE ONLY project_uses_tech
--     ADD CONSTRAINT project_uses_tech_project_id_fkey FOREIGN KEY (project_id) REFERENCES project(id);
-- --
-- -- Name: project_uses_tech_tech_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: airportyh
-- --
-- ALTER TABLE ONLY project_uses_tech
--     ADD CONSTRAINT project_uses_tech_tech_id_fkey FOREIGN KEY (tech_id) REFERENCES tech(id);
-- --
-- -- Name: public; Type: ACL; Schema: -; Owner: airportyh
-- --
-- REVOKE ALL ON SCHEMA public FROM PUBLIC;
-- GRANT ALL ON SCHEMA public TO PUBLIC;
-- --
-- -- PostgreSQL database dump complete
-- --


---?START OF HOMEWORK
-- ?Write queries to find the answers below:

-- What are all projects that use JavaScript?

-- SELECT project.name as project_name, tech.name as tech_name
-- FROM tech
-- JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
-- JOIN project ON project_uses_tech.project_id = project.id
-- WHERE tech.name = 'JavaScript';




-- What are all technologies used by the Personal Website?

-- SELECT tech.name as technologies, project.name as project_name
-- FROM tech
-- JOIN project_uses_tech ON project_uses_tech.tech_id = tech.id
-- JOIN project ON project_uses_tech.project_id = project.id
-- WHERE project.name = 'Personal Website';




-- Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?

-- SELECT *
-- FROM tech 
-- LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id;

--answer: Ruby, Javascript and Java



-- Based on the previous query, get the count of the number of techs used by each project.

-- SELECT COUNT(project_id) as number_of_languagesn, project_id
-- FROM 
-- ( SELECT * 
-- FROM tech 
-- LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id)
-- as techUse
-- GROUP BY project_id
-- ORDER BY project_id;




-- Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?

-- SELECT *
-- FROM project 
-- LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id;

-- Answer: Whiteboard exercises





-- Based on the previous query, get the count of the number of projects that use each tech.
SELECT COUNT(tech_id) as number_of_projects, project_id FROM(
SELECT *
FROM project 
LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id)
as howManyProjects
ORDER BY tech_id;


-- List all projects along with each technology used by it. You will need to do a three-way join.
-- SELECT project.name as project_name, tech.name as tech_name
-- FROM project
-- JOIN project_uses_tech ON project_uses_tech.project_id = project.id
-- JOIN tech ON project_uses_tech.tech_id = tech.id



-- List all the distinct techs that are used by at least one project.



-- List all the distinct techs that are not used by any projects.



-- List all the distinct projects that use at least one tech.



-- List all the distinct projects that use no tech.



-- Order the projects by how many tech it uses.



-- Order the tech by how many projects use it.



-- What is the average number of techs used by a project?