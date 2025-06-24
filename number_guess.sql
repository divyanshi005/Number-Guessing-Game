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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer DEFAULT 0,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 270);
INSERT INTO public.games VALUES (2, 1, 968);
INSERT INTO public.games VALUES (3, 2, 512);
INSERT INTO public.games VALUES (4, 2, 554);
INSERT INTO public.games VALUES (5, 1, 275);
INSERT INTO public.games VALUES (6, 1, 835);
INSERT INTO public.games VALUES (7, 1, 90);
INSERT INTO public.games VALUES (8, 3, 111);
INSERT INTO public.games VALUES (9, 3, 979);
INSERT INTO public.games VALUES (10, 4, 205);
INSERT INTO public.games VALUES (11, 4, 237);
INSERT INTO public.games VALUES (12, 3, 841);
INSERT INTO public.games VALUES (13, 3, 158);
INSERT INTO public.games VALUES (14, 3, 116);
INSERT INTO public.games VALUES (15, 5, 874);
INSERT INTO public.games VALUES (16, 5, 720);
INSERT INTO public.games VALUES (17, 6, 54);
INSERT INTO public.games VALUES (18, 6, 56);
INSERT INTO public.games VALUES (19, 5, 590);
INSERT INTO public.games VALUES (20, 5, 389);
INSERT INTO public.games VALUES (21, 5, 943);
INSERT INTO public.games VALUES (22, 7, 56);
INSERT INTO public.games VALUES (23, 7, 984);
INSERT INTO public.games VALUES (24, 8, 720);
INSERT INTO public.games VALUES (25, 8, 13);
INSERT INTO public.games VALUES (26, 7, 464);
INSERT INTO public.games VALUES (27, 7, 252);
INSERT INTO public.games VALUES (28, 7, 575);
INSERT INTO public.games VALUES (29, 9, 234);
INSERT INTO public.games VALUES (30, 9, 183);
INSERT INTO public.games VALUES (31, 10, 48);
INSERT INTO public.games VALUES (32, 10, 770);
INSERT INTO public.games VALUES (33, 9, 430);
INSERT INTO public.games VALUES (34, 9, 429);
INSERT INTO public.games VALUES (35, 9, 32);
INSERT INTO public.games VALUES (36, 195, 21);
INSERT INTO public.games VALUES (37, 195, 415);
INSERT INTO public.games VALUES (38, 196, 270);
INSERT INTO public.games VALUES (39, 196, 248);
INSERT INTO public.games VALUES (40, 195, 627);
INSERT INTO public.games VALUES (41, 195, 469);
INSERT INTO public.games VALUES (42, 195, 259);
INSERT INTO public.games VALUES (43, 197, 651);
INSERT INTO public.games VALUES (44, 197, 15);
INSERT INTO public.games VALUES (45, 198, 29);
INSERT INTO public.games VALUES (46, 198, 301);
INSERT INTO public.games VALUES (47, 197, 627);
INSERT INTO public.games VALUES (48, 197, 294);
INSERT INTO public.games VALUES (49, 197, 527);
INSERT INTO public.games VALUES (50, 199, 426);
INSERT INTO public.games VALUES (51, 199, 471);
INSERT INTO public.games VALUES (52, 200, 861);
INSERT INTO public.games VALUES (53, 200, 165);
INSERT INTO public.games VALUES (54, 199, 95);
INSERT INTO public.games VALUES (55, 199, 448);
INSERT INTO public.games VALUES (56, 199, 634);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1750748482167', 0, NULL);
INSERT INTO public.users VALUES (2, 'user_1750748482166', 0, NULL);
INSERT INTO public.users VALUES (3, 'user_1750748860113', 0, NULL);
INSERT INTO public.users VALUES (4, 'user_1750748860112', 0, NULL);
INSERT INTO public.users VALUES (5, 'user_1750749064670', 0, NULL);
INSERT INTO public.users VALUES (6, 'user_1750749064669', 0, NULL);
INSERT INTO public.users VALUES (7, 'user_1750749071038', 0, NULL);
INSERT INTO public.users VALUES (8, 'user_1750749071037', 0, NULL);
INSERT INTO public.users VALUES (9, 'user_1750749079045', 0, NULL);
INSERT INTO public.users VALUES (10, 'user_1750749079044', 0, NULL);
INSERT INTO public.users VALUES (11, 'user_1750749306128', 0, NULL);
INSERT INTO public.users VALUES (88, 'user_1750749770008', 0, NULL);
INSERT INTO public.users VALUES (13, 'user_1750749306127', 0, NULL);
INSERT INTO public.users VALUES (180, 'div', 1, 10);
INSERT INTO public.users VALUES (90, 'user_1750749770007', 0, NULL);
INSERT INTO public.users VALUES (197, 'user_1750756352023', 5, 15);
INSERT INTO public.users VALUES (18, 'user_1750749342930', 0, NULL);
INSERT INTO public.users VALUES (20, 'user_1750749342929', 0, NULL);
INSERT INTO public.users VALUES (95, 'user_1750749788268', 0, NULL);
INSERT INTO public.users VALUES (97, 'user_1750749788267', 0, NULL);
INSERT INTO public.users VALUES (25, 'user_1750749362319', 0, NULL);
INSERT INTO public.users VALUES (186, 'user_1750752258328', 2, 28);
INSERT INTO public.users VALUES (27, 'user_1750749362318', 0, NULL);
INSERT INTO public.users VALUES (185, 'user_1750752258329', 5, 26);
INSERT INTO public.users VALUES (102, 'user_1750750281856', 0, NULL);
INSERT INTO public.users VALUES (32, 'user_1750749415415', 0, NULL);
INSERT INTO public.users VALUES (34, 'user_1750749415414', 0, NULL);
INSERT INTO public.users VALUES (104, 'user_1750750281855', 0, NULL);
INSERT INTO public.users VALUES (200, 'user_1750756424322', 2, 165);
INSERT INTO public.users VALUES (39, 'user_1750749433635', 0, NULL);
INSERT INTO public.users VALUES (41, 'user_1750749433634', 0, NULL);
INSERT INTO public.users VALUES (109, 'user_1750750383398', 0, NULL);
INSERT INTO public.users VALUES (188, 'user_1750752411504', 2, 113);
INSERT INTO public.users VALUES (111, 'user_1750750383397', 0, NULL);
INSERT INTO public.users VALUES (46, 'user_1750749554223', 0, NULL);
INSERT INTO public.users VALUES (199, 'user_1750756424323', 5, 95);
INSERT INTO public.users VALUES (48, 'user_1750749554222', 0, NULL);
INSERT INTO public.users VALUES (187, 'user_1750752411505', 5, 301);
INSERT INTO public.users VALUES (116, 'user_1750750389879', 0, NULL);
INSERT INTO public.users VALUES (53, 'user_1750749570253', 0, NULL);
INSERT INTO public.users VALUES (118, 'user_1750750389878', 0, NULL);
INSERT INTO public.users VALUES (55, 'user_1750749570252', 0, NULL);
INSERT INTO public.users VALUES (190, 'user_1750752507447', 2, 159);
INSERT INTO public.users VALUES (60, 'user_1750749598854', 0, NULL);
INSERT INTO public.users VALUES (123, 'user_1750750528672', 0, NULL);
INSERT INTO public.users VALUES (62, 'user_1750749598853', 0, NULL);
INSERT INTO public.users VALUES (125, 'user_1750750528671', 0, NULL);
INSERT INTO public.users VALUES (189, 'user_1750752507448', 5, 3);
INSERT INTO public.users VALUES (67, 'user_1750749648875', 0, NULL);
INSERT INTO public.users VALUES (69, 'user_1750749648874', 0, NULL);
INSERT INTO public.users VALUES (130, 'user_1750750985454', 0, NULL);
INSERT INTO public.users VALUES (132, 'user_1750750985453', 0, NULL);
INSERT INTO public.users VALUES (74, 'user_1750749759128', 0, NULL);
INSERT INTO public.users VALUES (76, 'user_1750749759127', 0, NULL);
INSERT INTO public.users VALUES (192, 'user_1750752514929', 2, 321);
INSERT INTO public.users VALUES (137, 'user_1750751229040', 0, NULL);
INSERT INTO public.users VALUES (81, 'user_1750749765373', 0, NULL);
INSERT INTO public.users VALUES (83, 'user_1750749765372', 0, NULL);
INSERT INTO public.users VALUES (139, 'user_1750751229039', 0, NULL);
INSERT INTO public.users VALUES (191, 'user_1750752514930', 5, 54);
INSERT INTO public.users VALUES (144, 'user_1750751260917', 0, NULL);
INSERT INTO public.users VALUES (146, 'user_1750751260916', 0, NULL);
INSERT INTO public.users VALUES (194, 'user_1750752566241', 2, 260);
INSERT INTO public.users VALUES (151, 'user_1750751341904', 0, NULL);
INSERT INTO public.users VALUES (193, 'user_1750752566242', 5, 20);
INSERT INTO public.users VALUES (153, 'user_1750751341903', 0, NULL);
INSERT INTO public.users VALUES (158, 'user_1750751367380', 0, NULL);
INSERT INTO public.users VALUES (160, 'user_1750751367379', 0, NULL);
INSERT INTO public.users VALUES (196, 'user_1750756325053', 2, 248);
INSERT INTO public.users VALUES (195, 'user_1750756325054', 5, 21);
INSERT INTO public.users VALUES (165, 'user_1750751417199', 0, NULL);
INSERT INTO public.users VALUES (167, 'user_1750751417198', 0, NULL);
INSERT INTO public.users VALUES (172, 'user_1750751496193', 0, NULL);
INSERT INTO public.users VALUES (173, 'user_1750751496192', 0, NULL);
INSERT INTO public.users VALUES (174, 'user_1750751587951', 0, NULL);
INSERT INTO public.users VALUES (175, 'user_1750751587950', 0, NULL);
INSERT INTO public.users VALUES (176, 'user_1750751598929', 0, NULL);
INSERT INTO public.users VALUES (177, 'user_1750751598928', 0, NULL);
INSERT INTO public.users VALUES (178, 'user_1750751603799', 0, NULL);
INSERT INTO public.users VALUES (179, 'user_1750751603798', 0, NULL);
INSERT INTO public.users VALUES (198, 'user_1750756352022', 2, 29);
INSERT INTO public.users VALUES (183, 'user_1750752169155', 5, 193);
INSERT INTO public.users VALUES (182, 'user_1750752163850', 2, 750);
INSERT INTO public.users VALUES (181, 'user_1750752163851', 5, 114);
INSERT INTO public.users VALUES (184, 'user_1750752169154', 2, 122);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 56, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 200, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

