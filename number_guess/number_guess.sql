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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: game_info; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.game_info (
    username character varying(30) NOT NULL,
    games_played integer,
    best_game_guesses integer
);


ALTER TABLE public.game_info OWNER TO freecodecamp;

--
-- Data for Name: game_info; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.game_info VALUES ('test', 1, 5);
INSERT INTO public.game_info VALUES ('user_1658305380635', 1, 109);
INSERT INTO public.game_info VALUES ('user_1658305380636', 1, 241);
INSERT INTO public.game_info VALUES ('user_1658305383568', 1, 761);
INSERT INTO public.game_info VALUES ('user_1658305383569', 1, 144);
INSERT INTO public.game_info VALUES ('user_1658305389192', 1, 985);
INSERT INTO public.game_info VALUES ('user_1658305389193', 1, 866);
INSERT INTO public.game_info VALUES ('user_1658305393629', 1, 94);
INSERT INTO public.game_info VALUES ('user_1658305393630', 1, 43);
INSERT INTO public.game_info VALUES ('user_1658305450370', 1, 518);
INSERT INTO public.game_info VALUES ('user_1658305450371', 1, 290);
INSERT INTO public.game_info VALUES ('user_1658305453538', 1, 485);
INSERT INTO public.game_info VALUES ('user_1658305453539', 1, 985);


--
-- Name: game_info game_info_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.game_info
    ADD CONSTRAINT game_info_username_key UNIQUE (username);


--
-- PostgreSQL database dump complete
--

