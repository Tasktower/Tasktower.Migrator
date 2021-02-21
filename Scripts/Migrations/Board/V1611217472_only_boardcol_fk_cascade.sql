BEGIN TRANSACTION [Tran1611217472]

    BEGIN TRY
        
        -- removing uneeded fk relation of task card to task board and moving it to column  --

        ALTER TABLE [dbo].[task_cards]   
            DROP CONSTRAINT [fk_task_card_task_board_id_ref_task_board_id]
            
        ALTER TABLE [dbo].[task_cards]
            DROP COLUMN [task_board_id]

        COMMIT TRANSACTION [Tran1611217472]

    END TRY

    BEGIN CATCH

        ROLLBACK TRANSACTION [Tran1611217472]

    END CATCH  

 Go