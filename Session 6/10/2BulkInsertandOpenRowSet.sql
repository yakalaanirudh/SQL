/*BULK INSERT AND OPENROWSET*/

DROP TABLE #tblXML
GO

CREATE TABLE #tblXML(XmlCol XML)
GO

BULK INSERT #tblXML FROM 'C:\XML\SampleDataBulkInsert.txt'          --BULK INSERT
SELECT * FROM #tblXML

DROP TABLE #tblXML
GO

CREATE TABLE #tblXML(IntCol INT, XmlCol XML)
GO

INSERT INTO #tblXML(XmlCol)
SELECT * FROM                                                               --OPENROWSET
openrowset(BULK 'C:\XML\SampleDataOpenRowset.txt', SINGLE_BLOB) AS x        --Just write SINGLE_BLOB and alias it
SELECT * FROM #tblXML







/*BULK INSERT AND OPENROWSET*/