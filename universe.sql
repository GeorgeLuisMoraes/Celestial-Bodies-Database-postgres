--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age integer NOT NULL,
    distance numeric(10,2),
    description text,
    is_active boolean DEFAULT true
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: mission; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    name character varying(60) NOT NULL,
    launch_year integer NOT NULL,
    is_active boolean DEFAULT false
);


ALTER TABLE public.mission OWNER TO freecodecamp;

--
-- Name: mission_mission_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.mission ALTER COLUMN mission_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.mission_mission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter integer NOT NULL,
    orbital_period numeric(10,2),
    is_spherical boolean DEFAULT true,
    discovery_method text
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    diameter integer NOT NULL,
    orbital_period numeric(10,2),
    has_rings boolean DEFAULT false,
    description text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    temperature integer NOT NULL,
    mass numeric(10,2),
    is_visible boolean DEFAULT true,
    description text
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 13600, 0.00, 'Our home galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (2, 'Andromeda', 10000, 25370.00, 'Nearest major galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Triangulum', 12000, 2730.00, 'Spiral galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Whirlpool', 400, 23000.00, 'Interacting spiral galaxy', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (5, 'Sombrero', 9000, 29350.00, 'Galaxy with a bright nucleus', true);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Messier 87', 13000, 53500.00, 'Giant elliptical galaxy', true);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.mission OVERRIDING SYSTEM VALUE VALUES (1, 'Apollo 11', 1969, false);
INSERT INTO public.mission OVERRIDING SYSTEM VALUE VALUES (2, 'Voyager 1', 1977, true);
INSERT INTO public.mission OVERRIDING SYSTEM VALUE VALUES (3, 'James Webb', 2021, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 3, 3474, 27.30, true, 'Ancient observation');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, 22, 0.32, false, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, 12, 1.26, false, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, 3643, 1.77, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, 3122, 3.55, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, 5268, 7.15, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, 4821, 16.69, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Titan', 6, 5150, 15.95, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Rhea', 6, 1528, 4.52, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Iapetus', 6, 1469, 79.32, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Dione', 6, 1123, 2.74, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Tethys', 6, 1062, 1.89, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Enceladus', 6, 504, 1.37, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Mimas', 6, 396, 0.94, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Miranda', 7, 472, 1.41, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Ariel', 7, 1158, 2.52, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Umbriel', 7, 1169, 4.14, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Titania', 7, 1578, 8.71, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Oberon', 7, 1523, 13.46, true, 'Telescope');
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Triton', 8, 2707, 5.88, true, 'Telescope');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Mercury', 1, 4879, 88.00, false, 'Smallest planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, 12104, 224.70, false, 'Hottest planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Earth', 1, 12742, 365.25, false, 'Our home planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, 6779, 687.00, false, 'The red planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, 139820, 4333.00, true, 'Largest planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, 116460, 10759.00, true, 'Planet famous for its rings');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', 1, 50724, 30687.00, true, 'Ice giant');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', 1, 49244, 60190.00, true, 'Distant ice giant');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Planet X1', 2, 15000, 400.00, false, 'Fictional example planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Planet X2', 3, 18000, 500.00, true, 'Fictional example planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Planet X3', 4, 20000, 600.00, false, 'Fictional example planet');
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Planet X4', 5, 22000, 700.00, true, 'Fictional example planet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sun', 1, 5778, 1.00, true, 'Star at the center of our solar system');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (2, 'Sirius', 1, 9940, 2.02, true, 'Bright star in the night sky');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Betelgeuse', 1, 3500, 16.50, true, 'Red supergiant star');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Vega', 1, 9602, 2.14, true, 'Bright star in Lyra');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Polaris', 1, 6015, 5.40, true, 'North Star');
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Rigel', 1, 11000, 21.00, true, 'Blue supergiant star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: mission_mission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.mission_mission_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: mission mission_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_name_key UNIQUE (name);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

