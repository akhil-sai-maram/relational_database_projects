--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer,
    length_in_km numeric
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60),
    interesting_fact text,
    age_in_millions_of_years integer,
    galaxy_types character varying(40),
    is_visible boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    distance_from_planet_in_million_km numeric,
    radius_in_km integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60),
    planet_types text,
    has_life boolean NOT NULL,
    is_spherical boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60),
    age_in_millions_of_years integer,
    star_types text,
    galaxy_id integer NOT NULL,
    diameter_in_million_km numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halleys Comet', 3, 16);
INSERT INTO public.comet VALUES (2, 'Shoemakey Levy-9', 5, NULL);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 3, NULL);
INSERT INTO public.comet VALUES (4, 'Hale Bopp', 3, 40);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Has a supermassive black hole at the centre.', 10010, 'spiral', true);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf', 'Closest galaxy to Milky Way.', 220, 'irregular', false);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A', 'Discovered in 1946.', 3, 'elliptical', true);
INSERT INTO public.galaxy VALUES (4, 'Maffei 1', 'Mainly made of old metal-rich stars.', 100000, 'elliptical', true);
INSERT INTO public.galaxy VALUES (5, 'Maffei 2', 'Dust clouds in the Milky Way block 99.5% of visible light.', NULL, 'spiral', false);
INSERT INTO public.galaxy VALUES (6, 'Magellanic Clouds', 'They share a gaseous envelope.', 1101, 'irregular', true);
INSERT INTO public.galaxy VALUES (7, 'Milky Way', 'Almost as old as the universe.', 13610, 'spiral', true);
INSERT INTO public.galaxy VALUES (8, 'Virgo A', 'Has a blue jet near the center.', 13240, 'spiral', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384.4, 3, 1737);
INSERT INTO public.moon VALUES (2, 'Deimos', 23.458, 4, 6);
INSERT INTO public.moon VALUES (3, 'Phobos', 6, 4, 11);
INSERT INTO public.moon VALUES (4, 'Amalthea', 1814, 5, 85);
INSERT INTO public.moon VALUES (5, 'Callisto', 1883, 5, 2400);
INSERT INTO public.moon VALUES (6, 'Europa', 670.9, 5, 1570);
INSERT INTO public.moon VALUES (7, 'Ganymede', 1070, 5, 2630);
INSERT INTO public.moon VALUES (8, 'Hyperion', 1481, 6, 128);
INSERT INTO public.moon VALUES (9, 'Lapetus', 3561.3, 6, 730);
INSERT INTO public.moon VALUES (10, 'Mimas', 185.52, 6, 195);
INSERT INTO public.moon VALUES (11, 'Titan', 1221.85, 6, 2575);
INSERT INTO public.moon VALUES (12, 'Ariel', 190.9, 7, 579);
INSERT INTO public.moon VALUES (13, 'Miranda', 129.9, 7, 236);
INSERT INTO public.moon VALUES (14, 'Oberon', 583.5, 7, 762);
INSERT INTO public.moon VALUES (15, 'Nereid', 5513.4, 8, 170);
INSERT INTO public.moon VALUES (16, 'Enceladus', 238.02, 6, 250);
INSERT INTO public.moon VALUES (17, 'Charon', 19.64, 9, 606);
INSERT INTO public.moon VALUES (18, 'Triton', 354.8, 8, 1350);
INSERT INTO public.moon VALUES (19, 'Tethys', 294.66, 6, 530);
INSERT INTO public.moon VALUES (20, 'Dione', 377.4, 6, 560);
INSERT INTO public.moon VALUES (21, 'Rhea', 527.04, 6, 785);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'terrestrial', false, true, 8);
INSERT INTO public.planet VALUES (2, 'Venus', 'terrestrial', true, true, 8);
INSERT INTO public.planet VALUES (3, 'Earth', 'terrestrial', true, false, 8);
INSERT INTO public.planet VALUES (4, 'Mars', 'terrestrial', false, true, 8);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'gas giant', false, false, 8);
INSERT INTO public.planet VALUES (6, 'Saturn', 'gas giant', false, false, 8);
INSERT INTO public.planet VALUES (7, 'Uranus', 'ice giant', false, false, 8);
INSERT INTO public.planet VALUES (8, 'Neptune', 'ice giant', false, false, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', 'dwarf', false, true, 8);
INSERT INTO public.planet VALUES (10, 'Planet Nine', 'super-earth', false, true, 8);
INSERT INTO public.planet VALUES (11, 'HD 131399Ab', 'exoplanet', false, true, 7);
INSERT INTO public.planet VALUES (12, 'Polaris Aa', 'supergiant', false, true, 1);
INSERT INTO public.planet VALUES (13, '61 Virginis B', 'neptune-like exoplanet', true, true, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Polaris', 70, 'F', 7, 70);
INSERT INTO public.star VALUES (2, 'Sirius', 230, 'A', 7, 2.4);
INSERT INTO public.star VALUES (3, 'Alpheratz', 60, 'B', 1, 1.878);
INSERT INTO public.star VALUES (4, 'Alberio', 100, 'B', 3, 3.743);
INSERT INTO public.star VALUES (5, 'Epsilon virginis', 560, NULL, 8, 14.749);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 10, 'F', 7, 1234.2);
INSERT INTO public.star VALUES (7, 'Antares', 15, 'F', 7, 946.15);
INSERT INTO public.star VALUES (8, 'Sun', 4603, NULL, 7, 1.3927);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: comet comet_comet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_comet_id_key UNIQUE (comet_id);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (interesting_fact);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


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

