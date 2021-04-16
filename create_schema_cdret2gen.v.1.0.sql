/*
MIT License

Copyright (c) 2021 Algoritmed

cdret2gen v.1.0

Schema - gen of coding, decoding, regulation and expression, also translation & transcription.
Meta-content-relation DB schema.

Схема - ген кодування, декодування, регулювання та експресії, а також трансляція та транскрипція.
Мета-контентно-реляційна схема БД.
*/

CREATE SCHEMA cdret2gen;

-- Meta --

-- DROP TABLE cdret2gen.doctype;
CREATE TABLE cdret2gen.doctype (
	doctype_id int4 NOT NULL,
	doctype varchar(20) NOT NULL,
	parent_id int4 NULL,
	CONSTRAINT c2g_f__doctype_id PRIMARY KEY (doctype_id),
	CONSTRAINT c2g_p__doctype_parent FOREIGN KEY (parent_id) REFERENCES cdret2gen.doctype(doctype_id) ON UPDATE CASCADE
);

-- DROP TABLE cdret2gen.doc;
CREATE TABLE cdret2gen.doc (
	doc_id int8 NOT NULL DEFAULT nextval('dbid'),
	doctype int4 NULL,
	reference int8 NULL,
	parent int8 NULL,
	reference2 int8 NULL,
	CONSTRAINT c2g_f__doc_id PRIMARY KEY (doc_id),
	CONSTRAINT c2g_p__doc_doctype FOREIGN KEY (doctype) REFERENCES cdret2gen.doctype(doctype_id) ON UPDATE CASCADE,
	CONSTRAINT c2g_p__doc_reference FOREIGN KEY (reference) REFERENCES cdret2gen.doc(doc_id) ON UPDATE CASCADE
);
-- END: Meta --

-- Content --

-- END: Content --


-- Translate --

-- END: Translate --

