CREATE PROC AverageBalance(@EmployeeNumberFROM int,@EmployeeNumberTo int,@AverageBalance int OUTPUT) AS        
--Output is telling SQL that is something to export
BEGIN
    IF EXISTS(SELECT * FROM tblEmployee where EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo)
    BEGIN
        DECLARE @TotalAmount smallmoney
        DECLARE @NumberOfEmployees int

        SELECT @TotalAmount=SUM(Amount) FROM tblTransaction
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        SELECT @NumberOfEmployees=COUNT(DISTINCT EmployeeNumber) FROM tblTransaction    
        WHERE EmployeeNumber BETWEEN @EmployeeNumberFrom AND @EmployeeNumberTo

        IF @NumberOfEmployees=0
            SET @AverageBalance=0
        ELSE
            SET AverageBalance=@TotalAmount/@NumberOfEmployees
    END
END
GO


DECLARE @NumberRows int,@ReturnStatus int
EXEC @ReturnStatus=AverageBalance 4,5,@NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount,@ReturnStatus as Return_Status


DECLARE @NumberRows int,@ReturnStatus int
EXECUTE @ReturnStatus=AverageBalance 223,227,@NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount,@ReturnStatus as Return_Status


DECLARE @NumberRows int,@ReturnStatus int
EXECUTE @ReturnStatus=AverageBalance @EmployeeNumberFrom=223,@EmployeeNumberTo=227,@AverageBalance=@NumberRows OUTPUT
SELECT @NumberRows AS MyRowCount,@ReturnStatus as Return_Status