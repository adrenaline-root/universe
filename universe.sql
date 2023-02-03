--
-- PostgreSQL database dump
--

-- Dumped from database version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.13 (Ubuntu 12.13-0ubuntu0.20.04.1)

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
    type character varying(40),
    galactic_center_in_mll_ly numeric(5,3),
    diameter_in_ly integer
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
    distance_to_planet_in_km integer,
    orbit_time_in_days numeric(4,1),
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
    name character varying(60) NOT NULL,
    diameter_in_km integer,
    distance_to_star_au numeric(4,2),
    rings boolean,
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
-- Name: planetary_system; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planetary_system (
    planetary_system_id integer NOT NULL,
    description text,
    has_candidates boolean,
    star_id integer,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planetary_system OWNER TO postgres;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planetary_system_planetary_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planetary_system_planetary_system_id_seq OWNER TO postgres;

--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planetary_system_planetary_system_id_seq OWNED BY public.planetary_system.planetary_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    constellation character varying(40),
    temperatura_in_k integer,
    age_in_gyr numeric(4,2),
    type character varying(40)
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
-- Name: planetary_system planetary_system_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planetary_system ALTER COLUMN planetary_system_id SET DEFAULT nextval('public.planetary_system_planetary_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (6, 'Andromeda II', 'dE0', 2.220, 6820);
INSERT INTO public.galaxy VALUES (5, 'Sculptor Dwarf', 'dE3', 0.287, NULL);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'SB(s)m', 0.163, 32200);
INSERT INTO public.galaxy VALUES (3, 'Reticulum II', '', 0.102, 378);
INSERT INTO public.galaxy VALUES (2, 'Triangulum II', '', 0.098, NULL);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'SBbc', 0.026, 87400);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 27.3, 3);
INSERT INTO public.moon VALUES (2, 'Deimos', 23460, 1.2, 4);
INSERT INTO public.moon VALUES (3, 'Phobos', 9270, 0.3, 4);
INSERT INTO public.moon VALUES (4, 'Adrastea', 128980, 0.3, 5);
INSERT INTO public.moon VALUES (5, 'Callisto', 24122000, 753.0, 5);
INSERT INTO public.moon VALUES (6, 'Elara', 11737000, 259.6, 5);
INSERT INTO public.moon VALUES (7, 'Europa', 670900, 3.5, 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', 1070000, 7.1, 5);
INSERT INTO public.moon VALUES (9, 'Helike', 10972830, 233.8, 5);
INSERT INTO public.moon VALUES (10, 'Kallichore', 22395390, 683.0, 5);
INSERT INTO public.moon VALUES (11, 'Sinope', 23700700, 758.0, 5);
INSERT INTO public.moon VALUES (12, 'Atlas', 137640, 0.6, 6);
INSERT INTO public.moon VALUES (13, 'Calypso', 294660, 1.8, 6);
INSERT INTO public.moon VALUES (14, 'Enceladus', 238020, 1.3, 6);
INSERT INTO public.moon VALUES (15, 'Hyperion', 1481000, 21.2, 6);
INSERT INTO public.moon VALUES (16, 'Narvi', 18719000, 956.2, 6);
INSERT INTO public.moon VALUES (17, 'Ariel', 191240, 2.5, 7);
INSERT INTO public.moon VALUES (18, 'Caliban', 7200000, 579.5, 7);
INSERT INTO public.moon VALUES (19, 'Desdemona', 62660, 0.4, 7);
INSERT INTO public.moon VALUES (20, 'Oberon', 582600, 13.4, 7);
INSERT INTO public.moon VALUES (21, 'Umbriel', 265970, 4.1, 7);
INSERT INTO public.moon VALUES (23, 'Galatea', 52500, 0.3, 8);
INSERT INTO public.moon VALUES (24, 'Nereid', 5513400, 360.1, 8);
INSERT INTO public.moon VALUES (25, 'Proteus', 117600, 1.1, 8);
INSERT INTO public.moon VALUES (26, 'Nix', 48675, 24.8, 9);
INSERT INTO public.moon VALUES (27, 'Hydra', 64780, 38.2, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (11, '61 Virginis b', NULL, 0.05, NULL, 5);
INSERT INTO public.planet VALUES (12, '61 Virginis c', NULL, 0.21, NULL, 5);
INSERT INTO public.planet VALUES (13, '61 Virginis d', NULL, 0.47, NULL, 5);
INSERT INTO public.planet VALUES (1, 'Mercury', 4878, 0.39, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 12104, 0.72, false, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 6787, 1.52, false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 12756, 1.00, false, 1);
INSERT INTO public.planet VALUES (9, 'Pluto', 2300, 39.44, false, 1);
INSERT INTO public.planet VALUES (10, 'Ceres', 974, 2.76, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 142800, 5.20, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 120000, 9.54, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 51118, 19.18, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 49528, 30.06, true, 1);


--
-- Data for Name: planetary_system; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planetary_system VALUES (1, 'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core. The Sun radiates this energy mainly light, ultraviolet, and infrared radiation, and is the most important source of energy for life on Earth.', true, 1, 'Sun');
INSERT INTO public.planetary_system VALUES (2, '61 Virginis (abbreviated 61 Vir) is the Flamsteed designation of a G-type main-sequence star (G7V) slightly less massive than the Sun (which has a hotter G2V spectral type), located about 27.9 light-years away in the constellation of Virgo. The composition of this star is nearly identical to the Sun.', false, 5, '61 Virginis');
INSERT INTO public.planetary_system VALUES (3, 'Gliese 1061 is a red dwarf star located approximately 12 light-years (3.7 parsecs) from Earth in the southern constellation of Horologium. Even though it is a relatively nearby star, it has an apparent visual magnitude of about 13,[2] so it can only be seen with at least a moderately-sized telescope.', true, 2, 'Gliese 1061');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 5778, 4.57, 'G2V');
INSERT INTO public.star VALUES (2, 'Gliese 1061', 'Horologium', 2953, NULL, 'M5.5V');
INSERT INTO public.star VALUES (3, 'Wolf 1061', 'Ophiuchus', 3342, 4.89, 'M3.5V');
INSERT INTO public.star VALUES (5, '61 Virginis', 'Virgo', 5531, 8.96, 'G5V');
INSERT INTO public.star VALUES (6, '55 Cancri', 'Cancer', 5217, 7.40, 'K0IV-V');
INSERT INTO public.star VALUES (7, 'Mu Arae', 'Ara', 5704, 6.41, 'G3IV-V');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 27, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: planetary_system_planetary_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planetary_system_planetary_system_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: planetary_system planetary_system_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_name_key UNIQUE (name);


--
-- Name: planetary_system planetary_system_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_pkey PRIMARY KEY (planetary_system_id);


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
-- Name: planetary_system planetary_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planetary_system
    ADD CONSTRAINT planetary_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

