BEGIN TRANSACTION [Tran1611217473]

    BEGIN TRY

        -- changing table names --
        
        EXEC SP_RENAME 'dbo.board_columns', 'task_board_columns'

        EXEC SP_RENAME 'dbo.user_board_roles', 'user_task_board_roles'
        
        COMMIT TRANSACTION [Tran1611217473]

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION [Tran1611217473]

    END CATCH  

 Go