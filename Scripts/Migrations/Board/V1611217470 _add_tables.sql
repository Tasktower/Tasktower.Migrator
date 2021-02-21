BEGIN TRANSACTION [Tran1611217470]

    BEGIN TRY

        CREATE TABLE [dbo].[task_boards]
        (

            [id] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
            [created_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [created_by] NVARCHAR(300) NOT NULL,
            [modified_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [modified_by] NVARCHAR(300) NOT NULL,
            [version] INTEGER NOT NULL DEFAULT 0,
            [title] NVARCHAR(100) NOT NULL,
            [description] NVARCHAR(500) NOT NULL DEFAULT '',
            CONSTRAINT [pk_task_boards_id] 
                PRIMARY KEY CLUSTERED ([id]),
        )

        CREATE TABLE [dbo].[user_board_roles]
        (
            [created_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [created_by] NVARCHAR(300) NOT NULL,
            [modified_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [modified_by] NVARCHAR(300) NOT NULL,
            [version] INTEGER NOT NULL DEFAULT 0,
            [task_board_id] UNIQUEIDENTIFIER NOT NULL,
            [user_id] NVARCHAR(100) NOT NULL,
            [role] NVARCHAR(20) NOT NULL,
            CONSTRAINT [pk_user_board_rules_user_id_task_board_id]
                PRIMARY KEY NONCLUSTERED ([task_board_id], [user_id]),
            CONSTRAINT [fk_user_board_rules_task_board_id_ref_task_board_id]
                FOREIGN KEY ([task_board_id]) 
                REFERENCES [dbo].[task_boards]([id])
                ON DELETE CASCADE
        )

        CREATE TABLE [dbo].[board_columns]
        (

            [id] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
            [created_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [created_by] NVARCHAR(300) NOT NULL,
            [modified_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [modified_by] NVARCHAR(300) NOT NULL,
            [version] INTEGER NOT NULL DEFAULT 0,
            [task_board_id] UNIQUEIDENTIFIER NOT NULL,
            [name] NVARCHAR(100) NOT NULL,
            CONSTRAINT [pk_board_column_id] 
                PRIMARY KEY CLUSTERED ([id]),
            CONSTRAINT [fk_board_column_task_board_id_ref_task_board_id] 
                FOREIGN KEY ([task_board_id]) 
                REFERENCES [dbo].[task_boards]([id])
                ON DELETE CASCADE
        )

        CREATE TABLE [dbo].[task_cards]
        (

            [id] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWSEQUENTIALID(),
            [created_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [created_by] NVARCHAR(300) NOT NULL,
            [modified_at] DATETIME2 DEFAULT GETDATE() NOT NULL,
            [modified_by] NVARCHAR(300) NOT NULL,
            [version] INTEGER NOT NULL DEFAULT 0,
            [name] NVARCHAR(100) NOT NULL,
            [mk_description] NVARCHAR(MAX) NOT NULL DEFAULT '',
            [task_board_id] UNIQUEIDENTIFIER NOT NULL,
            [board_column_id] UNIQUEIDENTIFIER,
            CONSTRAINT [pk_task_card_id] 
                PRIMARY KEY CLUSTERED ([id]),
            CONSTRAINT [fk_task_card_task_board_id_ref_task_board_id] 
                FOREIGN KEY ([task_board_id]) 
                REFERENCES [dbo].[task_boards]([id])
                ON DELETE CASCADE,
            CONSTRAINT [fk_task_card_board_column_id_ref_board_column_id] 
                FOREIGN KEY ([board_column_id]) 
                REFERENCES [dbo].[board_columns]([id])
                ON DELETE NO ACTION
        )

        COMMIT TRANSACTION [Tran1611217470]

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION [Tran1611217470]

    END CATCH  

 Go