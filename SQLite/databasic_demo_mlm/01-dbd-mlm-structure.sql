CREATE TABLE dealers (
    id                 INTEGER         PRIMARY KEY ASC AUTOINCREMENT
                                       NOT NULL,
    id_parent          INTEGER         CONSTRAINT FK_dealers_id_id_parent REFERENCES dealers (id) ON DELETE NO ACTION
                                                                                                  ON UPDATE NO ACTION,
    name               VARCHAR (64)    NOT NULL,
    surname            VARCHAR (64),
    description        TEXT,
    turn_over_excl_vat DECIMAL (12, 2) NOT NULL
                                       DEFAULT (0),
    turn_over_incl_vat DECIMAL (12, 2) NOT NULL
                                       DEFAULT (0) 
);
CREATE INDEX dealers_name ON dealers (name ASC);
CREATE INDEX dealers_surname ON dealers (surname ASC);
CREATE INDEX dealers_turn_over_excl_vat ON dealers (turn_over_excl_vat ASC);
CREATE INDEX dealers_turn_over_incl_vat ON dealers (turn_over_incl_vat ASC);
CREATE INDEX dealers_description ON dealers (description ASC);

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
CREATE INDEX clients_name ON clients (name ASC);
CREATE INDEX clients_fullname ON clients (fullname ASC);
CREATE INDEX clients_discount ON clients (discount ASC);
CREATE INDEX clients_street ON clients (street ASC);
CREATE INDEX clients_city ON clients (city ASC);
CREATE INDEX clients_zip ON clients (zip ASC);
CREATE INDEX clients_region ON clients (region ASC);
CREATE INDEX clients_country ON clients (country ASC);

CREATE TABLE orders (
    id             INTEGER         PRIMARY KEY ASC AUTOINCREMENT,
    id_dealer      INTEGER         CONSTRAINT FK_orders_dealers REFERENCES dealers (id) ON DELETE NO ACTION
                                                                                        ON UPDATE NO ACTION,
    id_client      INTEGER         CONSTRAINT FK_orders_clients REFERENCES clients (id) ON DELETE NO ACTION
                                                                                        ON UPDATE NO ACTION,
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
CREATE INDEX orders_price_excl_vat ON orders (price_excl_vat ASC);
CREATE INDEX orders_price_incl_vat ON orders (price_incl_vat ASC);
CREATE INDEX orders_date_submit ON orders (date_submit ASC);
CREATE INDEX orders_date_dispatch ON orders (date_dispatch ASC);
CREATE INDEX orders_paid ON orders (paid ASC);
CREATE INDEX orders_status ON orders (status ASC);