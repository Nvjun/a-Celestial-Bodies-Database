--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    description text,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer
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
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean,
    has_life boolean
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    plant_types character varying(30),
    age_in_millions_of_years numeric,
    distance_from_earth integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    galaxy_id integer,
    description text,
    is_spherical boolean,
    has_life boolean,
    age_in_millions_of_years numeric,
    distance_from_earth integer
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
-- Name: universe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universe (
    universe_id integer NOT NULL,
    moon_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.universe OWNER TO freecodecamp;

--
-- Name: universe_universe_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universe_universe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universe_universe_seq OWNER TO freecodecamp;

--
-- Name: universe_universe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universe_universe_seq OWNED BY public.universe.universe_id;


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
-- Name: universe universe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe ALTER COLUMN universe_id SET DEFAULT nextval('public.universe_universe_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', 1, 'Our home galaxy with billions of stars, including our Sun.', false, true, 1360, 100000);
INSERT INTO public.galaxy VALUES ('Andromeda', 2, 'Spiral galaxy similar to the Milky Way.', false, false, 1010, 25370000);
INSERT INTO public.galaxy VALUES ('Triangulum', 3, 'Small spiral galaxy near Andromeda.', false, false, 570, 3000000);
INSERT INTO public.galaxy VALUES ('Whirlpool', 4, ' Interacting spiral galaxy with a companion galaxy.', false, false, 400, 23000000);
INSERT INTO public.galaxy VALUES ('Sombrero', 5, 'Spiral galaxy with a prominent dust lane resembling a hat', false, false, 1000, 28000000);
INSERT INTO public.galaxy VALUES ('Black Eye', 6, 'Spiral galaxy known for its dark band of dust across its center; potential for life', false, false, 5000, 24000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('aa', 1, 1, 'aa', true, false);
INSERT INTO public.moon VALUES ('AB', 2, 1, 'AB', true, false);
INSERT INTO public.moon VALUES ('AC', 3, 1, 'AC', true, false);
INSERT INTO public.moon VALUES ('AD', 4, 1, 'AD', true, false);
INSERT INTO public.moon VALUES ('BA', 5, 2, 'BA', true, false);
INSERT INTO public.moon VALUES ('BB', 6, 2, 'BB', true, false);
INSERT INTO public.moon VALUES ('BC', 7, 2, 'BC', true, false);
INSERT INTO public.moon VALUES ('BD', 8, 2, 'BD', true, false);
INSERT INTO public.moon VALUES ('CA', 9, 3, 'CA', true, false);
INSERT INTO public.moon VALUES ('CB', 10, 3, 'CB', true, false);
INSERT INTO public.moon VALUES ('CC', 11, 3, 'CC', true, false);
INSERT INTO public.moon VALUES ('CD', 12, 4, 'CD', true, false);
INSERT INTO public.moon VALUES ('DA', 13, 4, 'DA', true, false);
INSERT INTO public.moon VALUES ('DB', 14, 4, 'DB', true, false);
INSERT INTO public.moon VALUES ('DC', 15, 4, 'DC', true, false);
INSERT INTO public.moon VALUES ('DD', 16, 5, 'DD', true, false);
INSERT INTO public.moon VALUES ('EA', 17, 5, 'EA', true, false);
INSERT INTO public.moon VALUES ('EB', 18, 5, 'EB', true, false);
INSERT INTO public.moon VALUES ('EC', 19, 5, 'EC', true, false);
INSERT INTO public.moon VALUES ('FA', 20, 6, 'FA', true, false);
INSERT INTO public.moon VALUES ('FB', 21, 6, 'FB', true, false);
INSERT INTO public.moon VALUES ('FC', 22, 6, 'FC', true, false);
INSERT INTO public.moon VALUES ('FD', 23, 6, 'FD', true, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('a1', 1, 1, 'a1', true, false, 'A', 12, 12);
INSERT INTO public.planet VALUES ('a2', 2, 1, 'a2', true, false, 'A', 12, 12);
INSERT INTO public.planet VALUES ('b1', 3, 2, 'b1', true, false, 'B', 12, 12);
INSERT INTO public.planet VALUES ('b2', 4, 2, 'b2', true, false, 'B', 12, 12);
INSERT INTO public.planet VALUES ('C1', 5, 3, 'C1', true, false, 'C', 12, 12);
INSERT INTO public.planet VALUES ('C2', 6, 3, 'C2', true, false, 'C', 12, 12);
INSERT INTO public.planet VALUES ('D1', 7, 4, 'D2', true, false, 'D', 12, 12);
INSERT INTO public.planet VALUES ('D2', 8, 4, 'D2', true, false, 'D', 12, 12);
INSERT INTO public.planet VALUES ('E1', 9, 5, 'E1', true, false, 'E', 12, 12);
INSERT INTO public.planet VALUES ('E2', 10, 5, 'E2', true, false, 'E', 12, 12);
INSERT INTO public.planet VALUES ('F1', 11, 6, 'F1', true, false, 'F', 12, 12);
INSERT INTO public.planet VALUES ('F2', 12, 6, 'F2', true, false, 'F', 12, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 1, 'Our star, providing light and heat to Earth.', true, false, 460, 93);
INSERT INTO public.star VALUES ('Almach', 2, 2, 'Binary star system with a golden and blue component', true, false, 45, 350);
INSERT INTO public.star VALUES ('Beta Trianguli', 3, 3, 'Binary star system with a yellow dwarf and red dwarf', true, false, 100, 127);
INSERT INTO public.star VALUES ('Messier 51a', 4, 4, 'Massive blue supergiant star.', true, false, 34, 122);
INSERT INTO public.star VALUES ('Delta Canum Venaticorum', 5, 5, 'Binary star system with a yellow-white primary and a fainter companion', true, false, 300, 900);
INSERT INTO public.star VALUES ('Hubble V733', 6, 6, 'Blue supergiant star with a luminosity thousands of times greater than the Sun.', true, false, 23, 1000);


--
-- Data for Name: universe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universe VALUES (1, 1, 1, '1');
INSERT INTO public.universe VALUES (2, 2, 1, '1');
INSERT INTO public.universe VALUES (3, 1, 2, '2');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universe_universe_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universe_universe_seq', 3, true);


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
-- Name: universe universe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_pkey PRIMARY KEY (universe_id);


--
-- Name: universe universe_universe_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universe
    ADD CONSTRAINT universe_universe_id_key UNIQUE (universe_id);


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

