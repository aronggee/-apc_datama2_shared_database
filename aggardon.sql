--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 11.2

-- Started on 2019-12-16 09:09:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 35 (class 2615 OID 25290)
-- Name: aggardon; Type: SCHEMA; Schema: -; Owner: datama2mi181
--

CREATE SCHEMA aggardon;


ALTER SCHEMA aggardon OWNER TO datama2mi181;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 455 (class 1259 OID 29023)
-- Name: company; Type: TABLE; Schema: aggardon; Owner: datama2mi181
--

CREATE TABLE aggardon.company (
    id integer NOT NULL,
    comp_name character varying(20) NOT NULL,
    comp_found_date date NOT NULL
);


ALTER TABLE aggardon.company OWNER TO datama2mi181;

--
-- TOC entry 454 (class 1259 OID 29020)
-- Name: employees; Type: TABLE; Schema: aggardon; Owner: datama2mi181
--

CREATE TABLE aggardon.employees (
    id integer NOT NULL,
    emp_fname character varying(20) NOT NULL,
    emp_lname character varying(20) NOT NULL,
    emp_initial character varying(3),
    emp_email_add character varying(50),
    emp_phone_num integer,
    emp_type character varying(3) NOT NULL,
    comp_id integer
);


ALTER TABLE aggardon.employees OWNER TO datama2mi181;

--
-- TOC entry 463 (class 1259 OID 29299)
-- Name: employeesview; Type: VIEW; Schema: aggardon; Owner: datama2mi181
--

CREATE VIEW aggardon.employeesview AS
 SELECT employees.comp_id,
    employees.emp_fname
   FROM (aggardon.employees
     JOIN aggardon.company ON ((employees.id = company.id)));


ALTER TABLE aggardon.employeesview OWNER TO datama2mi181;

--
-- TOC entry 464 (class 1259 OID 29303)
-- Name: employeesviews; Type: VIEW; Schema: aggardon; Owner: datama2mi181
--

CREATE VIEW aggardon.employeesviews AS
 SELECT employees.comp_id,
    employees.emp_fname
   FROM (aggardon.employees
     JOIN aggardon.company ON ((employees.id = company.id)));


ALTER TABLE aggardon.employeesviews OWNER TO datama2mi181;

--
-- TOC entry 465 (class 1259 OID 29307)
-- Name: employeeview; Type: VIEW; Schema: aggardon; Owner: datama2mi181
--

CREATE VIEW aggardon.employeeview AS
 SELECT employees.comp_id,
    employees.emp_fname
   FROM (aggardon.employees
     JOIN aggardon.company ON ((employees.comp_id = company.id)));


ALTER TABLE aggardon.employeeview OWNER TO datama2mi181;

--
-- TOC entry 3609 (class 0 OID 29023)
-- Dependencies: 455
-- Data for Name: company; Type: TABLE DATA; Schema: aggardon; Owner: datama2mi181
--

COPY aggardon.company (id, comp_name, comp_found_date) FROM stdin;
1	Asia Pacific	1991-02-13
2	BCDA	1998-10-24
3	Manila Town	1965-01-05
4	Ace Software	1976-08-29
\.


--
-- TOC entry 3608 (class 0 OID 29020)
-- Dependencies: 454
-- Data for Name: employees; Type: TABLE DATA; Schema: aggardon; Owner: datama2mi181
--

COPY aggardon.employees (id, emp_fname, emp_lname, emp_initial, emp_email_add, emp_phone_num, emp_type, comp_id) FROM stdin;
1	Jansen	Bermuda	G	jansen@gmail.com	912334523	A	1
2	Thirdy	Chou	H	thirdy@gmail.com	989898767	A	2
3	Aj	Dela	I	aj@gmail.com	976876756	A	3
4	Hak	Dog	A	hak@gmail.com	987678543	B	4
\.


--
-- TOC entry 3451 (class 2606 OID 29288)
-- Name: company company_pk; Type: CONSTRAINT; Schema: aggardon; Owner: datama2mi181
--

ALTER TABLE ONLY aggardon.company
    ADD CONSTRAINT company_pk PRIMARY KEY (id);


--
-- TOC entry 3449 (class 2606 OID 29027)
-- Name: employees employees_un; Type: CONSTRAINT; Schema: aggardon; Owner: datama2mi181
--

ALTER TABLE ONLY aggardon.employees
    ADD CONSTRAINT employees_un UNIQUE (comp_id);


--
-- TOC entry 3453 (class 2606 OID 29294)
-- Name: company company_fk; Type: FK CONSTRAINT; Schema: aggardon; Owner: datama2mi181
--

ALTER TABLE ONLY aggardon.company
    ADD CONSTRAINT company_fk FOREIGN KEY (id) REFERENCES aggardon.employees(comp_id);


--
-- TOC entry 3452 (class 2606 OID 29028)
-- Name: employees employees_fk; Type: FK CONSTRAINT; Schema: aggardon; Owner: datama2mi181
--

ALTER TABLE ONLY aggardon.employees
    ADD CONSTRAINT employees_fk FOREIGN KEY (comp_id) REFERENCES aggardon.employees(comp_id);


-- Completed on 2019-12-16 09:09:55

--
-- PostgreSQL database dump complete
--

