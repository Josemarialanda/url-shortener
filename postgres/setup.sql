CREATE TABLE IF NOT EXISTS user_table (
  api_dev_key   UUID         NOT NULL PRIMARY KEY,
  user_name     VARCHAR(100) NOT NULL,
  user_password VARCHAR(100) NOT NULL,
  UNIQUE (api_dev_key)
);

CREATE TABLE IF NOT EXISTS key_table (
  url_key UUID NOT NULL PRIMARY KEY,
  used         Boolean NOT NULL,
  UNIQUE (url_key)
);

CREATE TABLE IF NOT EXISTS url_table (
  url_key      UUID         NOT NULL PRIMARY KEY REFERENCES key_table (url_key),
  api_dev_key  UUID         NOT NULL REFERENCES user_table (api_dev_key),
  original_url VARCHAR(500) NOT NULL,
  expire_date  TIMESTAMP,
  UNIQUE (url_key)
);