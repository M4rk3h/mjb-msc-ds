Centre
    CenterNo (PK)

Salesman
    SalesmanNo(PK)  Name PhoneNo DOB    SaleDate    CenterNo (FK) CarSale(FK)

CarSale
    CarSaleNo(PK)   CustomerNo CarSaleDate  IsInvoice PetrolPre PetrolPost  BadDebtor GarageNo(FK)

Customer
    CustomerNo(PK)  Name PhoneNo DOB  OnCredit    BadDebtor

Commission
    ComissionNo(PK)     Percent
    1                   2

Garage
    GarageNo(PK) CarSaleNo