-- AlterTable.sql

-- Add a column to track the number of rentals for each dress
ALTER TABLE Dress ADD (RentalCount NUMBER(5) DEFAULT 0);

-- Add a column to track customer loyalty points
ALTER TABLE Customer ADD (LoyaltyPoints NUMBER(5) DEFAULT 0);

-- Add a column to track employee performance
ALTER TABLE Employee ADD (PerformanceRating NUMBER(2,1) DEFAULT 3.0);
