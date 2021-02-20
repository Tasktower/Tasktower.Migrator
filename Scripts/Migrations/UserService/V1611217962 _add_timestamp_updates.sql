CREATE TRIGGER [dbo].[updateDatetime]
ON [dbo].[user_profiles]
AFTER INSERT, UPDATE 
AS UPDATE [dbo].[user_profiles] SET updated_at = GETDATE()
	FROM [user_profiles] t
		INNER JOIN inserted i
			ON t.ID = i.ID
GO