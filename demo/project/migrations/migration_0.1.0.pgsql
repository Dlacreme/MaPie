-- --
-- Model: users

CREATE TABLE users (
  id UUID PRIMARY KEY,
  email VARCHAR(500) UNIQUE NOT NULL,
  password VARCHAR(500) NOT NULL,
  profile_id UUID UNIQUE,
  role VARCHAR(25) NOT NULL DEFAULT 'user'
);

-- End: users
-- --

-- --
-- Model: user_profiles

CREATE TABLE user_profiles (
  id UUID PRIMARY KEY,
  first_name VARCHAR(255) DEFAULT 'John',
  last_name VARCHAR(255) DEFAULT 'DOE',
  picture_url VARCHAR(1024),
  description text
);

-- End: user_profiles
-- --

-- --
-- Model: user_friends

CREATE TABLE user_friends (
  from_user_id UUID,
  to_user_id UUID,
  created_at TIMESTAMP NOT NULL DEFAULT NOW,
  validated_at TIMESTAMP NULL
);

-- End: user_friends
-- --

-- --
-- Model: groups

CREATE TABLE groups (
  id UUID PRIMARY KEY,
  created_by UUID NOT NULL,
  deleted_at TIMESTAMP NULL DEFAULT NULL
);

-- End: groups
-- --
