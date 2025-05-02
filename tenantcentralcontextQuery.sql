-- use `gdtc.training.central`

CREATE TABLE accesskey (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Guid CHAR(36) NOT NULL,
    isActive TINYINT(1) , -- 1 for true, 0 for false
    CreatedOn DateTime 
);

insert into accesskey (Guid, isActive,CreatedOn) values ('0495690e-1c38-4844-a41d-927a6c911091', 1 , current_timestamp())
insert into accesskey (Guid, isActive,CreatedOn) values ('8272971b-095e-4f3c-8272-5305508db95e', 1 , current_timestamp())

select * from accesskey
         
CREATE TABLE tenant_registry (
    Id INT AUTO_INCREMENT PRIMARY KEY,
    Email VARCHAR(200) NOT NULL,
    AuthToken longtext NOT NULL,
    IsActive TINYINT(1), -- 1 for true (active), 0 for false (inactive)
    CreatedOn datetime,
    ChangedOn datetime
);

select * from tenant_registry

