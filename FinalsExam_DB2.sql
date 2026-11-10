
-- DATABASE 2: ENCRYPTED DATABASE

USE CompanyDB2;

-- DATABASE USER PASSWORD
CREATE USER 'companyuser'@'localhost'
IDENTIFIED BY 'Company@2026Secure';

GRANT ALL PRIVILEGES ON CompanyDB2.*
TO 'companyuser'@'localhost';

-- ENCRYPTION KEY
SET @key = 'MySecureKey2026';

-- CREATE ENCRYPTED TABLE
CREATE TABLE Profile_Encrypted (
    Profile_ID VARBINARY(255) PRIMARY KEY,
    Name VARBINARY(255),
    Address VARBINARY(255),
    Age VARBINARY(255),
    Department VARBINARY(255),
    Position VARBINARY(255)
);

-- COPY AND ENCRYPT DATA
INSERT INTO Profile_Encrypted
SELECT
    AES_ENCRYPT(CAST(Profile_ID AS CHAR), @key),
    AES_ENCRYPT(Name, @key),
    AES_ENCRYPT(Address, @key),
    AES_ENCRYPT(CAST(Age AS CHAR), @key),
    AES_ENCRYPT(Department, @key),
    AES_ENCRYPT(Position, @key)
FROM CompanyDB1.Profile;

-- DECRYPT SECOND AND THIRD RECORDS
SELECT
    CAST(AES_DECRYPT(Profile_ID, @key) AS CHAR) AS Profile_ID,
    CAST(AES_DECRYPT(Name, @key) AS CHAR) AS Name,
    CAST(AES_DECRYPT(Address, @key) AS CHAR) AS Address,
    CAST(AES_DECRYPT(Age, @key) AS CHAR) AS Age,
    CAST(AES_DECRYPT(Department, @key) AS CHAR) AS Department,
    CAST(AES_DECRYPT(Position, @key) AS CHAR) AS Position
FROM Profile_Encrypted
WHERE CAST(AES_DECRYPT(Profile_ID, @key) AS CHAR)
IN ('2', '3');

-- DISPLAY ALL ENCRYPTED DATA
SELECT
    HEX(Profile_ID) AS Encrypted_ID,
    HEX(Name) AS Encrypted_Name,
    HEX(Address) AS Encrypted_Address,
    HEX(Age) AS Encrypted_Age,
    HEX(Department) AS Encrypted_Department,
    HEX(Position) AS Encrypted_Position
FROM Profile_Encrypted;
