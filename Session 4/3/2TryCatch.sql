/*TRY/CATCH*/


--Whenever there is  atry we should follow it with catch
CREATE PROC AverageBalance(@EmployeeNumberFROM int,@EmployeeNumberTo int,@AverageBalance int OUTPUT) AS        

BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        DECLARE @TotalAmount smallmoney
        DECLARE @NumberOfEmployees int

        BEGIN TRY

            SELECT @TotalAmount=SUM(Amount) FROM tblTransaction
            WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

            SELECT @NumberOfEmployees=COUNT(DISTINCT EmployeeNumber) FROM tblTransaction    
            WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo
            SET AverageBalance=@TotalAmount/@NumberOfEmployees
            RETURN 0
        
        END TRY
        BEGIN CATCH
            SET @AverageBalance=0
            SELECT  ERROR_MESSAGE() AS ErrorMessage,
                    ERROR_LINE AS ErrorLine,
                    ERROR_NUMBER() AS ErrorNumber,          --8134 is zero Error they are predetermined
                    ERROR_PROCEDURE AS ErrorProcedure,
                    ERROR_SEVERITY() AS ErrorSeverity,      --For information only Higher number higher problem 16 is default
                    ERROR_STATE() AS ErrorState
            RETURN 1
        END CATCH
    END
END
GO







/*TRY/CATCH*/