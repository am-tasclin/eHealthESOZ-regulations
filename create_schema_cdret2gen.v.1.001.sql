/*
MIT License

Copyright (c) 2021 Algoritmed

cdret2gen v.1.001

Schema - gen of coding, decoding, regulation and expression, also translation & transcription. cdret2gen
Self-similar-Meta-Content relation DB schema. SMCrDB

Схема - ген кодування, декодування, регулювання та експресії, а також трансляція та транскрипція. кдрет2ген
Самоподібна-Мета-Контентно реляційна схема БД. СМКрДБ
*/

-- CREATE SEQUENCE dbid; -- true name 'dbid'
CREATE SCHEMA cdret2gen;

-- Meta --

-- DROP TABLE cdret2gen.doctype;
CREATE TABLE cdret2gen.doctype (
	doctype_id int4 NOT NULL,
	doctype varchar(20) NOT NULL,
	parent_id int4,
	CONSTRAINT c2g_f__doctype PRIMARY KEY (doctype_id),
	CONSTRAINT c2g_p__doctype_parent FOREIGN KEY (parent_id) REFERENCES cdret2gen.doctype(doctype_id) ON UPDATE CASCADE
);

-- DROP TABLE cdret2gen.doc;
CREATE TABLE cdret2gen.doc (
	doc_id int8 NOT NULL DEFAULT nextval('dbid'),
	doctype int4,
	reference int8,
	parent int8,
	reference2 int8,
	CONSTRAINT c2g_f__doc PRIMARY KEY (doc_id),
	CONSTRAINT c2g_p__doc_doctype FOREIGN KEY (doctype) REFERENCES cdret2gen.doctype(doctype_id) ON UPDATE CASCADE,
	CONSTRAINT c2g_p__doc_reference FOREIGN KEY (reference) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE,
	CONSTRAINT c2g_p__doc_reference2 FOREIGN KEY (reference2) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE,
	CONSTRAINT c2g_p__doc_parent FOREIGN KEY (parent) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE
);
-- Meta Init --
---
--- Table: cdret2gen.doctype
---
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (14, 'folder', NULL); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (17, 'doc', NULL); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (18, 'element', 17); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (20, 'UUID', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (22, 'string', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (23, 'integer', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (24, 'double', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (25, 'timestamp', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (26, 'date', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (27, 'object', 18); 
-- array of objects
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (28, 'array', 18); 
-- array of simple types
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (30, 'UUID', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (32, 'string', 28); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (33, 'integer', 28); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (34, 'double', 28); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (35, 'timestamp', 28); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (36, 'date', 28); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (37, 'object', 28); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (58, 'string_u', NULL);

-- END: Meta Init --

-- END: Meta --


-- Content --

-- DROP TABLE cdret2gen.string;
CREATE TABLE cdret2gen.string (
	string_id int4 NOT NULL,
	value varchar(1200),
	CONSTRAINT c2g_p__string PRIMARY KEY (string_id),
	CONSTRAINT c2g_f__doc_string FOREIGN KEY (string_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE cdret2gen."integer";
CREATE TABLE cdret2gen."integer" (
	integer_id int4 NOT NULL,
	value int4 ,
	CONSTRAINT c2g_p__integer PRIMARY KEY (integer_id),
	CONSTRAINT c2g_f__doc_integer FOREIGN KEY (integer_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE cdret2gen."double";
CREATE TABLE cdret2gen."double" (
	double_id int4 NOT NULL,
	value float4,
	CONSTRAINT c2g_p__double PRIMARY KEY (double_id),
	CONSTRAINT c2g_f__doc_double FOREIGN KEY (double_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE cdret2gen."date";
CREATE TABLE cdret2gen."date" (
	date_id int4 NOT NULL,
	value date DEFAULT now(),
	CONSTRAINT c2g_p__date PRIMARY KEY (date_id),
	CONSTRAINT c2g_f__doc_date FOREIGN KEY (date_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE cdret2gen."timestamp";
CREATE TABLE cdret2gen."timestamp" (
	timestamp_id int4 NOT NULL,
	value timestamptz DEFAULT now(),
	CONSTRAINT c2g_p__timestamp PRIMARY KEY (timestamp_id),
	CONSTRAINT c2g_f__doc_timestamp FOREIGN KEY (timestamp_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE cdret2gen.docbody;
CREATE TABLE cdret2gen.docbody (
	docbody_id int4 NOT NULL,
	docbody varchar(1000000),
	CONSTRAINT c2g_p__docbody PRIMARY KEY (docbody_id),
	CONSTRAINT c2g_f__doc_docbody FOREIGN KEY (docbody_id) REFERENCES cdret2gen.doc(doc_id)
);

-- DROP TABLE cdret2gen.sort;
CREATE TABLE cdret2gen.sort (
	sort_id int4 NOT NULL,
	sort int8,
	treelevel int2 NULL,
	CONSTRAINT c2g_p__sort PRIMARY KEY (sort_id),
	CONSTRAINT c2g_f__doc_sort FOREIGN KEY (sort_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE cdret2gen.string_u;
CREATE TABLE cdret2gen.string_u (
	string_u_id int4 NOT NULL,
	group_id int4 NOT NULL,
	value varchar(100),
	CONSTRAINT c2g_p__string_u PRIMARY KEY (string_u_id),
	CONSTRAINT c2g_unq__string_u UNIQUE (group_id, value),
	CONSTRAINT c2g_f__doc_string_u FOREIGN KEY (string_u_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE,
	CONSTRAINT c2g_f__doctype_string_u FOREIGN KEY (group_id) REFERENCES cdret2gen.doctype(doctype_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- END: Content --


-- Translate --
-- DROP TABLE cdret2gen.translate_id;
CREATE TABLE cdret2gen.translate_id (
	this_id int4 NOT NULL,
	extra_id int4 NOT NULL,
	db_id int4 NOT NULL,
	CONSTRAINT c2g_p__translate_id PRIMARY KEY (this_id),
	CONSTRAINT c2g_unq_db_id UNIQUE (db_id, extra_id),
	CONSTRAINT c2g_f__doctype_db_id FOREIGN KEY (db_id) REFERENCES cdret2gen.doctype(doctype_id) ON UPDATE CASCADE,
	CONSTRAINT c2g_f__doc_translate_id FOREIGN KEY (this_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- DROP TABLE cdret2gen.code;
CREATE TABLE cdret2gen.code (
	code_id int4 NOT NULL,
	code int4 NOT NULL DEFAULT nextval('codeid'::regclass),
	CONSTRAINT c2g_p__code_id PRIMARY KEY (code_id),
	CONSTRAINT c2g_f__doc_code FOREIGN KEY (code_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE
);


-- DROP TABLE cdret2gen.uuid;
CREATE TABLE cdret2gen.uuid (
	uuid_id int4 NOT NULL,
	value varchar(36),
	CONSTRAINT c2g_p__uuid PRIMARY KEY (uuid_id),
	CONSTRAINT c2g_unq__uuid UNIQUE (value),
	CONSTRAINT c2g_f__doc_uuid FOREIGN KEY (uuid_id) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE ON DELETE CASCADE
);

-- END: Translate --

