BEGIN TRANSACTION [Tran1611217471]

	BEGIN TRY
		INSERT INTO [dbo].[task_boards]
		(
			[id], 
			[created_at], 
			[created_by], 
			[modified_at], 
			[modified_by], 
			[version],
			[title], 
			[description]
		)
		VALUES 
		(
			'10c4423e-f36b-1410-8b44-00b9bc230c18', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'Admin test tasks', 
			'Test task board for admin'
		);

		INSERT INTO [dbo].[user_board_roles]
		(
			[created_at], 
			[created_by], 
			[modified_at], 
			[modified_by], 
			[version],
			[task_board_id], 
			[user_id], 
			[role]
		)
		VALUES 
		(
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'10c4423e-f36b-1410-8b44-00b9bc230c18', 
			'auth0|60321d95af5046006962959c', 
			'OWNER'
		);

		INSERT INTO [dbo].[board_columns]
		(
			[id],
			[created_at],
			[created_by],
			[modified_at],
			[modified_by],
			[version],
			[task_board_id],
			[name]
		)
		VALUES
		(
			'20c00111-f36b-1410-8b44-00b9bc230c18',
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'10c4423e-f36b-1410-8b44-00b9bc230c18',
			'To Do'
		),
		(
			'20c00111-f36b-1410-8b44-00b9bc230c19',
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'10c4423e-f36b-1410-8b44-00b9bc230c18',
			'Doing'
		),
		(
			'20c00111-f36b-1410-8b44-00b9bc230c20',
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'10c4423e-f36b-1410-8b44-00b9bc230c18',
			'Done'
		)

		INSERT INTO [dbo].[task_cards]
		(
			[id],
			[created_at],
			[created_by],
			[modified_at],
			[modified_by],
			[version],
			[name],
			[mk_description],
			[task_board_id],
			[board_column_id]
		)
		VALUES
		(
			'30c00111-f36b-1410-8b44-00b9bc230c20',
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'Turn off the stove',
			'# Do not forget',
			'10c4423e-f36b-1410-8b44-00b9bc230c18',
			NULL
		),
		(
			'30c00111-f36b-1410-8b44-00b9bc230c21',
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'Buy toilet paper',
			'People are running out which is bad \ # Stores that still have them \ - costco \ - keyfood',
			'10c4423e-f36b-1410-8b44-00b9bc230c18',
			'20c00111-f36b-1410-8b44-00b9bc230c18'
		),
		(
			'30c00111-f36b-1410-8b44-00b9bc230c22',
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'Do your homework',
			'I sure love procrastination',
			'10c4423e-f36b-1410-8b44-00b9bc230c18',
			'20c00111-f36b-1410-8b44-00b9bc230c19'
		),
		(
			'30c00111-f36b-1410-8b44-00b9bc230c23',
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			CAST(GETDATE() AS DATETIME2), 
			'admin@admin.com', 
			0,
			'Brush teeth',
			'Do it',
			'10c4423e-f36b-1410-8b44-00b9bc230c18',
			'20c00111-f36b-1410-8b44-00b9bc230c20'
		)

        COMMIT TRANSACTION [Tran1611217470]

	END TRY

	BEGIN CATCH

		ROLLBACK TRANSACTION [Tran1611217471]

	END CATCH  

GO