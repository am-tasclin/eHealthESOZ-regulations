/*
MIT License

Copyright (c) 2021 Algoritmed

cdret2gen v.1.0

Schema - gen of coding, decoding, regulation and expression, also translation & transcription.
Meta-content-relation DB schema.

Схема - ген кодування, декодування, регулювання та експресії, а також трансляція та транскрипція.
Мета-контентно-реляційна схема БД.
*/

CREATE SEQUENCE dbid2; -- true name 'dbid'
CREATE SCHEMA cdret2gen;

-- Meta --

-- DROP TABLE cdret2gen.doctype;
CREATE TABLE cdret2gen.doctype (
	doctype_id int4 NOT NULL,
	doctype varchar(20) NOT NULL,
	parent_id int4,
	CONSTRAINT c2g_f__doctype_id PRIMARY KEY (doctype_id),
	CONSTRAINT c2g_p__doctype_parent FOREIGN KEY (parent_id) REFERENCES cdret2gen.doctype(doctype_id) ON UPDATE CASCADE
);

-- DROP TABLE cdret2gen.doc;
CREATE TABLE cdret2gen.doc (
	doc_id int8 NOT NULL DEFAULT nextval('dbid'),
	doctype int4,
	reference int8,
	parent int8,
	reference2 int8,
	CONSTRAINT c2g_f__doc_id PRIMARY KEY (doc_id),
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
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (22, 'string', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (23, 'integer', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (24, 'double', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (25, 'timestamp', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (26, 'date', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (27, 'object', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (28, 'array', 18); 
INSERT INTO cdret2gen.doctype (doctype_id, doctype, parent_id) VALUES (29, 'boolean', 18); 
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

-- END: Content --


-- Translate --

-- END: Translate --

