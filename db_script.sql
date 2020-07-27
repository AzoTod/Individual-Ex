CREATE TABLE ProductGroups(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(50) UNIQUE
);

CREATE TABLE Products(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Number INT UNIQUE NOT NULL,
	ProductGroupId INT NOT NULL,
	CONSTRAINT FK_Product_ProductGroup FOREIGN KEY
	Products(ProductGroupId) REFERENCES ProductGroups(Id)
);

CREATE TABLE PriceLists(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	ProductId INT NOT NULL,
	Price INT NOT NULL,
	CONSTRAINT FK_PriceList_Product FOREIGN KEY
	PriceLists(ProductId) REFERENCES Products(Id)
);

CREATE TABLE CompanyHeads(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	FullName VARCHAR(50) NOT NULL,
	Position VARCHAR(50) NOT NULL
);

CREATE TABLE MarketingDepartments(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	HeadFullName VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(20) NOT NULL
);

CREATE TABLE Companies(
	Id INT AUTO_INCREMENT PRIMARY KEY,
	Name VARCHAR(100) UNIQUE NOT NULL,
	StatisticalCode INT UNIQUE NOT NULL,
	Address VARCHAR(50),
	PhoneNumber VARCHAR(20),
	PriceListId INT NOT NULL,
	CompanyHeadId INT NOT NULL,
	MarketingDepartmentId INT NOT NULL,
	ContactPersonFullName VARCHAR(50) NOT NULL,
	CONSTRAINT FK_Company_PriceList FOREIGN KEY
	Companies(PriceListId) REFERENCES PriceLists(Id),
	CONSTRAINT FK_Company_CompanyHead FOREIGN KEY
	Companies(CompanyHeadId) REFERENCES CompanyHeads(Id),
	CONSTRAINT FK_Company_MarketingDepartment FOREIGN KEY
	Companies(MarketingDepartmentId) REFERENCES MarketingDepartments(Id)
);

