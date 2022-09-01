
# SQL to FM Journal Creator for JHA Symitar

This repository contains code that leverages SQL to create an FM Journal. The FM Journal can be read by a PowerOn to perform batch FM in JHA Symitar.

## Getting Started

### Setup

#### SQL

You will need to create a user defined table type, several functions, and a stored procedure in your SQL database. The SQL code is located in the [SQL](sql) folder and should be run in the following order:

1. Create the user defined table type by running [table.sql](sql/table.sql)
2. Create the `formatting` functions by running [formatting.sql](sql/formatting.sql)
3. Create the `revise` functions by running [revise.sql](sql/revise.sql)
4. Create the `create` functions by running [create.sql](sql/create.sql)
5. Create the `changeline` functions by running [changeline.sql](sql/changeline.sql)
6. Create the stored procedure by running [procedure.sql](sql/procedure.sql)

#### PowerOn

You will need to install the PowerOn in Symitar.  It is located in the `poweron` folder.

## Usage

### SQL

You will need to write a SQL query that returns the data you want to create or revise in the FM Journal.  You will need to have the required columns laid out in the [Functionality](##Functionality) section below.  

You will insert your data into the user defined FMTableType with two columns:
- RecordRow - this defines the record you are targeting and it is created from one of the [create](##Create)  or [revise](##Revise) functions.
- ChangeRow - this defines the change you are making to the record and it is created from one of the [changeline](##Change-Line) functions.

You will then execute the stored procedure `FMOutput` with the FMTableType as the input parameter.

The order of operations is as follows:
- Declare the FMTableType variable
- Insert the data into the FMTableType
- Execute the stored procedure

### PowerOn

You will need to import the output text file into the Letter Files folder in Symitar.  

You can then run the PowerOn through Batch Control to create the FM Journal.

You can then run the FM Journal through Batch Control to perform the actual FM.

## Troubleshooting & Recommendations

The following are some recommendations and troubleshooting tips.

Make sure that whatever you are using to export the SQL generated is done in a way that will preserve line breaks.  If using SSMS, you likely need to do the following:
1. Go to Tools > Options
2. Expand Query Results > SQL Server > Results to Grid
3. Tick Retain CR/LF on copy or save
4. Restart SSMS

Many systems will create the text file as UTF-8 with BOM.  This can cause issues with the PowerOn.  You may be able to use a text editor to save the file as UTF-8 without BOM.  If that does not work you may want to use a PowerShell or Python script to convert the file.

For an easier QA process it is recommended to dump the targeted records and changes into a temp table (or existing table) before inserting it into the FMTableType.  This will allow you to export a CSV of the data as well as the formatted FM Journal.  The CSV will be much easier to read and verify the changes before they are made.

## Examples

Examples are located in the [examples](examples) folder.  

The [Branch Closure](examples/branch_closure.sql) file contains an example of moving Accounts, Shares, and Loans from one branch to another.  It uses the `FMReviseChangeLine` function to update the existing records.

The [Create Account Tracking](examples/create_account_tracking.sql) file contains an example of creating a new Account Tracking record.  It uses the `FMCreateChangeLine` function to create a new record, setting the type, and user defined fields with Date, Character and Money data types.

## Functionality

### Change Line

The change line functionality is used to change the value or set a new one.  The following are the Change Line functions with their input values below them:

- #### FMCreateChangeLine
    This is the change line for the creation of a new record.  The input values are:
    - DataType (Character, Code, Number, Money, Date, Rate)
    - FieldMnemonic (The field mnemonic of the field to be changed)
    - NewValue (The new value to be set)

- #### FMReviseChangeLine
    This is the change line for the revision of an existing record.  The input values are:
    - DataType (Character, Code, Number, Money, Date, Rate)
    - FieldMnemonic (The field mnemonic of the field to be changed)
    - OldValue (The old value to be changed - this will accept a NULL value)
    - NewValue (The new value to be set)

- #### FMExpireWarningChangeLine
    This is the change line for the expiration of a warning.  The input values are:
    - WarningCode (Integer warning code type)
    - DateValue (The date the warning will expire)

- #### FMSetWarningChangeLine
    This is the change line for the setting of a warning without an expiration date.  The input values are:
    - WarningCode (Integer warning code type)

### Create

The Create functions create the targets for new records.  The following are the Create functions with their input values below them:

- #### Account Tracking
    - Account Number

- #### Card Access
    - Account Number
    - Card Locator

- #### Card Name
    - Account Number
    - Card Locator

- #### Card Note
    - Account Number
    - Card Locator

- #### Card
    - Account Number

- #### CP Work Card Note
    - Account Number
    - Work Card Loc

- #### Loan Hold
    - Account Number
    - Loan ID

- #### Loan Name
    - Account Number
    - Loan ID

- #### Loan Note
    - Account Number
    - Loan ID

- #### Loan Pledge
    - Account Number
    - Loan ID

- #### Loan
    - Account Number

- #### Loan Tracking
    - Account Number
    - Loan ID

- #### Loan Transfer
    - Account Number
    - Loan ID

- #### Share Hold
    - Account Number
    - Share ID

- #### Share Name
    - Account Number
    - Share ID

- #### Share Note
    - Account Number
    - Share ID

- #### Share
    - Account Number

- #### Share Tracking
    - Account Number
    - Share ID

- #### Share Transfer
    - Account Number
    - Share ID

### Revise

The Revise functions update existing records.  The following are the Revise functions with their input values below them:

- #### Account 
    - Account Number

- #### Account Tracking 
    - Account Number
    - Tracking Locator

- #### Card Access 
    - Account Number
    - Card Locator
    - Access Locator

- #### Card Name 
    - Account Number
    - Card Locator
    - Name Locator

- #### Card Note 
    - Account Number
    - Card Locator
    - Note Locator

- #### Card 
    - Account Number
    - Card Locator

- #### Loan Hold 
    - Account Number
    - Loan ID
    - Hold Locator

- #### Loan Name 
    - Account Number
    - Loan ID
    - Name Locator

- #### Loan Note 
    - Account Number
    - Loan ID
    - Note Locator

- #### Loan Pledge 
    - Account Number
    - Loan ID
    - Pledge Locator

- #### Loan 
    - Account Number
    - Loan ID

- #### Loan Tracking 
    - Account Number
    - Loan ID
    - Tracking Locator

- #### Loan Transfer 
    - Account Number
    - Loan ID
    - Transfer Locator

- #### Share Hold 
    - Account Number
    - Share ID
    - Hold Locator

- #### Share Name 
    - Account Number
    - Share ID
    - Name Locator

- #### Share Note 
    - Account Number
    - Share ID
    - Note Locator

- #### Share 
    - Account Number
    - Share ID

- #### Share Tracking 
    - Account Number
    - Share ID
    - Tracking Locator

- #### Share Transfer 
    - Account Number
    - Share ID
    - Transfer Locator

## Disclaimer

While a fork of this has been tested and used in a production environment, this was written purely from knowledge and without access to the applicable systems to test this.  If you find any issues or have any recommendations please let me know so we can update this repository for others.

## Authors

* **Tom Barkley** - [tombarkley](https://github.com/tombarkley)


## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
