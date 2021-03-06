CREATE TABLE dealers (
    id                 INTEGER         PRIMARY KEY ASC AUTOINCREMENT
                                       NOT NULL,
    id_parent          INTEGER         CONSTRAINT FK_dealers_id_id_parent REFERENCES dealers (id) ON DELETE RESTRICT
                                                                                                  ON UPDATE RESTRICT,
    name               VARCHAR (64)    NOT NULL,
    surname            VARCHAR (64),
    description        TEXT,
    turn_over_excl_vat DECIMAL (12, 2) NOT NULL
                                       DEFAULT (0),
    turn_over_incl_vat DECIMAL (12, 2) NOT NULL
                                       DEFAULT (0) 
);
CREATE TABLE clients (
    id       INTEGER        PRIMARY KEY ASC AUTOINCREMENT
                            NOT NULL,
    name     VARCHAR (64)   NOT NULL,
    fullname VARCHAR (128),
    discount DECIMAL (5, 2) NOT NULL
                            DEFAULT (0),
    street   VARCHAR (64),
    city     VARCHAR (64),
    zip      VARCHAR (10),
    region   VARCHAR (64),
    country  VARCHAR (64) 
);
CREATE TABLE orders (
    id             INTEGER         PRIMARY KEY ASC AUTOINCREMENT,
    id_dealer      INTEGER         CONSTRAINT FK_orders_dealers REFERENCES dealers (id) ON DELETE RESTRICT
                                                                                        ON UPDATE RESTRICT,
    id_client      INTEGER         CONSTRAINT FK_orders_clients REFERENCES clients (id) ON DELETE RESTRICT
                                                                                        ON UPDATE RESTRICT,
    price_excl_vat DECIMAL (12, 2) NOT NULL
                                   DEFAULT (0),
    price_incl_vat DECIMAL (12, 2) NOT NULL
                                   DEFAULT (0),
    date_submit    DATETIME        DEFAULT (now() ) 
                                   NOT NULL,
    date_dispatch  DATETIME,
    paid           INT (1)         DEFAULT (0) 
                                   NOT NULL,
    status         VARCHAR (10)    DEFAULT NEW
                                   NOT NULL
);