--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4 (Debian 13.4-1.pgdg100+1)
-- Dumped by pg_dump version 13.4 (Debian 13.4-1.pgdg100+1)

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

ALTER TABLE ONLY public."Teams" DROP CONSTRAINT "FK_Teams_Persons_OwnerID";
ALTER TABLE ONLY public."Teams" DROP CONSTRAINT "FK_Teams_Events_EventID";
ALTER TABLE ONLY public."Registrations" DROP CONSTRAINT "FK_Registrations_Teams_TeamID";
ALTER TABLE ONLY public."Registrations" DROP CONSTRAINT "FK_Registrations_Persons_OwnerID";
ALTER TABLE ONLY public."PersonRegistrations" DROP CONSTRAINT "FK_PersonRegistrations_Registrations_RegistrationID";
ALTER TABLE ONLY public."PersonRegistrations" DROP CONSTRAINT "FK_PersonRegistrations_Persons_PersonID";
DROP INDEX public."IX_Teams_OwnerID";
DROP INDEX public."IX_Teams_EventID";
DROP INDEX public."IX_Registrations_TeamID";
DROP INDEX public."IX_Registrations_OwnerID";
DROP INDEX public."IX_PersonRegistrations_RegistrationID";
DROP INDEX public."IX_PersonRegistrations_PersonID";
ALTER TABLE ONLY public."__EFMigrationsHistory" DROP CONSTRAINT "PK___EFMigrationsHistory";
ALTER TABLE ONLY public."Teams" DROP CONSTRAINT "PK_Teams";
ALTER TABLE ONLY public."Registrations" DROP CONSTRAINT "PK_Registrations";
ALTER TABLE ONLY public."Persons" DROP CONSTRAINT "PK_Persons";
ALTER TABLE ONLY public."PersonRegistrations" DROP CONSTRAINT "PK_PersonRegistrations";
ALTER TABLE ONLY public."PageData" DROP CONSTRAINT "PK_PageData";
ALTER TABLE ONLY public."Events" DROP CONSTRAINT "PK_Events";
DROP TABLE public."__EFMigrationsHistory";
DROP TABLE public."Teams";
DROP TABLE public."Registrations";
DROP TABLE public."Persons";
DROP TABLE public."PersonRegistrations";
DROP TABLE public."PageData";
DROP TABLE public."Events";
SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Events; Type: TABLE; Schema: public; Owner: aspen
--

CREATE TABLE public."Events" (
    "ID" bigint NOT NULL,
    "Date" timestamp without time zone NOT NULL,
    "Location" text,
    "Description" text,
    "PrimaryImageUrl" text
);


ALTER TABLE public."Events" OWNER TO aspen;

--
-- Name: Events_ID_seq; Type: SEQUENCE; Schema: public; Owner: aspen
--

ALTER TABLE public."Events" ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Events_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: PageData; Type: TABLE; Schema: public; Owner: aspen
--

CREATE TABLE public."PageData" (
    "ID" bigint NOT NULL,
    "Key" text,
    "Data" jsonb
);


ALTER TABLE public."PageData" OWNER TO aspen;

--
-- Name: PageData_ID_seq; Type: SEQUENCE; Schema: public; Owner: aspen
--

ALTER TABLE public."PageData" ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."PageData_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: PersonRegistrations; Type: TABLE; Schema: public; Owner: aspen
--

CREATE TABLE public."PersonRegistrations" (
    "ID" bigint NOT NULL,
    "PersonID" bigint NOT NULL,
    "RegistrationID" bigint NOT NULL,
    "CreatedDate" timestamp without time zone NOT NULL
);


ALTER TABLE public."PersonRegistrations" OWNER TO aspen;

--
-- Name: PersonRegistrations_ID_seq; Type: SEQUENCE; Schema: public; Owner: aspen
--

ALTER TABLE public."PersonRegistrations" ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."PersonRegistrations_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Persons; Type: TABLE; Schema: public; Owner: aspen
--

CREATE TABLE public."Persons" (
    "ID" bigint NOT NULL,
    "AuthID" text,
    "Name" text,
    "Bio" text
);


ALTER TABLE public."Persons" OWNER TO aspen;

--
-- Name: Persons_ID_seq; Type: SEQUENCE; Schema: public; Owner: aspen
--

ALTER TABLE public."Persons" ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Persons_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Registrations; Type: TABLE; Schema: public; Owner: aspen
--

CREATE TABLE public."Registrations" (
    "ID" bigint NOT NULL,
    "CreationDate" timestamp without time zone NOT NULL,
    "IsPublic" boolean NOT NULL,
    "Nickname" text,
    "OwnerID" bigint NOT NULL,
    "TeamID" bigint NOT NULL
);


ALTER TABLE public."Registrations" OWNER TO aspen;

--
-- Name: Registrations_ID_seq; Type: SEQUENCE; Schema: public; Owner: aspen
--

ALTER TABLE public."Registrations" ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Registrations_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: Teams; Type: TABLE; Schema: public; Owner: aspen
--

CREATE TABLE public."Teams" (
    "ID" bigint NOT NULL,
    "Description" text,
    "MainImage" text,
    "OwnerID" bigint NOT NULL,
    "EventID" bigint NOT NULL
);


ALTER TABLE public."Teams" OWNER TO aspen;

--
-- Name: Teams_ID_seq; Type: SEQUENCE; Schema: public; Owner: aspen
--

ALTER TABLE public."Teams" ALTER COLUMN "ID" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."Teams_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: __EFMigrationsHistory; Type: TABLE; Schema: public; Owner: aspen
--

CREATE TABLE public."__EFMigrationsHistory" (
    "MigrationId" character varying(150) NOT NULL,
    "ProductVersion" character varying(32) NOT NULL
);


ALTER TABLE public."__EFMigrationsHistory" OWNER TO aspen;

--
-- Data for Name: Events; Type: TABLE DATA; Schema: public; Owner: aspen
--

COPY public."Events" ("ID", "Date", "Location", "Description", "PrimaryImageUrl") FROM stdin;
\.


--
-- Data for Name: PageData; Type: TABLE DATA; Schema: public; Owner: aspen
--

COPY public."PageData" ("ID", "Key", "Data") FROM stdin;
1	newPageDataKey1	{}
\.


--
-- Data for Name: PersonRegistrations; Type: TABLE DATA; Schema: public; Owner: aspen
--

COPY public."PersonRegistrations" ("ID", "PersonID", "RegistrationID", "CreatedDate") FROM stdin;
\.


--
-- Data for Name: Persons; Type: TABLE DATA; Schema: public; Owner: aspen
--

COPY public."Persons" ("ID", "AuthID", "Name", "Bio") FROM stdin;
\.


--
-- Data for Name: Registrations; Type: TABLE DATA; Schema: public; Owner: aspen
--

COPY public."Registrations" ("ID", "CreationDate", "IsPublic", "Nickname", "OwnerID", "TeamID") FROM stdin;
\.


--
-- Data for Name: Teams; Type: TABLE DATA; Schema: public; Owner: aspen
--

COPY public."Teams" ("ID", "Description", "MainImage", "OwnerID", "EventID") FROM stdin;
\.


--
-- Data for Name: __EFMigrationsHistory; Type: TABLE DATA; Schema: public; Owner: aspen
--

COPY public."__EFMigrationsHistory" ("MigrationId", "ProductVersion") FROM stdin;
20211021045038_recordDbModels	5.0.11
\.


--
-- Name: Events_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: aspen
--

SELECT pg_catalog.setval('public."Events_ID_seq"', 1, false);


--
-- Name: PageData_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: aspen
--

SELECT pg_catalog.setval('public."PageData_ID_seq"', 1, true);


--
-- Name: PersonRegistrations_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: aspen
--

SELECT pg_catalog.setval('public."PersonRegistrations_ID_seq"', 1, false);


--
-- Name: Persons_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: aspen
--

SELECT pg_catalog.setval('public."Persons_ID_seq"', 1, false);


--
-- Name: Registrations_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: aspen
--

SELECT pg_catalog.setval('public."Registrations_ID_seq"', 1, false);


--
-- Name: Teams_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: aspen
--

SELECT pg_catalog.setval('public."Teams_ID_seq"', 1, false);


--
-- Name: Events PK_Events; Type: CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Events"
    ADD CONSTRAINT "PK_Events" PRIMARY KEY ("ID");


--
-- Name: PageData PK_PageData; Type: CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."PageData"
    ADD CONSTRAINT "PK_PageData" PRIMARY KEY ("ID");


--
-- Name: PersonRegistrations PK_PersonRegistrations; Type: CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."PersonRegistrations"
    ADD CONSTRAINT "PK_PersonRegistrations" PRIMARY KEY ("ID");


--
-- Name: Persons PK_Persons; Type: CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Persons"
    ADD CONSTRAINT "PK_Persons" PRIMARY KEY ("ID");


--
-- Name: Registrations PK_Registrations; Type: CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Registrations"
    ADD CONSTRAINT "PK_Registrations" PRIMARY KEY ("ID");


--
-- Name: Teams PK_Teams; Type: CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Teams"
    ADD CONSTRAINT "PK_Teams" PRIMARY KEY ("ID");


--
-- Name: __EFMigrationsHistory PK___EFMigrationsHistory; Type: CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."__EFMigrationsHistory"
    ADD CONSTRAINT "PK___EFMigrationsHistory" PRIMARY KEY ("MigrationId");


--
-- Name: IX_PersonRegistrations_PersonID; Type: INDEX; Schema: public; Owner: aspen
--

CREATE INDEX "IX_PersonRegistrations_PersonID" ON public."PersonRegistrations" USING btree ("PersonID");


--
-- Name: IX_PersonRegistrations_RegistrationID; Type: INDEX; Schema: public; Owner: aspen
--

CREATE INDEX "IX_PersonRegistrations_RegistrationID" ON public."PersonRegistrations" USING btree ("RegistrationID");


--
-- Name: IX_Registrations_OwnerID; Type: INDEX; Schema: public; Owner: aspen
--

CREATE INDEX "IX_Registrations_OwnerID" ON public."Registrations" USING btree ("OwnerID");


--
-- Name: IX_Registrations_TeamID; Type: INDEX; Schema: public; Owner: aspen
--

CREATE INDEX "IX_Registrations_TeamID" ON public."Registrations" USING btree ("TeamID");


--
-- Name: IX_Teams_EventID; Type: INDEX; Schema: public; Owner: aspen
--

CREATE INDEX "IX_Teams_EventID" ON public."Teams" USING btree ("EventID");


--
-- Name: IX_Teams_OwnerID; Type: INDEX; Schema: public; Owner: aspen
--

CREATE INDEX "IX_Teams_OwnerID" ON public."Teams" USING btree ("OwnerID");


--
-- Name: PersonRegistrations FK_PersonRegistrations_Persons_PersonID; Type: FK CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."PersonRegistrations"
    ADD CONSTRAINT "FK_PersonRegistrations_Persons_PersonID" FOREIGN KEY ("PersonID") REFERENCES public."Persons"("ID") ON DELETE CASCADE;


--
-- Name: PersonRegistrations FK_PersonRegistrations_Registrations_RegistrationID; Type: FK CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."PersonRegistrations"
    ADD CONSTRAINT "FK_PersonRegistrations_Registrations_RegistrationID" FOREIGN KEY ("RegistrationID") REFERENCES public."Registrations"("ID") ON DELETE CASCADE;


--
-- Name: Registrations FK_Registrations_Persons_OwnerID; Type: FK CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Registrations"
    ADD CONSTRAINT "FK_Registrations_Persons_OwnerID" FOREIGN KEY ("OwnerID") REFERENCES public."Persons"("ID") ON DELETE CASCADE;


--
-- Name: Registrations FK_Registrations_Teams_TeamID; Type: FK CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Registrations"
    ADD CONSTRAINT "FK_Registrations_Teams_TeamID" FOREIGN KEY ("TeamID") REFERENCES public."Teams"("ID") ON DELETE CASCADE;


--
-- Name: Teams FK_Teams_Events_EventID; Type: FK CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Teams"
    ADD CONSTRAINT "FK_Teams_Events_EventID" FOREIGN KEY ("EventID") REFERENCES public."Events"("ID") ON DELETE CASCADE;


--
-- Name: Teams FK_Teams_Persons_OwnerID; Type: FK CONSTRAINT; Schema: public; Owner: aspen
--

ALTER TABLE ONLY public."Teams"
    ADD CONSTRAINT "FK_Teams_Persons_OwnerID" FOREIGN KEY ("OwnerID") REFERENCES public."Persons"("ID") ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

