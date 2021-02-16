
CREATE TABLE [dbo].user_profiles
(
    id uniqueidentifier NOT NULL DEFAULT NEWID() CONSTRAINT users_pk PRIMARY KEY,
    created_at datetime DEFAULT GETDATE(),
    updated_at datetime DEFAULT GETDATE(),
    name character varying(100) NOT NULL,
)

GO