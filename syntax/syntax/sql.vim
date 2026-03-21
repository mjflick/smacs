" Vim syntax file
" Language:    SQL
" Maintainer:  smacs
" License:     GPL v2

if exists("b:current_syntax")
  finish
endif

syn case ignore

" Comments
syn keyword sqlTodo contained TODO FIXME XXX BUG NOTE HACK WARN
syn region sqlComment start="--" end="$" contains=sqlTodo
syn region sqlComment start="/\*" end="\*/" contains=sqlTodo

" Strings
syn region sqlString start=+'+ skip=+''+ end=+'+
syn region sqlIdentifier start=+"+ skip=+""+ end=+"+

" Numbers
syn match sqlNumber "\<\d\+\>"
syn match sqlNumber "\<\d\+\.\d*\>"
syn match sqlNumber "\<\.\d\+\>"
syn match sqlNumber "\<\d\+[eE][+-]\?\d\+\>"
syn match sqlNumber "\<\d\+\.\d*[eE][+-]\?\d\+\>"

" DML Keywords
syn keyword sqlKeyword SELECT FROM WHERE AND OR NOT IN BETWEEN LIKE IS
syn keyword sqlKeyword NULL AS ON JOIN LEFT RIGHT INNER OUTER FULL CROSS
syn keyword sqlKeyword NATURAL USING GROUP BY HAVING ORDER ASC DESC
syn keyword sqlKeyword LIMIT OFFSET FETCH FIRST NEXT ROWS ONLY
syn keyword sqlKeyword UNION INTERSECT EXCEPT ALL DISTINCT EXISTS ANY SOME
syn keyword sqlKeyword INSERT INTO VALUES UPDATE SET DELETE MERGE TRUNCATE
syn keyword sqlKeyword WITH RECURSIVE

" Conditional
syn keyword sqlConditional CASE WHEN THEN ELSE END IF

" DDL Keywords
syn keyword sqlStatement CREATE ALTER DROP TABLE VIEW INDEX SEQUENCE
syn keyword sqlStatement TRIGGER FUNCTION PROCEDURE DATABASE SCHEMA TYPE
syn keyword sqlStatement DOMAIN CONSTRAINT PRIMARY KEY FOREIGN REFERENCES
syn keyword sqlStatement UNIQUE CHECK DEFAULT AUTO_INCREMENT SERIAL IDENTITY
syn keyword sqlStatement CASCADE RESTRICT REPLACE TEMPORARY TEMP MATERIALIZED
syn keyword sqlStatement GRANT REVOKE COMMIT ROLLBACK SAVEPOINT BEGIN
syn keyword sqlStatement TRANSACTION WORK EXPLAIN ANALYZE VACUUM

" Types
syn keyword sqlType INTEGER INT SMALLINT BIGINT DECIMAL NUMERIC REAL
syn keyword sqlType FLOAT DOUBLE PRECISION BOOLEAN BOOL CHAR VARCHAR
syn keyword sqlType TEXT CLOB BLOB BINARY VARBINARY DATE TIME TIMESTAMP
syn keyword sqlType TIMESTAMPTZ INTERVAL UUID JSON JSONB XML ARRAY
syn keyword sqlType BYTEA MONEY INET CIDR MACADDR POINT LINE POLYGON
syn keyword sqlType CIRCLE BIT SERIAL BIGSERIAL SMALLSERIAL

" Functions
syn keyword sqlFunction COUNT SUM AVG MIN MAX ABS CEIL CEILING FLOOR
syn keyword sqlFunction ROUND TRUNC MOD POWER SQRT LOG LN EXP SIGN RANDOM
syn keyword sqlFunction LENGTH CHAR_LENGTH UPPER LOWER TRIM LTRIM RTRIM
syn keyword sqlFunction LPAD RPAD SUBSTRING SUBSTR POSITION REPLACE REVERSE
syn keyword sqlFunction REPEAT LEFT RIGHT CONCAT CONCAT_WS SPLIT_PART
syn keyword sqlFunction STRING_AGG ARRAY_AGG JSON_AGG COALESCE NULLIF
syn keyword sqlFunction GREATEST LEAST CAST CONVERT EXTRACT DATE_PART
syn keyword sqlFunction DATE_TRUNC NOW CURRENT_DATE CURRENT_TIME
syn keyword sqlFunction CURRENT_TIMESTAMP CURRENT_USER SESSION_USER AGE
syn keyword sqlFunction TO_CHAR TO_DATE TO_TIMESTAMP TO_NUMBER
syn keyword sqlFunction ROW_NUMBER RANK DENSE_RANK NTILE LAG LEAD
syn keyword sqlFunction FIRST_VALUE LAST_VALUE NTH_VALUE OVER PARTITION
syn keyword sqlFunction WINDOW UNBOUNDED PRECEDING FOLLOWING CURRENT ROW
syn keyword sqlFunction LISTAGG GROUP_CONCAT IIF IFNULL NVL NVL2 DECODE
syn keyword sqlFunction REGEXP_REPLACE REGEXP_MATCHES REGEXP_SUBSTR

" Operators
syn match sqlOperator /[=<>!]\+/
syn match sqlOperator /||/
syn match sqlOperator /::/
syn match sqlOperator /\.\./

" Special
syn match sqlVariable /\<:\w\+/
syn match sqlVariable /@\w\+/
syn match sqlWildcard /\*/

" Parenthesized function calls
syn match sqlFunctionCall /\<\w\+\>\ze\s*(/

hi def link sqlComment Comment
hi def link sqlTodo Todo
hi def link sqlString String
hi def link sqlIdentifier Identifier
hi def link sqlNumber Number
hi def link sqlKeyword Keyword
hi def link sqlConditional Conditional
hi def link sqlStatement Statement
hi def link sqlType Type
hi def link sqlFunction Function
hi def link sqlFunctionCall Function
hi def link sqlOperator Operator
hi def link sqlVariable Identifier
hi def link sqlWildcard Special

let b:current_syntax = "sql"
