enum ScoutingGenerationItemTypes {
  ScoutingShotCounter,
  ScoutingDropdownButtonFormField,
  ScoutingTextFormField,
  ScoutingCheckbox,
  ScoutingButtonTimer,
  Field
}

enum SqlParamType {
  VARCHAR,
  CHAR,
  TINYINT,
  SMALLINT,
  MEDIUMINT,
  INT,
  BIGINT,
  TEXT,
  TINYTEXT,
  LONGTEXT,
  TIMESTAMP,
  DOUBLE,
  FLOAT
}

enum KeyType {
  PRIMARY_KEY,
  UNIQUE_KEY,
  INDEX,
}

enum DefaultType {
  NULL,
  CURRENT_TIMESTAMP,
  AS_DEFINED
}

enum Attributes {
  BINARY,
  UNSIGNED,
  UNSIGNED_ZEROFILL,
  ON_UPDATE_CURRENT_TIMESTAMP
}

enum ConstraintsTables{
  MATCHES,
  TEAMS,
}
